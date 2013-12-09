	<div id="dialog-confirm" class="modal mfp-hide">
		<div class="row content">
			<div class="columns large-10">
				<h2><@spring.message code="label.confirmation"/></h2>
				<p id="confirmation-question"></p>
				<#if !(should_show_checkbox??)>
					<label><input type="checkbox"/><@spring.message code="label.dont_ask_again_for_this_player"/></label>
				</#if>
				<button class="button mfp-prevent-close" id="dialog-confirm-yes"><@spring.message code="label.yes"/></button>
				<a class="button button-primary mfp-prevent-close" id="dialog-confirm-save_without_invitation"><@spring.message code="label.save_without_invitation"/></a>
			</div>
		</div>
	</div>
