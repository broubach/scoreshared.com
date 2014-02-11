<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
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
					<form action="<@spring.url relativeUrl="/app/forgotPassword/resetPassword"/>" method="POST" accept-charset="utf-8" >
						<input type="hidden" value="${hash}" id="hash" name="hash"/>
						<p><@spring.message code="label.i_see_youve_received_our_email_now_just_let_us_know_what_your_new_password_is"/></p>
						<#if errorMessage??>
							<div class="row">
								<div class="columns small-12">
									<div class="label radius alert">${errorMessage}</div>
								</div>
							</div>
						</#if>
						<div class="row">
							<div class="columns small-6">
								<div class="input text"><label for="newPassword"><@spring.message code="label.new_password"/></label><input type="password" name="newPassword" id="newPassword"></div>
							</div>
						</div>
						<div class="row">
							<div class="columns small-6">
								<div class="input text"><label for="newPasswordConfirmation"><@spring.message code="label.new_password_confirmation"/></label><input type="password" name="newPasswordConfirmation" id="newPasswordConfirmation"></div>
							</div>
						</div>
						<div class="row">
							<div class="columns small-6">
								<div class="submit"><button type="submit" class="no-margin-top button button-primary"><@spring.message code="label.send"/></button></div>
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