var FriendRequestUtil = {

	openFriendRequestDialog: function(data, contextPath) {
        $("#dialog-registeredInvitation input[name='userId']").val(data.playerList[0][0]); // userId
        $("#requested-pic").html('<img class="avatar" src="' + contextPath + 'app/avatar?hash=' + data.playerList[0][1] + '&small"/>'); // avatarHash
        if (data.playerList[0][3] != undefined) {
            $("#requested-desc").html(data.playerList[0][2] + "<br/>" + data.playerList[0][3]); // fullName + location
        } else {
            $("#requested-desc").html(data.playerList[0][2]); // fullName
        }
        $("#registeredInvitation-form textarea").text(data.invitationMessage); // invitationMessage
        $("#dialog-registeredInvitation input[name='playerName']").val(data.playerNameInScore); // playerName
		$.magnificPopup.open({items: {src: '#dialog-registeredInvitation', type: 'inline'}});
	}
};