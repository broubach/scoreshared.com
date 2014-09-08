<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign should_show_feedback=false/>
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content no-padding-bottom">
		<div class="small-6 small-centered columns">
			<#if (SPRING_SECURITY_LAST_EXCEPTION??)>
				<div class="error-panel label alert radius">
					<@spring.message code="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
				</div>
			</#if>
		</div>
	</div>
	<div class="row content no-padding-bottom">
		<div class="small-6 small-centered columns">
			<form action="<@spring.url relativeUrl="/app/j_spring_security_check"/>" method="POST">
				<div class="input text"><label for="username"><@spring.message code="label.email"/></label><input id="username" name="j_username" type="text"></input></div>
				<div class="input password"><label for="password"><@spring.message code="label.password"/></label><input id="password" name="j_password" type="password"></input></div>
				<div class="submit">
					<input class="button button-large button-primary button-enroll" type="submit" value="<@spring.message code="label.login"/>"></input>
				</div>
			</form>
		</div>
	</div>
	<div class="row content no-padding-top no-padding-bottom">
		<div class="small-6 small-centered columns">
			<div class="row content">
				<div class="small-2 columns">
					<span class="label secondary"><@spring.message code="label.login_with"/></span>
				</div>
				<div class="small-5 columns direita">
					<form action="<@spring.url relativeUrl="/app/signin/twitter"/>" method="POST"><button type="submit" class="radius button-small secondary"><img src="<@spring.url relativeUrl="/img/twitter.png"/>"/> <@spring.message code="label.twitter"/></button></form>
				</div>
				<div class="small-5 columns">
					<form action="<@spring.url relativeUrl="/app/signin/facebook"/>" method="POST"><input type="hidden" name="scope" value="email" /><button type="submit" class="radius button-small secondary"><img src="<@spring.url relativeUrl="/img/fb.png"/>"/> <@spring.message code="label.facebook"/></button></form>
				</div>
			</div>
		</div>
	</div>

	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>