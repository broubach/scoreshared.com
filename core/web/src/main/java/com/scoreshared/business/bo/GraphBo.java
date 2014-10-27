package com.scoreshared.business.bo;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Component;

import com.scoreshared.domain.entity.Invitation;
import com.scoreshared.domain.entity.InvitationResponseEnum;
import com.scoreshared.domain.entity.Player;
import com.scoreshared.domain.entity.User;
import com.scoreshared.webapp.controller.ScoreOutcomeEnum;

@Component
public class GraphBo extends BaseBo<Player> {

    @Value("${email.from}")
    private String from;

    @Value("${email.fromName}")
    private String fromName;
    
    @Value("${http_server_address_port}")
    private String httpServerAddressPort;

    @Inject
    @Named("passwordEncoder")
    private Md5PasswordEncoder hashEncoder;

	public void inviteRegisteredUser(User owner, Integer associationId, Integer playerId, String message, Locale locale) {
		User association = dao.findByPk(User.class, associationId);

		Player player = null;
		if (playerId == null || ((player = dao.findByPk(Player.class, playerId)) == null)) {
		    player = new Player(association.getFullName(), owner);
		}
		
		Invitation invitation = new Invitation(message);
		player.setInvitation(invitation);
        player.setAssociation(association);

		dao.saveOrUpdate(player);

		sendInternalInvitationMail(association.getFullName(), message, association.getEmail(), locale);
	}

	public Player findPlayerByAssociationAndOwner(Integer userAssociationId, Integer ownerId) {
	    Map<String, Integer> params = new HashMap<String, Integer>();
	    params.put("ownerId", ownerId);
	    params.put("associationId", userAssociationId);
        List<Player> result = dao.findByNamedQueryAndNamedParam("playerByAssociationAndOwnerQuery", params);
        if (result.size() > 0) {
            return result.get(0);
        }
        return null;
    }

    public void inviteUnregisteredUser(User owner, String playerName, String email, String message, Locale locale) {
        List<Player> players = dao.findByNamedQuery("playerByNameAndOwnerQuery", playerName, owner.getId());
        Player player = null;
        if (players.size() > 0) {
            player = players.get(0);
        } else {
            player = new Player(playerName, owner);
        }

        Invitation invitation = new Invitation(email, message, hashEncoder.encodePassword(email, new Date()));
        player.setInvitation(invitation);

        dao.saveOrUpdate(player);

        sendExternalInvitationMail(playerName, message, email, invitation.getHash(), locale);
    }

    private void sendExternalInvitationMail(String playerName, String message, String email, String invitationHash, Locale locale) {
        String templateName = "external-user-invitation-template";
        Map<String, String> params = new HashMap<String, String>();
        params.put("message", message);
        params.put("userName", playerName);
        params.put("invitationHash", invitationHash);
        params.put("http_server_address_port", httpServerAddressPort);
        String body = parseTemplate(templateName, params, locale);
        sendMail(from, fromName, email, getSubjectByTemplateName(templateName, locale), body);
    }

    private void sendInternalInvitationMail(String userName, String invitationMessage, String invitationEmail, Locale locale) {
        String templateName = "internal-user-invitation-template";
        Map<String, String> params = new HashMap<String, String>();
        params.put("message", invitationMessage);
        params.put("userName", userName);
        params.put("http_server_address_port", httpServerAddressPort);
        String body = parseTemplate(templateName, params, locale);
        sendMail(from, fromName, invitationEmail, getSubjectByTemplateName(templateName, locale), body);
    }

    public void removeConnection(Integer user1Id, Integer user2Id) {
    	Player player = findPlayerByAssociationAndOwner(user1Id, user2Id);
        player.getInvitation().setDate(null);
        player.getInvitation().setResponse(null);
        player.setShouldNotReinvite(null);
        dao.saveOrUpdate(player);

    	player = findPlayerByAssociationAndOwner(user2Id, user1Id);
        player.getInvitation().setDate(null);
        player.getInvitation().setResponse(null);
        player.setShouldNotReinvite(null);
        dao.saveOrUpdate(player);
    }

