package com.scoreshared.business.bo;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.File;
import com.scoreshared.business.persistence.InvitationResponseEnum;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.Profile;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

@Component("userBo")
public class UserBo extends BaseBo<User> implements UserDetailsService {
	
	@Inject
	private GraphBo graphBo;

    public static final String DEFAULT_AVATAR_KEY = "defaultAvatarKey";
    private static final Integer DEFAULT_AVATAR_ID = 4;
    public static final String SMALL_DEFAULT_AVATAR_KEY = "smallDefaultAvatarKey";
    private static final Integer SMALL_DEFAULT_AVATAR_ID = 7;
    public static final String CURRENT_USERS_AVATAR = "currentUsersAvatar";
    public static final int SMALL_AVATAR_HEIGHT = 52;
    public static final int SMALL_AVATAR_WIDTH = 52;
    public static final int DEFAULT_AVATAR_HEIGHT = 104;
    public static final int DEFAULT_AVATAR_WIDTH = 104;

    @Inject
    private Md5PasswordEncoder hashEncoder;

    public boolean checkEmailExists(String email) {
        return !dao.findByNamedQuery("existentEmailQuery", email).isEmpty();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> result = dao.findByNamedQuery("existentEmailQuery", username);
        if (result.size() > 0) {
            return result.get(0);
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
                hashEncoder.encodePassword(avatar.getData().toString(), avatar.getName()));

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
            int croppedWidth = (x2 - x1) > bsrc.getWidth() ? bsrc.getWidth() : (x2 - x1);
            int croppedHeight = (y2 - y1) > bsrc.getHeight() ? bsrc.getHeight() : (y2 - y1);
            bdest = getScaledInstance(bsrc.getSubimage(x1, y1, croppedWidth, croppedHeight), width, height,
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

    /**
     * @param filtersArray 0: firstName; 1: lastName; 2: city; 3: country
     */
    public List<User> findUserDetailsByMailAndProfileInfo(String email, String[] filtersArray) {
        List<User> result = null;

        if (email != null && !email.isEmpty()) {
            // search by email
            result = dao.findByNamedQuery("existentEmailQuery", email);

        } else {
            // search by other non unique fields
            for (int i = 0; i < filtersArray.length; i++) {
                if (filtersArray[i] != null) {
                    if (filtersArray[i].isEmpty()) {
                        filtersArray[i] = null;
                    } else {
                        filtersArray[i] = new StringBuilder().append("%").append(filtersArray[i]).append("%")
                                .toString();
                    }
                }
            }

            Map<String, String> filters = new HashMap<String, String>();
            filters.put("firstName", filtersArray[0]);
            filters.put("lastName", filtersArray[1]);
            filters.put("city", filtersArray[2]);
            filters.put("country", filtersArray[3]);
            result = dao.findByNamedQueryAndNamedParam("profileDetailsQuery", filters);
        }

        return result;
    }

    public User findByPk(Integer userId) {
        return dao.findByPk(User.class, userId);
    }

    public void saveNewUser(User loggedUser, String invitationHash) {
        Player player = new Player(loggedUser.getFullName(), loggedUser);
        player.setAssociation(loggedUser);
        player.setInvitationResponse(InvitationResponseEnum.ACCEPTED);
        if (!StringUtils.isEmpty(invitationHash)) {
            graphBo.acceptUnregisteredUserInvitation(loggedUser, invitationHash);
        }

        dao.saveOrUpdate(player);
    }

    public void saveProfile(User loggedUser, Profile profile, String coach) {
        loggedUser.setProfile(profile);

        if (!StringUtils.isEmpty(coach)) {
            Player player = new Player(coach, loggedUser);
            profile.setCoach(player);
            dao.saveOrUpdate(player);
        } else {
            dao.saveOrUpdate(loggedUser);
        }
    }

    public void updateUser(User user) {
        dao.saveOrUpdate(user);
    }

    public User markSignupProcessAsCompleted(User loggedUser) {
		if (loggedUser.getProfile() == null
				|| !Boolean.TRUE.equals(loggedUser.getProfile().getSignupProcessCompleted())) {
            // fetch user
            loggedUser = dao.findByPk(User.class, loggedUser.getId(), null);
            if (loggedUser.getProfile() == null) {
                // if there's no profile, create one with the signupProcessCompleted as true
            	loggedUser.setProfile(new Profile());
            }
            loggedUser.getProfile().setSignupProcessCompleted(Boolean.TRUE);
            // save profile
            dao.saveOrUpdate(loggedUser);
    	}
		return loggedUser;
    }

    public boolean isSignupCompleted(User user) {
        user = dao.findByPk(User.class, user.getId(), null);
        return user.getProfile() != null && Boolean.TRUE.equals(user.getProfile().getSignupProcessCompleted());
    }

    public void closeAccount(User loggedUser, String reasonsNotToUseScoreshared) {
        // delete all scores which the loggedUser is the owner
        List<Score> scores = dao.findByNamedQuery("scoresByOwner", loggedUser.getId());
        for (Score score : scores) {
            score.setDeleted(true);
            dao.saveOrUpdate(score);
            // FIXME: it should be in an asynchronous job with bulk update. high chances it will decrease server performance.
        }

        // set the date account was closed as today
        loggedUser.setDeleted(true);
        loggedUser.setDateAccountWasClosed(new Date());
        loggedUser.setReasonAccountWasClosed(reasonsNotToUseScoreshared);
        dao.saveOrUpdate(loggedUser);
    }
}