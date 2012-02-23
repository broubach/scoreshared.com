<#import "/spring.ftl" as spring />

<html>
	<head>
		<title><@spring.message code="label.scoreshared"/></title>
		<link type="text/css" href="<@spring.url relativeUrl="/css/le-frog/jquery-ui-1.8.17.custom.css"/>" rel="Stylesheet" />	
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.7.1.min.js"/>"></script>
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-ui-1.8.17.custom.min.js"/>"></script>
	</head>
	<body>
		<form method="post" action="">
			<dl>
				<dt><label for="date"><@spring.message code="label.date"/></label></dt>
				<dd><@spring.formInput "score.date", "", "text"/> <@spring.formInput "score.time", "", "text"/></dd>
			</dl>
			<div id="playersPane">
				<@spring.formInput "score.playersLeft", "", "text"/> <@spring.formInput "score.playersRight", "", "text"/>
			</div>
			<dl id="setsPane">
				<dt><label for="set1Left"></label></dt>
				<dd><@spring.formInput "score.set1Left", "", "text"/> <@spring.formInput "score.set1Right", "", "text"/> <a href="javascript:Sets.increase();">+ <@spring.message code="label.set"/></a></dd>
			</dl>
			<#list 2..5 as i>
				<#if !(score.sets['"set"+i+"Left"'?eval]??)><#break></#if>
				<dl id="setsPane${i}">
					<dt><label for="set${i}Left"></label></dt>
					<dd><@spring.formInput "score.set${i}Left", "", "text"/> <@spring.formInput "score.set${i}Right", "", "text"/> <a href="javascript:Sets.increase();">+ <@spring.message code="label.set"/></a></dd>
				</dl>
			</#list>
			<dl>
				<dt><label for="comment"><@spring.message code="label.comment"/></label></dt>
				<dd><@spring.formTextarea "score.comment"/> <@spring.formCheckbox "score.private"/> <label for="private"><@spring.message code="label.private"/></label></dd>
			</dl>
			<@spring.formCheckbox "score.postInTwitter"/> <label for="postInTwitter"><@spring.message code="label.post_in_twitter"/></label>
			<@spring.formCheckbox "score.postInFacebook"/> <label for="postInFacebook"><@spring.message code="label.post_in_facebook"/></label>
			<input type="button" value="<@spring.message code="label.save"/>"/>
		</form>
	</body>
</html>

<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery.numeric.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery.maskedinput-1.3.min.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/score.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/json2.js"/>"></script>
<script type="text/javascript">
	$("#set1Left,#set1Right,#set2Left,#set2Right,#set3Left,#set3Right,#set4Left,#set4Right,#set5Left,#set5Right").numeric({ decimal: false, negative: false });
	$("#time").mask("99:99");
	$("#date").datepicker({dateFormat: '<@spring.message code="label.datepicker_date_format"/>'});
	Sets.init("playersPane", "setsPane", "<@spring.message code="label.nth_set"/>", "<@spring.message code="label.set"/>");
	$(':button').click(function() {
		$.ajax({
	  		url: '<@spring.url relativeUrl="/app/score"/>',
	  		data: $("form").serialize(), 
	  		type: 'POST',
	  		dataType: 'json',
			success: function( data ) {
			  if (console && console.log){
			    console.log( 'Sample of data:', data.slice(0,100) );
			  }
			}
		});
	});
</script>