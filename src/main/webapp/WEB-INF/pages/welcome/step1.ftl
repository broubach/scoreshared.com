<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Welcome1">
	<#assign head_additional_css=["/css/vendor/select2.css"]>
	<#assign head_additional_js=["/js/vendor/select2.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<div class="small-6 large-centered columns">
			<div class="row content">
				<div class="small-4 columns">
					<a class="button no-margin-top no-margin-bottom medium secondary disabled">
						<@spring.message code="label.step1"/>
					</a>
				</div>
				<div class="small-3 small-offset-1 columns">
					<h3>
						<@spring.message code="label.step2"/>
					</h3>
				</div>
				<div class="small-3 columns">
					<h3>
						<@spring.message code="label.step3"/>
					</h3>
				</div>
			</div>
		</div>

		<div class="small-6 large-centered columns">
			<div class="centralizado">
				<h2><@spring.message code="label.please_tell_us_more_about_you"/></h2>
			</div>
	
			<@spring.bind "welcomeStep1Form" />
			<#if (spring.status.errors.globalErrorCount > 0)>
				<@spring.showErrors "", "errorClass"/>
			</#if>
			<#if (spring.status.errors.fieldErrorCount > 0)>
				<span class="alert radius label"><@spring.message code="error.please_fill_out_the_fields_tagged_with_asterisk"/></span>
			</#if>

			<form action="<@spring.url relativeUrl="/app/welcome/step1"/>" method="post" accept-charset="utf-8">
				<div class="input text"><label for="profile.city"><@spring.message code="label.in_which_city_do_you_live"/></label><@spring.formInput "welcomeStep1Form.profile.city", "maxlength='45'", "text"/></div>
				<div class="input text"><label for="profile.country"><@spring.message code="label.which_country"/></label><@spring.formInput "welcomeStep1Form.profile.country", "maxlength='45'", "text"/></div>
				<div class="input text">
					<label for="profile.sport"><@spring.message code="label.what_sport_do_you_intend_to_score"/></label>
					<#assign label_sport_tennis><@spring.message code="label.sport_tennis"/></#assign>
					<#assign label_sport_table_tennis><@spring.message code="label.sport_table_tennis"/></#assign>
					<#assign label_sport_badminton><@spring.message code="label.sport_badminton"/></#assign>
					<#assign label_sport_squash><@spring.message code="label.sport_squash"/></#assign>
					<#assign label_sport_beach_tennis><@spring.message code="label.sport_beach_tennis"/></#assign>
					<#assign label_sport_paddle><@spring.message code="label.sport_paddle"/></#assign>
					<#assign label_sport_other><@spring.message code="label.sport_other"/></#assign>
					<#assign sportsHash = {"TENNIS":label_sport_tennis, "TABLE_TENNIS":label_sport_table_tennis, "BADMINTON":label_sport_badminton, "SQUASH":label_sport_squash, "BEACH_TENNIS":label_sport_beach_tennis, "PADDLE":label_sport_paddle, "OTHER":label_sport_other} >
					<@spring.formSingleSelect "welcomeStep1Form.profile.sport", sportsHash, "style='width: 220px'" />
				</div>
				<div class="input text"><label for="profile.academy"><@spring.message code="label.in_which_academy_do_you_play_most"/></label><@spring.formInput "welcomeStep1Form.profile.academy", "maxlength='45'", "text"/></div>
				<div class="input text">
					<label for="profile.leftHanded0"><@spring.message code="label.you_are"/></label>
					<div class="switch">
						<#assign label_handed_right><@spring.message code="label.handed_right"/></#assign>
						<#assign label_handed_left><@spring.message code="label.handed_left"/></#assign>
						<#assign leftHandedHash = {"false":label_handed_right, "true":label_handed_left} />
						<@spring.formRadioButtons "welcomeStep1Form.profile.leftHanded", leftHandedHash, "", "" />
						<span></span>
					</div>
				</div>
				<div class="input text"><label for="coach"><@spring.message code="label.who_is_your_coach"/></label><@spring.formInput "welcomeStep1Form.coach", "maxlength='45'", "text"/></div>
				<div class="input text"><label for="profile.site"><@spring.message code="label.what_is_your_website"/></label><@spring.formInput "welcomeStep1Form.profile.site", "maxlength='45'", "text"/></div>
				<div class="input text"><label for="profile.style"><@spring.message code="label.define_your_style_of_game"/></label><@spring.formTextarea "welcomeStep1Form.profile.style", "" /></div>
				<div class="input text">
					<label for="profile.showContactInfoToFriends0"><@spring.message code="label.show_email_phone_to_players_in_my_list"/> *</label>
					<div class="switch">
						<#assign label_yes><@spring.message code="label.yes"/></#assign>
						<#assign label_no><@spring.message code="label.no"/></#assign>
						<#assign yesNoHash = {"true":label_yes, "false":label_no} />
						<@spring.formRadioButtons "welcomeStep1Form.profile.showContactInfoToFriends", yesNoHash, "", "" />
						<span></span>
					</div>
				</div>
				<div class="input text"><label for="profile.phone"><@spring.message code="label.phone_number"/></label><@spring.formInput "welcomeStep1Form.profile.phone", "maxlength='45'", "text"/></div>

				<span class="secondary label"><@spring.message code="label.fields_tagged_with_asterisk_are_required" /></span>
				<div class="submit"><button class="button button-large button-primary button-enroll" type="submit"><@spring.message code="label.save_and_continue" /></button></div>
			</form>
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
		$('#profile\\.sport').select2({minimumResultsForSearch: -1});
	});
</script>