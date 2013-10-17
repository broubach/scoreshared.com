<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Sign up">
	<#assign head_additional_css=["/css/vendor/select2.css"]>
	<#assign head_additional_js=["/js/vendor/select2.js", "/js/signup.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign should_show_feedback=false/>
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<div class="columns large-6">
			<div class="box-content">
				<h2><@spring.message code="label.signup_with_your_facebook_account"/></h2>
				<div class="centered">
					<a href="#" id="fb_button"><img src="<@spring.url relativeUrl="/img/buttons/button-login-fb.png"/>"/></a>
					<form id="fb_form" action="<@spring.url relativeUrl="/app/signin/facebook"/>" method="POST"><input type="hidden" name="scope" value="email" /></form>
				</div>
			</div>
		</div>
		<div class="columns large-6">
			<div class="box-content">
				<h2><@spring.message code="label.signup_with_your_email"/></h2>
				<div id="signup">
					<#include "/signup/signup-snippet.ftl" />
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

<script type="text/javascript">
	$(function(){
		$(function() {
			SignupFlow.init('<@spring.url relativeUrl=""/>');
			SignupFlow.bindSignupDataPost();
		});

		$('#fb_button').click(function(){
			$('#fb_form').submit();
		});

		$('#gender').select2({minimumResultsForSearch: -1});
		$('#birthDay').select2({minimumResultsForSearch: -1});
		$('#birthMonth').select2({minimumResultsForSearch: -1});
		$('#birthYear').select2({minimumResultsForSearch: -1});
	});
</script>