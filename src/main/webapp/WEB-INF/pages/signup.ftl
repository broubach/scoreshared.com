<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Sign up">
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<div class="columns large-6">
			<div class="box-content">
				<h2>SignUp with your Facebook Account</h2>
				<div class="centered">
					<a href="#"><img src="<@spring.url relativeUrl="/img/buttons/button-login-fb.png"/>" alt="" /></a>
				</div>
			</div>
		</div>
		<div class="columns large-6">
			<div class="box-content">
				<h2>SignUp with your e-mail</h2>
				<form action="/scoreshared/pages/signup" id="UserDisplayForm" method="post" accept-charset="utf-8"><div style="display:none;"><input type="hidden" name="_method" value="POST"/></div><div class="input text"><label for="UserName">Name</label><input name="data[User][name]" type="text" id="UserName"/></div><div class="input text"><label for="UserEmail">Email</label><input name="data[User][email]" type="text" id="UserEmail"/></div><div class="input password"><label for="UserPassword">Password</label><input name="data[User][password]" type="password" id="UserPassword"/></div><div class="input password"><label for="UserPassword">Confirm password</label><input name="data[User][password]" type="password" id="UserPassword"/></div><div class="submit"><input  class="button button-large button-primary button-enroll" type="submit" value="Sign Up"/></div></form>	
			</div>
		</div>
	</div>		
	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>