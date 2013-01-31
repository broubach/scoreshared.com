<div>
	<@spring.message code="label.welcome" />,
	<ul>
		<li>${userFirstName}</li>
		<li><@spring.message code="label.profile" /></li>
		<li><@spring.message code="label.account_setup" /></li>
		<li><a href="<@spring.url relativeUrl="/j_spring_security_logout"/>"><@spring.message code="label.exit" /></a></li>
	</ul>
	<img src="<@spring.url relativeUrl="/app/avatar?hash=${loggedUserAvatarHash}&small"/>"/>
	<ul id="messagesMenu">
		<li><@spring.message code="label.messages" /></li>
		<#list messages as item>
			<#if item.type = 'CONTACT'>
				<li><@spring.message code="label.contact" />: ${item.senderName} <a href="contact,accept,${item.senderId}"><@spring.message code="label.accept"/></a> <a href="contact,ignore,${item.senderId}"><@spring.message code="label.ignore"/></a></li>
			<#elseif item.type = 'APPROVAL'>
				<li><@spring.message code="label.approval"/>: ${item.senderName} ${item.scoreText} <a href="approval,accept,${item.scoreId}"><@spring.message code="label.accept"/></a> <a href="approval,review,${item.scoreId},${item.senderName}"><@spring.message code="label.review"/></a> <a href="approval,ignore,${item.scoreId}"/><@spring.message code="label.ignore"/></a></li>
			<#elseif item.type = 'REVISION'>
				<li><@spring.message code="label.revision"/>: ${item.senderName} ${item.scoreText} <a href="revision,review,${item.scoreId}"><@spring.message code="label.review"/></a> <a href="revision,ignore,${item.playerPermissionId}"><@spring.message code="label.ignore"/></a></li>
			<#else>
				<li><@spring.message code="label.commentary"/>: ${item.senderName} ${item.message} <a href="<@spring.url relativeUrl="/app/pendingComments"/>"><@spring.message code="label.see" /></a></li>
			</#if>
		</#list>
		<form id="review-form" method="post" action="<@spring.url relativeUrl="/app/review/revision"/>">
			<input type="hidden" id="scoreId" name="scoreId" />
		</form>

		<li><a href="<@spring.url relativeUrl="/app/messages/contactRequests"/>"><@spring.message code="label.see_all_messages"/></a></li>
	</ul>
</div>