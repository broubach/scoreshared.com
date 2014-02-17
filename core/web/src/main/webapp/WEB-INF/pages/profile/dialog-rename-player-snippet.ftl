<#import "/spring.ftl" as spring />

<div id="dialog-rename-player" class="modal mfp-hide">
	<div class="row content">
		<div class="columns large-12">
			<form accept-charset="utf-8" class="no-margin-bottom">
				<h2><@spring.message code="label.rename_player"/></h2>
				<div id="info-panel" class="label radius" style="display: none"></div>
				<div class="input text">
					<input name="dialog-rename-player-new_name" type="text" id="dialog-rename-player-new_name" maxlength="45"></input>
				</div>
				<div class="row content no-padding-bottom">
					<div class="columns small-12 direita">
						<div class="submit"><input class="button" id="dialog-rename-player-rename" value="<@spring.message code="label.rename"/>" type="button"></input></div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
var DialogRename = {
	playerId: "",
	playerName: "",

	rename: function() {
		$('#dialog-rename-player-new_name').attr('readonly', '');
		$('#dialog-rename-player-rename').attr('disabled', '');
		$.ajax({
			url: '<@spring.url relativeUrl="/app/profile/players/rename"/>',
			data: {
					'playerName': $('#dialog-rename-player-new_name').val(),
					'playerId': DialogRename.playerId
				  },
			type: 'POST',
			dataType: 'json',
			cache: false,
			success: DialogRename.postRename
		});
	},
	
	postRename: function(data) {
		if (data.errorMessage == undefined) {
			$('#name-column', ClickContext.tableLine).html($('#dialog-rename-player-new_name').val());
			$('#info-panel').show();
			$('#info-panel').html('<@spring.message code="label.player_renamed_successfully"/>');
			setTimeout(function() { $.magnificPopup.close(); }, 2000);

		} else {
			$('#info-panel').addClass('alert');
			$('#info-panel').show();
			$('#info-panel').html(data.errorMessage);
		}
		$('#dialog-rename-player-new_name').removeAttr('readonly');
		$('#dialog-rename-player-rename').removeAttr('disabled', '');
	},

	start: function(playerId, playerName) {
		DialogRename.playerId = playerId;
		DialogRename.playerName = playerName;
		$('#info-panel').removeClass('alert');
		$('#info-panel').hide();
		$('#dialog-rename-player-new_name').val(playerName);
		$.magnificPopup.open({
			items : {
				src : '#dialog-rename-player',
				type : 'inline'
			}
		});
	},

	init: function() {
		$('#dialog-rename-player-rename').click(DialogRename.rename);
	}
};
</script>