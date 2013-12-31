<#import "/spring.ftl" as spring />

<div id="dialog-rename-player" class="modal mfp-hide">
	<div class="row content">
		<div class="columns large-12">
			<form id="feedback-form" accept-charset="utf-8" class="no-margin-bottom">
				<h2><@spring.message code="label.rename_player"/></h2>
				<div id="error-panel" class="label radius" style="display: none"></div>
				<div class="input textarea">
					<label for="FeedbackMessage"><@spring.message code="label.send_your_message"/></label>
					<textarea name="message" class="autosize" cols="30" rows="6" id="message"></textarea>
				</div>
				<div class="row content no-padding-bottom">
					<div class="columns small-12 direita">
						<div class="submit"><input class="button" id="dialog-rename-player-rename" value="<@spring.message code="label.rename"/>" type="button"></div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>