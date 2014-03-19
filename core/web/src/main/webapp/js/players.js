var PlayerCrud = {
	options: {},
	playerAdded: '',

	postAdd: function(data) {
		$('#add-new-player-button').removeAttr('disabled');
		if (data.errorMessage == undefined) {
			$('#player-added-panel').removeClass('alert');
			$('#player-added-panel').html(PlayerCrud.options.label_player_added_successfully);
			$('#player-added-panel').show();
			$('#add-new-player-input').val('');

			if ($('#empty-players-message').length > 0) {
				location.reload();

			} else {
				var newLine = "<li class='item-resultado'><table><tbody><tr>" +
				"<td></td>" +
				"<td id='name-column'>" + PlayerCrud.playerAdded + "</td>" +
				"<td width='50%'>"+PlayerCrud.options.label_refresh_page_to_see_new_actions_available+"</td>" +
				"</tr></tbody></table></li>";
				$(".lista-resultados").append(newLine);
			}
		} else {
			$('#player-added-panel').addClass('alert');
			$('#player-added-panel').html(data.errorMessage);
			$('#player-added-panel').show();
		}
		setTimeout(function() { $('#player-added-panel').hide() }, 2000);
	},

	init: function(options) {
		$('.item-resultado').hover(function(){
			$(this).find('span.actions').fadeIn('fast');
		}, function(){
		$(this).find('span.actions').fadeOut();
		});

		$("#add-new-player-button").click(function(e) {
			e.preventDefault();
			PlayerCrud.playerAdded = $('#add-new-player-input').val();
			$('#add-new-player-button').attr('disabled', '');
			$.ajax({
				url: PlayerCrud.options.context_path + '/app/profile/players/addPlayer',
				data: {
						'playerName': PlayerCrud.playerAdded
					  },
				type: 'POST',
				dataType: 'json',
				cache: false,
				success: PlayerCrud.postAdd
			});
		});

		$("td .actions a").click(function (e) {
			e.preventDefault();
			ClickContext.tableLine = $(this).closest("li");
		
			var kind = $(this).attr('href').split(',')[0];
			var id = $(this).attr('href').split(',')[1];
			var name = $('#name-column', ClickContext.tableLine).text();
			if (kind == "removeLink") {
				DialogRemoveLink.start(id);
		
			} else if (kind == "rename") {
				DialogRename.start(id, name);

			} else if (kind == "invite") {
				InvitationWizard.start(name);
				// TODO: it looks like there is a bug when a user accepts an invitation. It is creating two players in the side of the sender of the invitation.
		
			} else if (kind == "remove") {
				DialogRemove.start(id);
			}
		});
		
		PlayerCrud.options = options;
	}
};

var DialogRemoveLink = {
	options: {},
	playerId: '',

	removeLink: function() {
		$('#dialog-general-confirm-yes,#dialog-general-confirm-no').attr('disabled', '');
		$.ajax({
			url: DialogRemoveLink.options.context_path + '/app/profile/players/removeLink/' + DialogRemoveLink.playerId,
			type: 'DELETE',
			dataType: 'json',
			cache: false,
			success: DialogRemoveLink.postRemoveLink
		});
	},

	postRemoveLink: function(data) {
		if (data.errorMessage == undefined) {
			$('#avatar-column', ClickContext.tableLine).html('');
			$('#actions-column', ClickContext.tableLine).html(DialogRemoveLink.options.label_refresh_page_to_see_new_actions_available);
			$('#general-info-panel').show();
			$('#general-info-panel').html(DialogRemoveLink.options.label_link_removed_successfully);
			setTimeout(function() { $.magnificPopup.close(); }, 2000);

		} else {
			$('#dialog-general-confirm-yes,#dialog-general-confirm-no').removeAttr('disabled');
			$('#general-info-panel').html(data.errorMessage);
			$('#general-info-panel').addClass('alert');
			$('#general-info-panel').show();
		}
	},

	start: function(playerId) {
		DialogRemoveLink.playerId = playerId;
		$('#dialog-general-confirm-no,#dialog-general-confirm-yes').removeAttr('disabled');
		$('#general-confirmation-question').html(DialogRemoveLink.options.label_are_you_sure_you_want_to_remove_the_link_to_this_user);
		$('#dialog-general-confirm-yes').click(DialogRemoveLink.removeLink);
		$.magnificPopup.open({
			items : {
				src : '#dialog-general-confirm',
				type : 'inline'
			}
		});
	},

	init: function(dialogRemoveLinkOptions) {
		DialogRemoveLink.options = dialogRemoveLinkOptions;
	}
};

