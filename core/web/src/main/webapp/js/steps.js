var ProvidePlayerListStep = {
	name: 'first',
	execute: function(context) {
		var players = ProvidePlayerListStep.createList($("#playersLeft").val() + ',' + $("#playersRight").val());

		context.players = players;
	},

	createList : function(choosenPlayers) {
		var choosenPlayers = ProvidePlayerListStep.trimList(choosenPlayers);
		var choosenPlayersList = choosenPlayers.split(',');
		for ( var i = 0; i < choosenPlayersList.length; i++) {
			if (choosenPlayersList[i] == '') {
				choosenPlayersList.splice(i, 1);
				i--;
			} else {
				choosenPlayersList[i] = {playerName: choosenPlayersList[i]};
			}
		}
		return choosenPlayersList;
	},

	trimList: function(commaSeparatedString) {
		var result = commaSeparatedString.split(',');
		for (var i = 0; i<result.length; i++) {
			result[i] = $.trim(result[i]);
		}
		return result.join(',');
	},
	
	getNextStep: function() {
		return CheckIfPlayerShouldBeInvitedStep.name;
	},
	
	isSuspensive: function() {
		return false;
	},

	storeInBreadCrumbs: function() {
		return false;
	},

	init: function() {
		return ProvidePlayerListStep;
	}
};

var ProvidePlayerListWithSinglePlayerStep = {
	name: 'first',
	execute: function(context) {
		var players = [ { playerName: $(document.getElementById('playerName')).val() } ];
		context.players = players;
	},

	getNextStep: function() {
		return BuildDataWithI18nStep.name;
	},

	isSuspensive: function() {
		return false;
	},

	storeInBreadCrumbs: function() {
		return false;
	},

	init: function() {
		return ProvidePlayerListWithSinglePlayerStep;
	}
};

var BuildDataWithI18nStep = {
	name: 'buildDataWithI18n',
	buildDataPath: undefined,
	execute: function(context) {
		if (BuildDataWithI18nStep.buildDataPath == undefined) {
			BuildDataWithI18nStep.buildDataPath = "app/home/buildDataWithI18n";
		}
		$.ajax({
			url: context.options.contextPath+BuildDataWithI18nStep.buildDataPath,
			data: {'playerName': context.players[context.currentPlayer].playerName},
			type: 'POST',
			dataType: 'json',
			cache: false,
			success: NewPlayerWizard.resume
		});
	},

	getNextStep: function() {
		return UserConfirmationStep.name;
	},

	isSuspensive: function() {
		return true;
	},

	storeInBreadCrumbs: function() {
		return false;
	},

	init: function(buildDataPath) {
		BuildDataWithI18nStep.buildDataPath = buildDataPath;
		return BuildDataWithI18nStep;
	}
};

var CheckIfPlayerShouldBeInvitedStep = {
	name: 'checkIfInvites',
	suspensive: {},
	execute: function(context) {
		CheckIfPlayerShouldBeInvitedStep.suspensive = true;
		var newPlayersNotToBeRemembered = ProvidePlayerListStep.createList($("#score-form input[name='newPlayersNotToBeRemembered']").val());
		console.log("newPlayersNotToBeRemembered: " + newPlayersNotToBeRemembered);
		if (CheckIfPlayerShouldBeInvitedStep.isPlayerInList(newPlayersNotToBeRemembered, context.players[context.currentPlayer].playerName)) {
			console.log("player should not be envited");
			CheckIfPlayerShouldBeInvitedStep.suspensive = false;
			return;
		}
		$.ajax({
			url: context.options.contextPath+"app/score/shouldPlayerBeInvited",
			data: {'playerName': context.players[context.currentPlayer].playerName},
			type: 'POST',
			dataType: 'json',
			cache: false,
			success: NewPlayerWizard.resume
		});
	},

	isPlayerInList: function(newPlayersNotToBeRemembered, playerName) {
		for (var i = 0; i<newPlayersNotToBeRemembered.length; i++) {
			if (newPlayersNotToBeRemembered[i].playerName == playerName) {
				return true;
			}
		}
		return false;
	},

	getNextStep: function() {
		return CheckIfPlayerShouldBeInvitedStep.suspensive ? UserConfirmationStep.name : EndStep.name;
	},

	isSuspensive: function() {
		return CheckIfPlayerShouldBeInvitedStep.suspensive;
	},

	storeInBreadCrumbs: function() {
		return false;
	},

	init: function() {
		return CheckIfPlayerShouldBeInvitedStep;
	}
};

