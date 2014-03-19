<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_css=["/css/vendor/select2.css"]>
	<#assign head_additional_js=["/js/vendor/select2.js",
  								"/js/jquery.maskedinput-1.3.1.min.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.home"/></a> <a href="#"><@spring.message code="label.profile"/></a>
		</nav>	
		<div class="box-content">
			<h2><@spring.message code="label.profile"/></h2>

			<div class="section-container vertical-tabs" data-section="vertical-tabs">
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.basic_information"/></a>
					</p>
					<div class="content" data-section-content="">
						<p><h3><@spring.message code="label.basic_information"/></h3></p>

						<@spring.bind "basicInformationForm" />
						<#if (spring.status.errors.globalErrorCount > 0)>
							<@spring.showErrors "", "label radius"/>
						</#if>

						<form action="<@spring.url relativeUrl="/app/profile/basic-information"/>" method="post" accept-charset="utf-8">
							<div class="input text"><@spring.bind "basicInformationForm.firstName" /><@spring.showErrors "<br/>", "label radius"/><label for="firstName"><@spring.message code="label.first_name"/></label><@spring.formInput "basicInformationForm.firstName", "maxlength='45'", "text"/></div>
							<div class="input text"><@spring.bind "basicInformationForm.lastName" /><@spring.showErrors "<br/>", "label radius"/><label for="lastName"><@spring.message code="label.last_name"/></label><@spring.formInput "basicInformationForm.lastName", "maxlength='45'", "text"/></div>
							<div class="input text"><@spring.bind "basicInformationForm.email" /><@spring.showErrors "<br/>", "label radius"/><label for="email"><@spring.message code="label.email"/></label><@spring.formInput "basicInformationForm.email", "maxlength='45'", "text"/></div>
							<div class="input text"><@spring.bind "basicInformationForm.emailConfirmation" /><@spring.showErrors "<br/>", "label radius"/><label for="emailConfirmation"><@spring.message code="label.email_confirmation"/></label><@spring.formInput "basicInformationForm.emailConfirmation", "maxlength='45'", "text"/></div>
							<!-- IF user is connected to FB, let's not allow him to update his email. He should disconnect from FB first. -->
							<div class="input text"><@spring.bind "basicInformationForm.password" /><@spring.showErrors "<br/>", "label radius"/><label for="password"><@spring.message code="label.password"/></label><@spring.formInput "basicInformationForm.password", "maxlength='45'", "password"/></div>
							<div class="input text"><@spring.bind "basicInformationForm.gender" /><@spring.showErrors "<br/>", "label radius"/>
								<label for="gender"><@spring.message code="label.gender"/></label>
								<#assign label_gender_hint><@spring.message code="label.gender"/></#assign>
								<#assign label_gender_male><@spring.message code="label.gender_male"/></#assign>
								<#assign label_gender_female><@spring.message code="label.gender_female"/></#assign>
								<#assign genderHash = {"0":label_gender_hint,"M":label_gender_male,"F":label_gender_female} >
								<@spring.formSingleSelect "basicInformationForm.gender", genderHash, "style='width: 200px'" />
							</div>
							<div class="input text"><@spring.bind "basicInformationForm.birthday" /><@spring.showErrors "<br/>", "label radius"/><label for="birthday"><@spring.message code="label.birthday"/></label><@spring.formInput "basicInformationForm.birthday", "maxlength='10'", "text"/></div>

							<div class="row">
								<div class="columns small-12 direita">
									<button type="submit" class="button button-large button-primary button-enroll"><@spring.message code="label.save" /></button>
								</div>
							</div>
						</form>
					</div>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/personal-information"/>"><@spring.message code="label.personal_information"/></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/social-networks"/>"><@spring.message code="label.social_networks"/></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/avatar"/>"><@spring.message code="label.avatar"/></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/players/ascending/true"/>"><@spring.message code="label.players"/></a>
					</p>
				</section>
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
		$('#gender').select2({minimumResultsForSearch: -1});
		$("#birthday").mask("99/99/9999");
	});
</script>