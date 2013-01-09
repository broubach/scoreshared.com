var FriendRequestUtil = {

	openFriendRequestDialog: function(data, loggedUserAvatarUrl) {
        $("#dialog-friendRequest input[name='userId']").val(data.playerList[0][0]); // userId
        $("#requested dt").text(data.playerList[0][1]); // avatarHash
        if (data.playerList[0][3] != undefined) {
            $("#requested dd").html(data.playerList[0][2] + "<br/>" + data.playerList[0][3]); // fullName + location
        } else {
            $("#requested dd").html(data.playerList[0][2]); // fullName
        }
        $("#requester textarea").text(data.invitationMessage); // invitationMessage
        $("#requester dd").text(loggedUserAvatarUrl); // logged user avatar
        $("#dialog-friendRequest input[name='playerName']").val(data.playerNameInScore); // playerName
        $("#dialog-friendRequest").dialog("open");
	}
};