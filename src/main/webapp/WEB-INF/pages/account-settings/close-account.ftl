<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Home">
	<#assign head_additional_js=["/js/jquery.autosize-1.17.8.min.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.account_settings"/></a>
		</nav>	
		<div class="box-content">
			<h2><@spring.message code="label.account_settings"/></h2>

			<div class="section-container vertical-tabs" data-section="vertical-tabs">
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/account-settings/terms-and-conditions"/>"><@spring.message code="label.terms_and_conditions"/></a>
					</p>
				</section>
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.close_account"/></a>
					</p>
					<div class="content" data-section-content="">
						<form action="<@spring.url relativeUrl="/app/accountSettings/closeAccount"/>" method="POST" accept-charset="utf-8" >
							<a id="captcha-anchor"></a>
							<p><h3><@spring.message code="label.close_account_scoreshared"/></h3></p>
							<p><@spring.message code="label.close_account_please_feel_free_to_evaluate_us_and_letus_know_the_reasons_that_made_you_leave_service"/></p>
							<p><textarea id="reason" name="reason" maxlength='5000' class="autosize">${reason}</textarea></p>
							<p><@spring.message code="label.close_account_warnings"/></p>
							<p><@spring.message code="label.close_account_thank_you_very_much_for_the_time_you_stood_with_us"/></p>
							<p><@spring.message code="label.close_account_for_security_reasons_confirm_the_text_shown_in_the_image_bellow"/></p>
							<div class="row">
								<div class="columns small-5">
									<a id="refresh-captcha" href="#captcha-anchor"><@spring.message code="label.try_with_other_words"/></a>
									<img id="captcha" src="<@spring.url relativeUrl="/app/captcha"/>"/>
								</div>
								<div class="columns small-2">
									<input id="captchaAnswer" name="captchaAnswer" type="text" maxlength="5"></input>
								</div>
								<div class="columns small-5">
								</div>
							</div>
							<#if errorMessage??>
								<div class="row">
									<div class="columns small-12 direita">
										<div class="label radius alert">${errorMessage}</div>
									</div>
								</div>
							</#if>
							<div class="row">
								<div class="columns small-12 direita">
									<button type="submit" id="save" class="no-margin-top button button-primary"><@spring.message code="label.close_account"/></button>
								</div>
							</div>
						</form>
					</div>
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
$('#refresh-captcha').click(function() {
	$('#captcha').attr('src', '<@spring.url relativeUrl="/app/captcha?"/>' + (new Date()).getTime());
});

$('.autosize').autosize({append: "\n"});
</script>