<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_css=["/css/vendor/select2.css"]>
	<#assign head_additional_js=["/js/vendor/select2-3.4.6.min.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.home"/></a> <a href="#" class="current"><@spring.message code="label.profile"/></a>
		</nav>	
		<div class="box-content">
			<h2><@spring.message code="label.profile"/></h2>

			<div class="section-container vertical-tabs" data-section="vertical-tabs">
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/basic-information"/>"><@spring.message code="label.basic_information"/></a>
					</p>
				</section>
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.personal_information"/></a>
					</p>
					<div class="content" data-section-content="">
						<p><h3><@spring.message code="label.personal_information"/></h3></p>

						<form action="<@spring.url relativeUrl="/app/profile/personal-information"/>" method="post" accept-charset="utf-8">
							<div class="input text"><label for="profile.city"><@spring.message code="label.in_which_city_do_you_live"/></label><@spring.formInput "personalInformationForm.profile.city", "maxlength='45'", "text"/></div>
							<div class="input text"><label for="profile.country"><@spring.message code="label.which_country"/></label><@spring.formInput "personalInformationForm.profile.country", "maxlength='45'", "text"/></div>
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
								<@spring.formSingleSelect "personalInformationForm.profile.sport", sportsHash, "style='width: 220px'" />
							</div>
							<div class="input text"><label for="profile.academy"><@spring.message code="label.in_which_academy_do_you_play_most"/></label><@spring.formInput "personalInformationForm.profile.academy", "maxlength='45'", "text"/></div>
							<div class="input text">
								<label for="profile.leftHanded0"><@spring.message code="label.you_are"/></label>
								<div class="switch">
									<#assign label_handed_right><@spring.message code="label.handed_right"/></#assign>
									<#assign label_handed_left><@spring.message code="label.handed_left"/></#assign>
									<#assign leftHandedHash = {"false":label_handed_right, "true":label_handed_left} />
									<@spring.formRadioButtons "personalInformationForm.profile.leftHanded", leftHandedHash, "", "" />
									<span></span>
								</div>
							</div>
							<div class="input text"><label for="profile.coachName"><@spring.message code="label.who_is_your_coach"/></label><@spring.formInput "personalInformationForm.profile.coachName", "maxlength='45'", "text"/></div>
							<div class="input text"><label for="profile.site"><@spring.message code="label.what_is_your_website"/></label><@spring.formInput "personalInformationForm.profile.site", "maxlength='45'", "text"/></div>
							<div class="input text"><label for="profile.style"><@spring.message code="label.define_your_style_of_game"/></label><@spring.formTextarea "personalInformationForm.profile.style", "" /></div>
							<div class="input text">
								<label for="profile.showContactInfoToFriends0"><@spring.message code="label.show_email_phone_to_players_in_my_list"/> *</label>
								<div class="switch">
									<#assign label_yes><@spring.message code="label.yes"/></#assign>
									<#assign label_no><@spring.message code="label.no"/></#assign>
									<#assign yesNoHash = {"true":label_yes, "false":label_no} />
									<@spring.formRadioButtons "personalInformationForm.profile.showContactInfoToFriends", yesNoHash, "", "" />
									<span></span>
								</div>
							</div>
							<div class="input text"><label for="profile.phone"><@spring.message code="label.phone_number"/></label><@spring.formInput "personalInformationForm.profile.phone", "maxlength='45'", "text"/></div>

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
		$('#profile\\.sport').select2({minimumResultsForSearch: -1});
	});
</script>