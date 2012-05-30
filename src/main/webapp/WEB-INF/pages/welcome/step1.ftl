<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
</head>
<body>

<h2><@spring.message code="label.welcome"/></h2>

<div>
	<ul>
		<li><h4><@spring.message code="label.step1"/></h4></li>
		<li><h6><@spring.message code="label.step2"/></h6></li>
		<li><h6><@spring.message code="label.step3"/></h6></li>
	<ul>
</div>

<h3><@spring.message code="label.tell_us_more_about_you"/></h3>

	<form action="<@spring.url relativeUrl="/app/welcome/step1"/>" method="post">
		<dl>
			<dt><label for="city"><@spring.message code="label.which_city_do_you_live"/></label></dt>
			<dd>
				<@spring.formInput "welcomeStep1Form.city", "maxlength='45'", "text"/>
			</dd>
		</dl>

		<dl>
			<dt><label for="country"><@spring.message code="label.which_country"/></label></dt>
			<dd><@spring.formInput "welcomeStep1Form.country", "maxlength='45'", "text"/></dd>
		</dl>

		<dl>
			<dt><label for="club"><@spring.message code="label.which_club_do_you_play_most"/></label></dt>
			<dd><@spring.formInput "welcomeStep1Form.club", "maxlength='45'", "text"/></dd>
		</dl>

		<dl>
			<dt><label for="leftHanded0"><@spring.message code="label.you_are"/></label></dt>
			<dd>
				<#assign label_handed_right><@spring.message code="label.handed_right"/></#assign>
				<#assign label_handed_left><@spring.message code="label.handed_left"/></#assign>
				<#assign leftHandedHash = {"false":label_handed_right, "true":label_handed_left} />
				<@spring.formRadioButtons "welcomeStep1Form.leftHanded", leftHandedHash, "", "" />
			</dd>
		</dl>

		<dl>
			<dt><label for="styleDescription"><@spring.message code="label.define_your_style_of_game"/></label></dt>
			<dd><@spring.formTextarea "welcomeStep1Form.styleDescription", "" /></dd>
		</dl>

		<dl>
			<dt><label for="showContactToPlayers0"><@spring.message code="label.show_email_phone_to_players_in_my_list"/> *</label></dt>
			<dd>
				<#assign label_yes><@spring.message code="label.yes"/></#assign>
				<#assign label_no><@spring.message code="label.no"/></#assign>
				<#assign yesNoHash = {"true":label_yes, "false":label_no} />
				<@spring.formRadioButtons "welcomeStep1Form.showContactToPlayers", yesNoHash, "", "" />
			</dd>
		</dl>

		<dl>
			<dt><label for="phoneNumber"><@spring.message code="label.phone_number"/></label></dt>
			<dd><@spring.formInput "welcomeStep1Form.phoneNumber", "maxlength='45'", "text"/></dd>
		</dl>

		<dl>
			<dt>
				<label for="agree0"><@spring.message code="label.i_have_read_and_agreed_with_the_service_license"/> *</label><br/>
				<a href="#"><@spring.message code="label.click_to_read_the_service_license"/></a>
			</dt>
			<dd>
				<@spring.formRadioButtons "welcomeStep1Form.agree", yesNoHash, "", "" />
			</dd>
		</dl>

		<button type="submit"><@spring.message code="label.save_and_continue" /></button>
	</form>

</body>
</html>