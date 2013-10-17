<#import "/spring.ftl" as spring />

<div id="dialog-registeredInvitation" class="modal mfp-hide">
	<div class="row content no-padding-bottom">
		<div class="columns large-10">
			<h2><@spring.message code="label.invite"/></h2>
			<div class="error-panel label alert radius" style="display: none"></div>
		</div>
	</div>
	<div class="row content no-padding-top no-padding-bottom">
		<form id="registeredInvitation-form">
			<input type="hidden" name="playerId" />
			<input type="hidden" name="playerName" />
			<input type="hidden" name="userId" />
			<div class="columns small-4">
				<div id="requested-pic"></div>
				<div id="requested-desc" class="label secondary"></div>
			</div>
			<div class="columns small-8">
				<div class="input textarea"><textarea id="message" name="message" class="autosize"></textarea></div>
			</div>
		</form>
	</div>
	<div class="row content no-padding-top no-padding-bottom">
		<div class="columns large-12">
			<a class="button mfp-prevent-close" id="dialog-registeredInvitation-back"><@spring.message code="label.back"/></a>
			<a class="button mfp-prevent-close" id="dialog-registeredInvitation-send_invitation"><@spring.message code="label.invite"/></a>
			<a class="button button-primary mfp-prevent-close" id="dialog-registeredInvitation-save_without_invitation"><@spring.message code="label.save_without_invitation"/></a>
		</div>
	</div>
</div>