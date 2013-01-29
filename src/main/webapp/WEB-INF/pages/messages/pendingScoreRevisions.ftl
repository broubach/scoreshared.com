<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
	<link type="text/css" href="<@spring.url relativeUrl="/css/le-frog/jquery-ui-1.9.2.custom.min.css"/>" rel="Stylesheet" />	
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.8.3.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-ui-1.9.2.custom.min.js"/>"></script>
</head>
<body>
    <#include "messagesSnippet.ftl">

	<form id="review-form" method="post" action="<@spring.url relativeUrl="/app/review/revision"/>">
		<input type="hidden" id="scoreId" name="scoreId" />
		<table>
			<#list pendingRevisions as item>
			<tr>
				<td><img src="<@spring.url relativeUrl="/app/avatar?hash=${(item.playerPermission.player.avatar?html)!}&small"/>"/></td>
				<td>${item.detailText}</td>
				<td>${item.playerPermission.revisionMessage}</td>
				<td><a href="review,${item.score.id}"><@spring.message code="label.review"/></a></td>
				<td><a href="ignore,${item.playerPermission.id}"><@spring.message code="label.ignore"/></a></td>
			</tr>
			</#list>
		</table>
	</form>
</html>

<script type="text/javascript">
var ClickContext = {
		tableLine: {},
};
$(function() {
	$("td a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).parent().parent();

		var kind = $(this).attr('href').split(',')[0];
		var id = $(this).attr('href').split(',')[1];
		var url = '<@spring.url relativeUrl="/app/"/>' + kind + '/revision/';
		if (kind != 'review') {
	    	$.ajax({
			    url: url,
			    type: 'POST',
			    data: {'playerPermissionId': id},
			    dataType: 'json',
			    success: function() {
			    	ClickContext.tableLine.remove();
			    }
			});

		} else {
			$('#scoreId').val(id);
			$('#review-form').submit();
		}
	});
});
</script>