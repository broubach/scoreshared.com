<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.8.3.min.js"/>"></script>
</head>
<body>

<div>
	<@spring.message code="label.welcome" />,
	<ul>
		<li>${userFirstName}</li>
		<li><@spring.message code="label.profile" /></li>
		<li><@spring.message code="label.account_setup" /></li>
		<li><a href="<@spring.url relativeUrl="/j_spring_security_logout"/>"><@spring.message code="label.exit" /></a></li>
	</ul>
	<img src="<@spring.url relativeUrl="/app/avatar?hash=${loggedUserAvatarHash}&small"/>"/>
	<ul>
		<li><@spring.message code="label.messages" /></li>
		<#list messages as item>
			<#if item.type = 'CONTACT'>
				<li><@spring.message code="label.contact" />: ${item.sender} <a href="<@spring.url relativeUrl="/app/accept/invitation"/>"><@spring.message code="label.accept"/></a> <a href="<@spring.url relativeUrl="/app/ignore/invitation"/>"><@spring.message code="label.ignore"/></a></li>
			<#elseif item.type = 'APPROVAL'>
				<li><@spring.message code="label.approval"/>: ${item.sender} ${item.scoreText} <a href="<@spring.url relativeUrl="/app/accept/score"/>"><@spring.message code="label.accept"/></a> <a href="#"><@spring.message code="label.review"/></a> <a href="<@spring.url relativeUrl="/app/ignore/score"/>"><@spring.message code="label.ignore"/></a></li>
			<#elseif item.type = 'REVISION'>
				<li><@spring.message code="label.revision"/>: ${item.sender} ${item.scoreText} <a href="<@spring.url relativeUrl="/app/review/revision"/>"><@spring.message code="label.review"/></a> <a href="<@spring.url relativeUrl="/app/ignore/revision"/>"><@spring.message code="label.ignore"/></a></li>
			<#else>
				<li><@spring.message code="label.commentary"/>: ${item.sender} ${item.message} <a href="<@spring.url relativeUrl="/app/pendingComments"/>"><@spring.message code="label.see" /></a></li>
			</#if>
		</#list>
		<li><a href="<@spring.url relativeUrl="/app/messages/contactRequests"/>"><@spring.message code="label.see_all_messages"/></a></li>
	</ul>
</div>

<div>
	<table>
		<thead>
			<tr>
				<td colspan="4"><@spring.message code="label.my_latest_scores"/></td>
			</tr>
		</thead>
		<#list scores as item>
			<tr>
				<td>
					${item.dateTime}
				</td>
				<td>${item.detailText}</td>
				<td>
					<#if item.comment??>
						<img src="<@spring.url relativeUrl="/img/text_align_justify.png"/>" title="${item.comment.description}"/>
					</#if>
				</td>
				<td>
					<#assign avatarHash>${item.sampleOpponentAvatar}</#assign>
					<#if avatarHash?has_content>
						<img src="<@spring.url relativeUrl="/app/avatar?hash=${avatarHash}&small"/>"/>
					</#if>
				</td>
			</tr>
		</#list>
	</table>
	<a href="<@spring.url relativeUrl="/app/scores/1/date/true"/>"><@spring.message code="label.see_all_scores"/></a>
</div>

<div>
	<form>
		<input id="shareButton" type="button" value="<@spring.message code="label.share_score"/>">
	</form>

	<img src="<@spring.url relativeUrl="/app/stats/chart/${win}/${loss}"/>">
</div>

<#include "dialogRevisionSnippet.ftl">

</body>
</html>

<script type="text/javascript">

$(function() {
	$('#shareButton').click(function() {
		document.location.href = '<@spring.url relativeUrl="/app/score"/>';
	});
});

</script>