var DialogRemove = {
	options: {},
	playerId: '',

	remove: function() {
		$('#dialog-general-confirm-yes,#dialog-general-confirm-no').attr('disabled', '');
		$.ajax({
			url: DialogRemove.options.context_path + '/app/profile/players/remove/' + DialogRemove.playerId,
			type: 'DELETE',
			dataType: 'json',
			cache: false,
			success: DialogRemove.postRemove
		});
	},

	postRemove: function(data) {
		if (data.errorMessage == undefined) {
			ClickContext.tableLine.remove();
			$('#general-info-panel').show();
			$('#general-info-panel').html(DialogRemove.options.label_player_removed_successfully);
			setTimeout(function() { $.magnificPopup.close(); }, 2000);

		} else {
			$('#dialog-general-confirm-yes,#dialog-general-confirm-no').removeAttr('disabled');
			$('#general-info-panel').html(data.errorMessage);
			$('#general-info-panel').addClass('alert');
			$('#general-info-panel').show();
		}
	},

	start: function(playerId) {
		DialogRemove.playerId = playerId;
		$('#dialog-general-confirm-no,#dialog-general-confirm-yes').removeAttr('disabled');
		$('#general-confirmation-question').html(DialogRemove.options.label_are_you_sure_you_want_to_remove_this_player_from_your_list + name);
		$('#dialog-general-confirm-yes').click(DialogRemove.remove);
		$.magnificPopup.open({
			items : {
				src : '#dialog-general-confirm',
				type : 'inline'
			}
		});
	},
	
	init: function(dialogRemoveOptions) {
		DialogRemove.options = dialogRemoveOptions;
	}
};

var InvitationWizard = {
	start: function(playerName) {
		$('#playerName').val(playerName);
		NewPlayerWizard.breadCrumb = [];
		NewPlayerWizard.start('first');
	},

	init: function(newPlayerWizardOptions, invitationWizardOptions) {
		NewPlayerWizard.init(newPlayerWizardOptions);
		NewPlayerWizard.steps['first'] = ProvidePlayerListWithSinglePlayerStep.init(newPlayerWizardOptions);
		NewPlayerWizard.steps[BuildDataWithI18nStep.name] = BuildDataWithI18nStep.init("/app/profile/players/buildDataWithI18n");

		$('#dialog-confirm-save_without_invitation').html(invitationWizardOptions.label_no);
		$('#dialog-confirm-save_without_invitation').removeClass('button-primary');
		$('#dialog-search-save_without_invitation').html(invitationWizardOptions.label_cancel);
		$('#dialog-search-save_without_invitation').removeClass('button-primary');
		$('#dialog-choosePlayerFromList-save_without_invitation').html(invitationWizardOptions.label_cancel);
		$('#dialog-choosePlayerFromList-save_without_invitation').removeClass('button-primary');
		$('#dialog-registeredInvitation-save_without_invitation').html(invitationWizardOptions.label_cancel);
		$('#dialog-registeredInvitation-save_without_invitation').removeClass('button-primary');
		$('#dialog-unregisteredInvitation-save_without_invitation').html(invitationWizardOptions.label_cancel);
		$('#dialog-unregisteredInvitation-save_without_invitation').removeClass('button-primary');
	}
};