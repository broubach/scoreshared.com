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
	<table>
		<#list pendingScores as item>
		<tr>
			<td><img src="<@spring.url relativeUrl="/app/avatar?hash=${(item.sampleOpponentAvatar?html)!}&small"/>"/></td>
			<td>${item.detailText}</td>
			<td><a href="accept,${item.score.id},${item.sampleOpponentName}"><@spring.message code="label.accept"/></a></td>
			<td><a href="review,${item.score.id},${item.sampleOpponentName}"><@spring.message code="label.ask_for_revision"/></a></td>
			<td><a href="ignore,${item.score.id},${item.sampleOpponentName}"><@spring.message code="label.ignore"/></a></td>
		</tr>
		</#list>
	</table>

	<#include "../dialogRevisionSnippet.ftl">
</html>

<script type="text/javascript">
var ClickContext = {
		tableLine: {},
		currentId: {},
		currentUrl: {}
};
$(function() {
	$("td a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).parent().parent();

		var kind = $(this).attr('href').split(',')[0];
		var id = $(this).attr('href').split(',')[1];
		var userName = $(this).attr('href').split(',')[2];
		var url = '<@spring.url relativeUrl="/app/"/>' + kind + '/score/';
		if (kind != 'review') {
	    	$.ajax({
			    url: url,
			    type: 'POST',
			    data: {'scoreId': id},
			    dataType: 'json',
			    success: function() {
			    	ClickContext.tableLine.remove();
			    }
			});

		} else {
			ClickContext.currentId = id;
			ClickContext.currentUrl = url;
			$('#info').val('<@spring.message code="label.send_a_message_to_asking_for_revision_1_send_a_message_to"/>' + userName + '<@spring.message code="label.send_a_message_to_asking_for_revision_2_asking_for_revision"/>');
	        $("#dialog-revision").dialog("open");

		}
	});

	$( "#dialog-revision" ).dialog({
		autoOpen: false,
		modal: true,
		width:'auto',
		buttons: [{
			text: '<@spring.message code="label.send_request"/>',
			click: function() {
				if ($.trim($("#revision-form textarea").val()) == "") {
					$("#revision-form .error-panel").html('<@spring.message code="error.please_enter_some_text"/>');
					return;
				}

		    	$.ajax({
				    url: ClickContext.currentUrl,
				    type: 'POST',
				    data: {
				    	'scoreId': ClickContext.currentId,
				    	'message': $('#message').val()
				    },
				    dataType: 'json',
				    success: function() {
				    	ClickContext.tableLine.remove();
				        $("#dialog-revision").dialog("close");
				    }
				});
			}
		},{
			text: '<@spring.message code="label.cancel"/>',
			click: function() {
		        $("#dialog-revision").dialog("close");
			}
		}]
	});
});
</script>