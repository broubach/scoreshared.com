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

<div>
	<table id="scoresTable">
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
	<tfoot>
	<tr>
		<td colspan="4"><a href="<@spring.url relativeUrl="/app/scores/1/date/true"/>"><@spring.message code="label.see_all_scores"/></a></td>
	</tr>
	</tfoot>
	</table>
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
	
	PlayerDecorationUtil.addPlayerLinksTo('#messagesMenu,#scoresTable', ${players}, '<@spring.url relativeUrl="/"/>');

	MessageUtil.addClickBehaviorToMessagesList('li a', '<@spring.url relativeUrl="/"/>', {
		label_send_a_message_to_asking_for_revision_1_send_a_message_to: '<@spring.message code="label.send_a_message_to_asking_for_revision_1_send_a_message_to"/>',
		label_send_a_message_to_asking_for_revision_2_asking_for_revision: '<@spring.message code="label.send_a_message_to_asking_for_revision_2_asking_for_revision"/>'});
});

</script>