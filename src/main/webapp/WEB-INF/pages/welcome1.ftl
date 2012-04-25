<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
</head>
<body>

<h2><@spring.message code="label.welcome"/></h2>

<div>
	<span><@spring.message code="label.step1"/></span>
	<span><@spring.message code="label.step2"/></span>
	<span><@spring.message code="label.step3"/></span>
</div>

<h3><@spring.message code="label.tell_us_more_about_you"/></h3>

	<form action="<@spring.url relativeUrl="/app/welcome1"/>" method="post">
		<dl>
			<dt><label for="city"><@spring.message code="label.which_city_do_you_live"/></label></dt>
			<dd><input id="city" name="city" type="text" maxlength="45"></input></dd>
		</dl>

		<dl>
			<dt><label for="country"><@spring.message code="label.which_country"/></label></dt>
			<dd><input id="country" name="country" type="text" maxlength="45"></input></dd>
		</dl>

		<dl>
			<dt><label for="club"><@spring.message code="label.which_club_do_you_play_most"/></label></dt>
			<dd><input id="club" name="club" type="text" maxlength="45"></input></dd>
		</dl>

		<dl>
			<dt><label for="rightHanded"><@spring.message code="label.you_are"/></label></dt>
			<dd>
				<input id="rightHanded" name="leftHanded" type="radio" value="false"><label for="rightHanded"><@spring.message code="label.handed_right"/></label></input>
				<input id="leftHanded" name="leftHanded" type="radio" value="true"><label for="leftHanded"><@spring.message code="label.handed_left"/></label></input>
			</dd>
		</dl>

		<dl>
			<dt><label for="styleDescription"><@spring.message code="label.define_your_style_of_game"/></label></dt>
			<dd><textarea id="styleDescription" name="styleDescription"></textarea></dd>
		</dl>

		<dl>
			<dt><label for="showContactToPlayers"><@spring.message code="label.show_email_phone_to_players_in_my_list"/></label></dt>
			<dd>
				<input id="showContactToPlayers" name="showContactToPlayers" type="radio" value="true"><label for="showContactToPlayers"><@spring.message code="label.agree"/></label></input>
				<input id="dontShowContactToPlayers" name="showContactToPlayers" type="radio" value="false"><label for="dontShowContactToPlayers"><@spring.message code="label.disagree"/></label></input>
			</dd>
		</dl>

		<dl>
			<dt><label for="phoneNumber"><@spring.message code="label.phone_number"/></label></dt>
			<dd>
				<input id="phoneNumber" name="phoneNumber" type="text" maxlength="45"></input>
			</dd>
		</dl>

		<dl>
			<dt>
				<label for="agree"><@spring.message code="label.i_have_read_and_agreed_with_the_service_license"/></label><br/>
				<a href="#"><@spring.message code="label.click_to_read_the_service_license"/></a>
			</dt>
			<dd>
				<input id="agree" name="agree" type="radio" value="true"><label for="agree"><@spring.message code="label.yes"/></label></input>
				<input id="dontAgree" name="agree" type="radio" value="false"><label for="dontAgree"><@spring.message code="label.no"/></label></input>
			</dd>
		</dl>
	</form>

</body>
</html>