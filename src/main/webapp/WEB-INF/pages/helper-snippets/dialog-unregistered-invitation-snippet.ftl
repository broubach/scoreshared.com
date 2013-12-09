
	<div id="dialog-unregisteredInvitation" class="modal mfp-hide">
		<div class="row content no-padding-bottom">
			<div class="columns large-12">
				<h2><@spring.message code="label.invitation"/></h2>
				<div class="error-panel label alert radius" style="display: none"></div>
			</div>
		</div>
		<div class="row content no-padding-bottom no-padding-top">
			<div class="columns large-12">
				<form id="unregisteredInvitation-form">
					<input type="hidden" name="playerName" />
					<div class="input text"><label class="message-label" for="message"></label><textarea id="message" name="message"></textarea></div>
					<div class="input text"><label for="email"><@spring.message code="label.email"/></label><input type="text" id="email" name="email"/></div>
				</form>
			</div>
		</div>
		<div class="row content no-padding-bottom no-padding-top">
			<div class="columns large-12">
				<a class="button mfp-prevent-close" id="dialog-unregisteredInvitation-back"><@spring.message code="label.back"/></a>
				<a class="button mfp-prevent-close" id="dialog-unregisteredInvitation-invite"><@spring.message code="label.invite"/></a>
				<a class="button button-primary mfp-prevent-close" id="dialog-unregisteredInvitation-save_without_invitation"><@spring.message code="label.save_without_invitation"/></a>
			</div>
		</div>
	</div>