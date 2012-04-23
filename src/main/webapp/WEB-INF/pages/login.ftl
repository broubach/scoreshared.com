<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
</head>
<body>
	<form action="<@spring.url relativeUrl="/j_spring_security_check"/>" method="POST">
		<dl>
			<dt><label for="username"><@spring.message code="label.username"/></label></dt>
			<dd><input id="username" name="j_username" type="text"></input></dd>
		</dl>
		<dl>
			<dt><label for="password"><@spring.message code="label.password"/></label></dt>
			<dd><input id="password" name="j_password" type="password"></input></dd>
		</dl>

		<input type="submit" value="<@spring.message code="label.signin"/>"></input>
	</form>

	<@spring.message code="label.enterwith"/>:
	<form action="<@spring.url relativeUrl="/app/signin/twitter"/>" method="POST"><button type="submit"><img src="<@spring.url relativeUrl="/img/twitter.png"/>"/> <@spring.message code="label.twitter"/></button></form>
	<form action="<@spring.url relativeUrl="/app/signin/facebook"/>" method="POST"><button type="submit"><img src="<@spring.url relativeUrl="/img/fb.png"/>"/> <@spring.message code="label.facebook"/></button></form>
	<form action="<@spring.url relativeUrl="/app/signin/google"/>" method="POST"><button type="submit"><img src="<@spring.url relativeUrl="/img/google.png"/>"/> <@spring.message code="label.google"/></button></form>
</body>
</html>