    public void acceptRegisteredUserInvitation(User user1, Integer user2Id) {
        Player player2 = findPlayerByAssociationAndOwner(user1.getId(), user2Id);
        User user2 = player2.getOwner();

        Player player1 = findPlayerByAssociationAndOwner(user2Id, user1.getId());
        if (player1 == null) {
            player1 = new Player();
        }

        connect(user1, player1, user2, player2);
    }

    public void ignoreRegisteredUserInvitation(User user1, Integer user2Id) {
        Player player = findPlayerByAssociationAndOwner(user1.getId(), user2Id);
        if (player != null) {
            player.getInvitation().setResponse(InvitationResponseEnum.IGNORED);
            dao.saveOrUpdate(player);
        }
    }

    public void acceptUnregisteredUserInvitation(User user1, String invitationHash) {
        Player player2 = findPlayerByInvitationHash(invitationHash);
        User user2 = player2.getOwner();

        connect(user1, new Player(), user2, player2);
    }

    public Player findPlayerByInvitationHash(String invitationHash) {
        List<Player> players = dao.findByNamedQuery("invitationPlayerByHashQuery", invitationHash);
        if (players.size() > 0) {
            return players.get(0);
        }
        return null;
    }

    private void connect(User user1, Player player1, User user2, Player player2) {
        player1.setAssociation(user2);
        player1.setName(user2.getFullName());
        player1.setOwner(user1);
        player1.setInvitation(new Invitation());
        player1.getInvitation().setResponse(InvitationResponseEnum.ACCEPTED);
        dao.saveOrUpdate(player1);

        player2.setAssociation(user1);
        player2.setName(user1.getFullName());
        player2.setOwner(user2);
        player2.getInvitation().setResponse(InvitationResponseEnum.ACCEPTED);
        dao.saveOrUpdate(player2);
    }

    /**
     * When should a player be invited?
     * If there is a corresponding player with no invitation, different from the logged user
     * or
     * there is no corresponding player
     */
    public Object[] shouldPlayerBeInvited(String playerName, User owner) {
        List<Player> players = dao.findByNamedQuery("playerByNameAndOwnerQuery", playerName, owner.getId());
        if (!players.isEmpty()) {
            Player player = players.get(0);

            if (!(player.getAssociation() != null && player.getAssociation().getId().equals(owner.getId()))
                    && !player.isConnected() && (!Boolean.TRUE.equals(player.getShouldNotReinvite()))) {
                return new Object[] { true, player };
            }
            return new Object[] { false };
        }

        return new Object[] { true };
    }

    public List<Object[]> findPendingInvitations(Integer id) {
        return dao.findByNamedQuery("pendingInvitationsQuery", id);
    }

    public List<Integer> findConnectedPlayerInstancesByAssociation(Integer associationId, ScoreOutcomeEnum scoreOutcomeFilter) {
        if (ScoreOutcomeEnum.LOSS.equals(scoreOutcomeFilter)) {
            return dao.findByNamedQuery("connectedPlayerInstancesByAssociationAndOutcomeLossQuery", associationId);

        } else if (ScoreOutcomeEnum.WIN.equals(scoreOutcomeFilter)) {
            return dao.findByNamedQuery("connectedPlayerInstancesByAssociationAndOutcomeWinQuery", associationId);

        } else if (ScoreOutcomeEnum.PRACTICE.equals(scoreOutcomeFilter)) {
            return dao.findByNamedQuery("connectedPlayerInstancesByAssociationAndOutcomePracticeQuery", associationId);
            
        } else if (ScoreOutcomeEnum.TIE.equals(scoreOutcomeFilter)) {
            return dao.findByNamedQuery("connectedPlayerInstancesByAssociationAndOutcomeTieQuery", associationId);
        }

        return dao.findByNamedQuery("connectedPlayerInstancesByAssociationQuery", associationId);
    }
}