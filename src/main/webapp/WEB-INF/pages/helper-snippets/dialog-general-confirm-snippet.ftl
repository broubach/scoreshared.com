	<div id="dialog-general-confirm" class="modal mfp-hide" style="max-width: 500px">
		<div class="row content">
			<div class="columns large-12">
				<h2><@spring.message code="label.confirmation"/></h2>
				<div id="general-info-panel" class="label radius" style="display: none"></div>
				<p id="general-confirmation-question"></p>
				<div class="row">
					<div class="columns small-12 direita">
						<a class="button mfp-prevent-close" id="dialog-general-confirm-no"><@spring.message code="label.no"/></a>
						<button class="button button-primary mfp-prevent-close" id="dialog-general-confirm-yes"><@spring.message code="label.yes"/></button>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
var DialogGeneralConfirm = {
	init: function() {
		$('#dialog-general-confirm-no').click(function() {
	        $.magnificPopup.close();
		});
	}
}
</script>
	