var UserConfirmationStep = {
	name: 'userConfirmation',
	waitForUserConfirmation: {},
	execute: function(context, data) {
		UserConfirmationStep.waitForUserConfirmation = false;
		if (data.proceedWithConfirmation == 'true') {
			UserConfirmationStep.waitForUserConfirmation = true;
			context.currentPlayerId = data.playerId;

			$("#dialog-confirm input[type='checkbox']").attr('checked', false);
			$("#confirmation-question").html(data.title);
			$.magnificPopup.open({
				items : {
					src : '#dialog-confirm',
					type : 'inline'
				}
			});
		}
	},

	getNextStep: function() {
		return EndStep.name;
	},

	isSuspensive: function() {
		return UserConfirmationStep.waitForUserConfirmation ? true : false;
	},

	storeInBreadCrumbs: function() {
		return false;
	},

	init: function(context) {
		$('#dialog-confirm-yes').click(function(e) {
            e.preventDefault();
            $.magnificPopup.close();

            $('#search-form input').val('');
			if ($("#dialog-confirm input[type='checkbox']").is(':checked')) {
				$("#score-form input[name='newPlayersNotToBeRemembered']").val($("#score-form input[name='newPlayersNotToBeRemembered']").val() + "," + context.players[context.currentPlayer].playerName);
				console.log("checkbox was checked and user '" + context.players[context.currentPlayer].playerName + '" was added, resulting in: ' + $("#score-form input[name='newPlayersNotToBeRemembered']").val());
			}
			NewPlayerWizard.start(OpenSearchDialogStep.name);
		});

		$('#dialog-confirm-save_without_invitation').click(function(e) {
            e.preventDefault();

            $.magnificPopup.close();
			if ($("#dialog-confirm input[type='checkbox']").is(':checked')) {
				$("#score-form input[name='newPlayersNotToBeRemembered']").val($("#score-form input[name='newPlayersNotToBeRemembered']").val() + "," + context.players[context.currentPlayer].playerName);
				console.log('checkbox was checked and user "' + context.players[context.currentPlayer].playerName + '" was added, resulting in: ' + $("#score-form input[name='newPlayersNotToBeRemembered']").val());
			}
			NewPlayerWizard.resume();
		});
		return UserConfirmationStep;
	}
};

var OpenSearchDialogStep = {
	name: 'openSearchDialog',

	execute: function(context) {
		$("#dialog-search .error-panel").css('display', 'none');
		$("#dialog-search .error-panel").html('');
        $('#search-for-username').html(context.options.label_search_for + " " + context.players[context.currentPlayer].playerName);
        $.magnificPopup.open({
			items : {
				src : '#dialog-search',
				type : 'inline'
			}
		});
	},

	getNextStep: function() {
		return EndStep.name;
	},

	isSuspensive: function() {
		return true;
	},

	storeInBreadCrumbs: function() {
		return true;
	},

	init: function(context) {
		$('#dialog-search-invite').click(function(e) {
            e.preventDefault();

            var hasAnyFilledField = $("#search-form input[type=text]").filter(function(){
			    return $.trim($(this).val());
			}).length > 0;
			if (!hasAnyFilledField) {
				$("#dialog-search .error-panel").css('display', 'block');
				$("#dialog-search .error-panel").html(context.options.error_please_fill_at_least_one_field_for_search);
				return;
			}
			NewPlayerWizard.storeFormDataInBreadCrumbs('#search-form');
			$('#playerNameInScore').val(context.players[context.currentPlayer].playerName);
			$.ajax({
				url: context.options.contextPath+"app/score/searchUser",
				data: $('#search-form').serialize(),
				type: 'POST',
				dataType: 'json',
				cache: false,
				success: function(data) {
					NewPlayerWizard.start(ProcessSearchResultStep.name, data);
				}
			});
		});

		$('#dialog-search-save_without_invitation').click(function(e) {
            e.preventDefault();

            NewPlayerWizard.resume();
		});
		return OpenSearchDialogStep;
	}
};

