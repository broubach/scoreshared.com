<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
	<link type="text/css" href="<@spring.url relativeUrl="/css/le-frog/jquery-ui-1.9.2.custom.min.css"/>" rel="Stylesheet" />	
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.8.3.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-ui-1.9.2.custom.min.js"/>"></script>
</head>
<body>

<#include "userMenusSnippet.ftl" />

<h1><@spring.message code="label.you_dont_have_scores_shared"/></h1>

<div>
	<h2><@spring.message code="label.see_who_already_registered_their_results"/></h2>

	<table id="globalScoresTable">
	<#list scores as item>
	<tr>
		<td>
			<#if item.leftPlayerAvatar?has_content>
				<img src="<@spring.url relativeUrl="/app/avatar?hash=${item.leftPlayerAvatar}&small"/>"/>
			</#if>
		</td>
		<td>${item.leftPlayerName}</td>
		<td>${item.scoreText}</td>
		<td>${item.rightPlayerName}</td>
		<td>
			<#if item.rightPlayerAvatar?has_content>
				<img src="<@spring.url relativeUrl="/app/avatar?hash=${item.rightPlayerAvatar}&small"/>"/>
			</#if>
		</td>
	</tr>
	</#list>
	</table>
</div>

<div>
	<form>
		<input id="shareButton" type="button" value="<@spring.message code="label.share_score"/>">
	</form>
</div>

<#include "dialogRevisionSnippet.ftl">

</body>
</html>

<script type="text/javascript" src="<@spring.url relativeUrl="/js/scaffold/playerDecorationUtil.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/scaffold/messageUtil.js"/>"></script>

<script type="text/javascript">

var ClickContext = {
	tableLine: {},
	currentId: {},
	currentUrl: {}
};

$(function() {
	$('#shareButton').click(function() {
		document.location.href = '<@spring.url relativeUrl="/app/score"/>';
	});

	PlayerDecorationUtil.addPlayerLinksTo('#messagesMenu,#globalScoresTable', ${players}, '<@spring.url relativeUrl="/"/>');

	MessageUtil.addClickBehaviorToMessagesList('li a', '<@spring.url relativeUrl="/"/>', {
		label_send_a_message_to_asking_for_revision_1_send_a_message_to: '<@spring.message code="label.send_a_message_to_asking_for_revision_1_send_a_message_to"/>',
		label_send_a_message_to_asking_for_revision_2_asking_for_revision: '<@spring.message code="label.send_a_message_to_asking_for_revision_2_asking_for_revision"/>'});
});

</script>