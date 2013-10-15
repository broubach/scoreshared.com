<#import "/spring.ftl" as spring />

<div id="dialog-registeredInvitation" class="modal mfp-hide">
	<div class="row content">
		<div class="columns large-10">
			<h2><@spring.message code="label.invite"/></h2>
			<div class="error-panel"></div>
			<form id="registeredInvitation-form">
				<input type="hidden" name="playerId" />
				<input type="hidden" name="playerName" />
				<input type="hidden" name="userId" />
				<dl id="requested">
					<dt></dt>
					<dd></dd>
				</dl>
				<dl id="requester">
					<dt><textarea name="message"></textarea></dt>
					<dd></dd>
				</dl>
			</form>
			<a class="button" id="dialog-registeredInvitation-back"><@spring.message code="label.back"/></a>
			<a class="button" id="dialog-registeredInvitation-send_invitation"><@spring.message code="label.send_invitation"/></a>
			<a class="button" id="dialog-registeredInvitation-save_without_invitation"><@spring.message code="label.save_without_invitation"/></a>
		</div>
	</div>
</div>