var ProcessSearchResultStep = {
	name: 'processSearchResult',
	data: {},
	execute: function(context, data) {
		$.magnificPopup.close();
		ProcessSearchResultStep.data = data;
	},

	getNextStep: function() {
		if (ProcessSearchResultStep.data.playerFound) {
		    if (ProcessSearchResultStep.data.playerList.length > 1) {
		        return ChoosePlayerFromListStep.name;

		    } else {
		        return InviteRegisteredUserStep.name;
		    }
		} else {
	        return InviteUnregisteredUserStep.name;
		}
	},

	isSuspensive: function() {
		return false;
	},

	storeInBreadCrumbs: function() {
		return false;
	},

	init: function() {
		return ProcessSearchResultStep;
	}
};

var ChoosePlayerFromListStep = {
	name: 'choosePlayerFromList',
	lastSearchResult: {},
	execute: function(context, data) {
        ChoosePlayerFromListStep.lastSearchResult = data;

		$("#dialog-choosePlayerFromList table tbody").html('');
		for ( var i = 0; i < data.playerList.length; i++) {
            var row = "<tr><td><a class='mfp-prevent-close' href='"+i+"'>";
            row += "<img class='avatar' src='" + context.options.contextPath + "app/avatar?hash="
                    + data.playerList[i][1] + "&small'/>";
            row += "</a></td><td><a class='mfp-prevent-close' href='"+i+"'>";
            row += data.playerList[i][2];
            row += "</a></td><td><a class='mfp-prevent-close' href='"+i+"'>";
            row += data.playerList[i][3];
            row += "</a></td></tr>";
            $("#dialog-choosePlayerFromList table tbody").append(row);

            $("#dialog-choosePlayerFromList table tbody tr:eq(" + i + ") a").click(function(e) {
                e.preventDefault();

                $.magnificPopup.close()

        		var newData = {'playerList': [ChoosePlayerFromListStep.lastSearchResult.playerList[$(this).attr('href')]],
        				'playerFound': true,
        				'invitationMessage': ChoosePlayerFromListStep.lastSearchResult.invitationMessage,
        				'playerNameInScore' : ChoosePlayerFromListStep.lastSearchResult.playerNameInScore};
        		NewPlayerWizard.start(InviteRegisteredUserStep.name, newData);
            });
        }

		$('table.full tbody tr').hover(function(){
			$(this).addClass('hover');
		},function(){
			$(this).removeClass('hover');
		})

		$.magnificPopup.open({items: {src: '#dialog-choosePlayerFromList', type: 'inline'}});
	},

	getNextStep: function() {
		return EndStep.name;
	},

	isSuspensive: function() {
		return true;
	},

	storeInBreadCrumbs: function() {
		return true;
	},

	init: function(context) {
		$('#dialog-choosePlayerFromList-back').click(function(e) {
            e.preventDefault();

            $.magnificPopup.close();
    		NewPlayerWizard.goBack(2);
        });
		
		$('#dialog-choosePlayerFromList-save_without_invitation').click(function(e) {
            e.preventDefault();

            $.magnificPopup.close();
			NewPlayerWizard.resume();
		});
	    return ChoosePlayerFromListStep;
	}
};

