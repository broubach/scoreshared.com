package com.scoreshared.scaffold;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.domain.entity.Player;

@Component
public class NotificationStatsHelper {

    public static String TOTAL_PENDING_NOTIFICATIONS = "_total_pending_notifications";
    public static String TOTAL_PENDING_FRIEND_REQUESTS = "_total_pending_friend_requests";
    public static String TOTAL_PENDING_SCORE_APPROVALS = "_total_pending_score_approvals";
    public static String TOTAL_PENDING_SCORE_REVISIONS = "_total_pending_score_revisions";
    
    public static String FORCE_NOTIFICATIONS_UPDATE = "_force_notifications_update";

    @Inject
    private UserBo bo;

    public void updateNotificationStats(HttpServletRequest request) {
        Integer totalPendingFriendRequests = bo.getTotalPendingFriendRequests(((Player) request.getSession()
                .getAttribute(UserLoggedListener.ASSOCIATED_PLAYER)).getOwner().getId());
        request.getSession().setAttribute(TOTAL_PENDING_FRIEND_REQUESTS, totalPendingFriendRequests);

        Integer totalPendingScoreApprovals = bo.getTotalPendingScoreApprovals(((Player) request.getSession()
                .getAttribute(UserLoggedListener.ASSOCIATED_PLAYER)).getOwner().getId());
        request.getSession().setAttribute(TOTAL_PENDING_SCORE_APPROVALS, totalPendingScoreApprovals);

        Integer totalPendingScoreRevisions = bo.getTotalPendingScoreRevisions(((Player) request.getSession()
                .getAttribute(UserLoggedListener.ASSOCIATED_PLAYER)).getOwner().getId());
        request.getSession().setAttribute(TOTAL_PENDING_SCORE_REVISIONS, totalPendingScoreRevisions);

        request.getSession().setAttribute(TOTAL_PENDING_NOTIFICATIONS,
                totalPendingFriendRequests + totalPendingScoreApprovals + totalPendingScoreRevisions);
    }
}