<#import "/spring.ftl" as spring />

<div id="dialog-friendRequest" title="<@spring.message code="label.association"/>">
	<form id="friendRequest-form">
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