	<div id="dialog-confirm" class="modal mfp-hide" style="max-width: 500px">
		<div class="row content">
			<div class="columns large-12">
				<h2><@spring.message code="label.confirmation"/></h2>
				<p id="confirmation-question"></p>
				<#if !(should_show_checkbox??)>
					<label><input type="checkbox"/><@spring.message code="label.dont_ask_again_for_this_player"/></label>
				</#if>
				<div class="row">
					<div class="columns small-12 direita">
						<button class="button mfp-prevent-close" id="dialog-confirm-yes"><@spring.message code="label.yes"/></button>
						<a class="button button-primary mfp-prevent-close" id="dialog-confirm-save_without_invitation"><@spring.message code="label.save_without_invitation"/></a>
					</div>
				</div>
			</div>
		</div>
	</div>