var InviteRegisteredUserStep = {
	name: 'inviteRegisteredUser',
	execute: function(context, data) {
		$("#dialog-registeredInvitation .error-panel").css('display', 'none');
		$("#dialog-registeredInvitation .error-panel").html('');
		FriendRequestUtil.openFriendRequestDialog(data, context.options.contextPath, context.options.loggedUserAvatarHash);
	},

	getNextStep: function() {
		return EndStep.name;
	},

	isSuspensive: function() {
		return true;
	},

	storeInBreadCrumbs: function() {
		return false;
	},

	init: function(context) {
		$('#dialog-registeredInvitation-back').click(function(e) {
            e.preventDefault();

            $.magnificPopup.close();
    		NewPlayerWizard.goBack();
        });

		$('#dialog-registeredInvitation-send_invitation').click(function(e) {
            e.preventDefault();

            var hasAnyFilledField = $("#registeredInvitation-form textarea").filter(function(){
			    return $.trim($(this).val()) != "";
			}).length > 0;
			if (!hasAnyFilledField) {
				$("#dialog-registeredInvitation .error-panel").css('display', 'block');
				$("#dialog-registeredInvitation .error-panel").html(context.options.error_please_enter_some_text);
				return;
			}
			$("#registeredInvitation-form input[name='playerId']").val(context.currentPlayerId);
			$.ajax({
				url: context.options.contextPath+"app/score/newFriendRequest",
				data: $('#registeredInvitation-form').serialize(),
				type: 'POST',
				dataType: 'json',
				cache: false,
				complete: function(data) {
					$.magnificPopup.close();
					NewPlayerWizard.resume(data);
				}
			});
		});

		$('#dialog-registeredInvitation-save_without_invitation').click(function(e) {
            e.preventDefault();

            $.magnificPopup.close();
    		NewPlayerWizard.resume();
        });
		return InviteRegisteredUserStep;
	}
};

var InviteUnregisteredUserStep = {
	name: 'inviteUnregisteredUser',
	execute: function(context, data) {
		$("#dialog-unregisteredInvitation .error-panel").css('display', 'none');
		$("#dialog-unregisteredInvitation .error-panel").html('');
        $("#unregisteredInvitation-form input[name='playerName']").val(data.playerNameInScore); // playerName
        $("#unregisteredInvitation-form .message-label").html(data.playerNameInScore + " " + context.options.label_user_not_found + '<br/>' + context.options.label_take_the_opportunity_to_invite); // fullName + location
        $("#unregisteredInvitation-form textarea").text(data.invitationMessage); // invitationMessage
        $("#unregisteredInvitation-form input[name='email']").val(data.email); // email
		$.magnificPopup.open({items: {src: '#dialog-unregisteredInvitation', type: 'inline'}});
	},

	getNextStep: function() {
		return EndStep.name;
	},

	isSuspensive: function() {
		return true;
	},

	storeInBreadCrumbs: function() {
		return false;
	},

	init: function(context) {
		$( "#dialog-unregisteredInvitation-back").click(function(e) {
            e.preventDefault();

            $.magnificPopup.close();
    		NewPlayerWizard.goBack();
        });

		$( "#dialog-unregisteredInvitation-invite").click(function(e) {
            e.preventDefault();

            if (!$.trim($("#unregisteredInvitation-form input[name='email']").val()) || !$.trim($("#unregisteredInvitation-form textarea").val())) {
        		$("#dialog-unregisteredInvitation .error-panel").css('display', 'block');
				$("#dialog-unregisteredInvitation .error-panel").html(context.options.error_please_fill_out_all_fields);
				return;
			}
			$.ajax({
				url: context.options.contextPath+"app/score/newInvitation",
				data: $('#unregisteredInvitation-form').serialize(),
				type: 'POST',
				dataType: 'json',
				cache: false,
				complete: function() {
					$.magnificPopup.close();
					NewPlayerWizard.resume();
				}
			});
		});

		$( "#dialog-unregisteredInvitation-save_without_invitation").click(function(e) {
            e.preventDefault();

            $.magnificPopup.close();
    		NewPlayerWizard.resume();
        });
		return InviteUnregisteredUserStep;
	}
};

var EndStep = {
	name: 'end',
	shouldRestart: {},
	execute: function(context) {
		EndStep.shouldRestart =  false;
		if (context.currentPlayer >=  (context.players.length - 1)) {
			context.options.continueWithSavingProcessCallback();
		} else {
			context.currentPlayer++;
			EndStep.shouldRestart = true;
		}
	},

	getNextStep: function() {
		if (EndStep.shouldRestart) {
			return CheckIfPlayerShouldBeInvitedStep.name;
		}
		return undefined;
	},

	isSuspensive: function() {
		return false;
	},

	storeInBreadCrumbs: function() {
		return false;
	},

	init: function() {
		return EndStep;
	}
};