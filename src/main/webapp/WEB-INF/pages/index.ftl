<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.7.1.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/index.js"/>"></script>
</head>
<body>
	<div id="header">
		<div id="logo">score<br>shared</div>
		<div id="login">
			<form action="<@spring.url relativeUrl="/j_spring_security_check"/>" method="POST">
				<input id="j_username" name="j_username" type="text" maxlength="45"></input>
				<input id="j_password" name="j_password" type="password"></input>
				<input type="submit" value="<@spring.message code="label.enter"/>"></input>
			</form>
		</div>
	</div>
	<div id="content">
		<div id="video">
			VIDEO
		</div>
		<div id="signup">
			<#include "signupSnippet.ftl">
		</div>
	</div>
	<div id="footer">
	</div>
</body>
</html>

<script type="text/javascript">
	$(function() {
		SignupFlow.init('<@spring.url relativeUrl=""/>');
		SignupFlow.bindSignupDataPost();
	});
</script>