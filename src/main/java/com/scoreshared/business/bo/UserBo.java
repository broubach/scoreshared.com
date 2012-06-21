package com.scoreshared.business.bo;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.File;
import com.scoreshared.business.persistence.Profile;
import com.scoreshared.business.persistence.User;

@Component("userBo")
public class UserBo extends BaseBo<User> implements UserDetailsService {

    public static final String DEFAULT_AVATAR_KEY = "defaultAvatarKey";
    private static final Integer DEFAULT_AVATAR_ID = 4;
    public static final String SMALL_DEFAULT_AVATAR_KEY = "smallDefaultAvatarKey";
    private static final Integer SMALL_DEFAULT_AVATAR_ID = 7;
    public static final String CURRENT_USERS_AVATAR = "currentUsersAvatar";
    public static final int SMALL_AVATAR_HEIGHT = 49;
    public static final int SMALL_AVATAR_WIDTH = 37;
    public static final int DEFAULT_AVATAR_HEIGHT = 162;
    public static final int DEFAULT_AVATAR_WIDTH = 123;

    @Inject
    private Md5PasswordEncoder passwordEncoder;

    public void save(User user) {
        dao.saveOrUpdate(user);
    }

    public void save(Profile profile) {
        dao.saveOrUpdate(profile);
    }

    public boolean checkEmailExists(String email) {
        return !dao.findByNamedQuery("existentEmailQuery", email).isEmpty();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> result = dao.findByNamedQuery("existentEmailQuery", username);
        if (result.size() > 0) {
            return result.get(0).toSecurityUser();
        }
        throw new UsernameNotFoundException("no user found");
    }

    public List<Integer> getSmallAvatarIdsByHash(String hash) {
        return dao.findByNamedQuery("smallAvatarIdByHashQuery", hash);
    }

    public List<Integer> getAvatarIdsByHash(String hash) {
        return dao.findByNamedQuery("avatarIdByHashQuery", hash);
    }

    public void cropResizeAndSaveAvatars(User loggedUser, File avatar, int x, int y, int x2, int y2) throws IOException {
        // set image hash into profile
        loggedUser.getProfile().setAvatarHash(
                passwordEncoder.encodePassword(avatar.getData().toString(), avatar.getName()));

        // resize and crop small avatar
        File smallAvatar = (File) avatar.clone();
        smallAvatar.setData(cropAndScaleImage(avatar.getData(), x, y, x2, y2, SMALL_AVATAR_WIDTH, SMALL_AVATAR_HEIGHT));
        smallAvatar.setSize(Long.valueOf(smallAvatar.getData().length));
        smallAvatar.setMime("image/png");
        loggedUser.getProfile().setSmallAvatar(smallAvatar);

        // resize and crop default avatar
        avatar.setData(cropAndScaleImage(avatar.getData(), x, y, x2, y2, DEFAULT_AVATAR_WIDTH, DEFAULT_AVATAR_HEIGHT));
        avatar.setSize(Long.valueOf(avatar.getData().length));
        avatar.setMime("image/png");
        loggedUser.getProfile().setAvatar(avatar);

        dao.saveOrUpdate(loggedUser.getProfile());
    }

    public byte[] cropAndScaleImage(byte[] original, int x1, int y1, int x2, int y2, int width, int height)
            throws IOException {
        BufferedImage bsrc = ImageIO.read(new ByteArrayInputStream(original));
        BufferedImage bdest = null;

        if (x2 - x1 > 0 && y2 - y1 > 0) {
            bdest = getScaledInstance(bsrc.getSubimage(x1, y1, x2 - x1, y2 - y1), width, height,
                    RenderingHints.VALUE_INTERPOLATION_BILINEAR, true);
        } else {
            bdest = getScaledInstance(bsrc, width, height, RenderingHints.VALUE_INTERPOLATION_BILINEAR, true);
        }

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        ImageIO.write(bdest, "PNG", out);

        return out.toByteArray();
    }

    /**
     * Convenience method that returns a scaled instance of the provided
     * {@code BufferedImage}.
     * 
     * @param img
     *            the original image to be scaled
     * @param targetWidth
     *            the desired width of the scaled instance, in pixels
     * @param targetHeight
     *            the desired height of the scaled instance, in pixels
     * @param hint
     *            one of the rendering hints that corresponds to
     *            {@code RenderingHints.KEY_INTERPOLATION} (e.g.
     *            {@code RenderingHints.VALUE_INTERPOLATION_NEAREST_NEIGHBOR},
     *            {@code RenderingHints.VALUE_INTERPOLATION_BILINEAR},
     *            {@code RenderingHints.VALUE_INTERPOLATION_BICUBIC})
     * @param higherQuality
     *            if true, this method will use a multi-step scaling technique
     *            that provides higher quality than the usual one-step technique
     *            (only useful in downscaling cases, where {@code targetWidth}
     *            or {@code targetHeight} is smaller than the original
     *            dimensions, and generally only when the {@code BILINEAR} hint
     *            is specified)
     * @return a scaled version of the original {@code BufferedImage}
     */
    private BufferedImage getScaledInstance(BufferedImage img, int targetWidth, int targetHeight, Object hint,
            boolean higherQuality) {
        int type = (img.getTransparency() == Transparency.OPAQUE) ? BufferedImage.TYPE_INT_RGB
                : BufferedImage.TYPE_INT_ARGB;
        BufferedImage ret = img;
        int w, h;
        if (higherQuality) {
            // Use multi-step technique: start with original size, then
            // scale down in multiple passes with drawImage()
            // until the target size is reached
            w = img.getWidth();
            h = img.getHeight();
        } else {
            // Use one-step technique: scale directly from original
            // size to target size with a single drawImage() call
            w = targetWidth;
            h = targetHeight;
        }

        do {
            if (higherQuality && w > targetWidth) {
                w /= 2;
                if (w < targetWidth) {
                    w = targetWidth;
                }
            } else if (w <= targetWidth) {
                w = targetWidth;
            }

            if (higherQuality && h > targetHeight) {
                h /= 2;
                if (h < targetHeight) {
                    h = targetHeight;
                }
            } else if (h <= targetHeight) {
                h = targetHeight;
            }

            BufferedImage tmp = new BufferedImage(w, h, type);
            Graphics2D g2 = tmp.createGraphics();
            g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, hint);
            g2.drawImage(ret, 0, 0, w, h, null);
            g2.dispose();

            ret = tmp;
        } while (w != targetWidth || h != targetHeight);

        return ret;
    }

    public File getDefaultAvatar() {
        return dao.findByPk(File.class, DEFAULT_AVATAR_ID);
    }

    public File getSmallDefaultAvatar() {
        return dao.findByPk(File.class, SMALL_DEFAULT_AVATAR_ID);
    }

    public File findAvatarByPk(Integer id) {
        return dao.findByPk(File.class, id);
    }

}