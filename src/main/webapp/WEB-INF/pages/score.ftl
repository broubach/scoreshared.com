<#import "/spring.ftl" as spring />

<html>
	<head>
		<title><@spring.message code="label.scoreshared"/></title>
		<link type="text/css" href="<@spring.url relativeUrl="/css/le-frog/jquery-ui-1.8.17.custom.css"/>" rel="Stylesheet" />	
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.7.1.min.js"/>"></script>
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-ui-1.8.17.custom.min.js"/>"></script>
	</head>
	<body>
		<form method="post" action="<@spring.url relativeUrl="/app/score"/>">
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
			<dl>
				<dt><label for="comment"><@spring.message code="label.comment"/></label></dt>
				<dd><@spring.formTextarea "score.comment"/> <@spring.formCheckbox "score.private"/> <label for="private"><@spring.message code="label.private"/></label></dd>
			</dl>
			<@spring.formCheckbox "score.postInTwitter"/> <label for="postInTwitter"><@spring.message code="label.post_in_twitter"/></label>
			<@spring.formCheckbox "score.postInFacebook"/> <label for="postInFacebook"><@spring.message code="label.post_in_facebook"/></label>
			<input type="submit" value="<@spring.message code="label.save"/>"/>
		</form>
	</body>
</html>

<script type="text/javascript" src="<@spring.url relativeUrl="/js/score.js"/>"></script>
<script type="text/javascript">
	Sets.init("playersPane", "setsPane", "<@spring.message code="label.nth_set"/>", "<@spring.message code="label.set"/>");
</script>