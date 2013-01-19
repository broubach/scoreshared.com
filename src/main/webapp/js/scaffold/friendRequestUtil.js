var FriendRequestUtil = {

	openFriendRequestDialog: function(data, contextPath, loggedUserAvatarHash) {
        $("#dialog-registeredInvitation input[name='userId']").val(data.playerList[0][0]); // userId
        $("#requested dt").html('<img src="' + contextPath + '/app/avatar?hash=' + data.playerList[0][1] + '&small"/>'); // avatarHash
        if (data.playerList[0][3] != undefined) {
            $("#requested dd").html(data.playerList[0][2] + "<br/>" + data.playerList[0][3]); // fullName + location
        } else {
            $("#requested dd").html(data.playerList[0][2]); // fullName
        }
        $("#requester textarea").text(data.invitationMessage); // invitationMessage
        $("#requester dd").html('<img src="' + contextPath + '/app/avatar?hash=' + loggedUserAvatarHash + '&small"/>'); // logged user avatar
        $("#dialog-registeredInvitation input[name='playerName']").val(data.playerNameInScore); // playerName
        $("#dialog-registeredInvitation").dialog("open");
	}
};