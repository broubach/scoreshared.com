var FriendRequestUtil = {

	openFriendRequestDialog: function(data) {
        $("#dialog-friendRequest input[name='email']").val(data.playerList[0][0]); // email
        $("#requested dt").text(data.playerList[0][1]); // avatarHash
        if (data.playerList[0][3] != undefined) {
            $("#requested dd").html(data.playerList[0][2] + "<br/>" + data.playerList[0][3]); // fullName + location
        } else {
            $("#requested dd").html(data.playerList[0][2]); // fullName
        }
        $("#requester textarea").text(data.invitationMessage); // invitationMessage
        $("#requester dd").text(NewPlayerWizard.options.loggedUserAvatarUrl); // logged user avatar
        $("#dialog-friendRequest input[name='playerName']").val(data.playerNameInScore); // playerName
        $("#dialog-friendRequest").dialog("open");
	}
};