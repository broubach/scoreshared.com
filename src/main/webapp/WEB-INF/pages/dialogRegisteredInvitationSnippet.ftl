<#import "/spring.ftl" as spring />

<div id="dialog-registeredInvitation" title="<@spring.message code="label.invite"/>">
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
</div>