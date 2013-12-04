<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Sign up">
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign should_show_feedback=false/>
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<div class="columns large-12">
			<div class="box-content">
				<h2><@spring.message code="label.forgot_your_password"/></h2>
				<div class="centered">
					<form action="<@spring.url relativeUrl="/app/forgotPassword/sendInstructions"/>" method="POST" accept-charset="utf-8" >
						<p><@spring.message code="label.no_problem_just_let_us_know_what_your_email_is_and_well_send_you_instructions_to_reset_your_password"/></p>
						<#if errorMessage??>
							<div class="row">
								<div class="columns small-12">
									<div class="label radius alert">${errorMessage}</div>
								</div>
							</div>
						</#if>
						<div class="row">
							<div class="columns small-6">
								<input type="text" placeholder="<@spring.message code="label.email"/>" name="email" id="email" value="${email}">
							</div>
							<div class="columns small-6">
								<button type="submit" class="no-margin-top button button-primary"><@spring.message code="label.send"/></button>
							</div>
						</div>
					</form>
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