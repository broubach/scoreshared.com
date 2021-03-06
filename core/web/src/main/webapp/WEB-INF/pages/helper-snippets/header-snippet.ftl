<div class="large-8 columns">
	<ul class="inline-list links logado right">
		<li><a href="<@spring.url relativeUrl="/app/scores/0/ALL/false"/>" class="menu-score"><@spring.message code="label.my_scores"/></a></li>
		<li><a href="<@spring.url relativeUrl="/app/notifications/contactRequests"/>" class="menu-mensagens<#if (_total_pending_notifications > 0)>-alert</#if>"><@spring.message code="label.notifications"/></a></li>
		<li><a href="#" class="menu-profile dropdown" data-dropdown="menu-profile"><@spring.message code="label.profile"/></a></li>
	</ul>
</div>
<ul id="menu-profile" class="f-dropdown">
	<li class="use-as"><@spring.message code="label.hello"/> ${associatedPlayer.association.firstName}!</li>
	<li><a href="<@spring.url relativeUrl="/app/profile/basic-information"/>"/><@spring.message code="label.profile" /></a></li>
	<li><a href="<@spring.url relativeUrl="/app/account-settings/terms-and-conditions"/>"/><@spring.message code="label.account_settings" /></a></li>
	<li><hr/></li>
	<li><a href="<@spring.url relativeUrl="/app/j_spring_security_logout"/>"><@spring.message code="label.logout" /></a></li>
</ul>