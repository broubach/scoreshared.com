<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.8.3.min.js"/>"></script>
</head>
<body>
	<ul>
		<li><@spring.message code="label.contact"/> (4)</li>
		<li><@spring.message code="label.approval"/> (3)</li>
		<li><@spring.message code="label.revision"/> (3)</li>
		<li><@spring.message code="label.commentary"/> (0)</li>
	</ul>
	<table>
		<#list contacts as item>
		<tr>
			<td><img src="<@spring.url relativeUrl="/app/avatar?hash=${(item[0]?html)!}&small"/>"/></td>
			<td>${item[1]} ${item[2]}</td>
			<td><a href="accept,${item[3]}"><@spring.message code="label.accept"/></a></td>
			<td><a href="ignore,${item[3]}"><@spring.message code="label.ignore"/></a></td>
		</tr>
		</#list>
	</table>

</body>
</html>

<script type="text/javascript">
var ClickContext = {
		tableLine: {}
};
$(function() {
	$("td a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).parent().parent();

		var kind = $(this).attr('href').split(',')[0];
		var id = $(this).attr('href').split(',')[1];
		var url = '<@spring.url relativeUrl="/app/"/>' + kind + '/invitation/';

    	$.ajax({
		    url: url,
		    type: 'POST',
		    data: {'user2Id': id},
		    dataType: 'json',
		    success: function() {
		    	ClickContext.tableLine.remove();
		    }
		});
	});
});
</script>