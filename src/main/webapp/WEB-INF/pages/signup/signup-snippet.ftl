<#import "/spring.ftl" as spring />

<#if signupForm.invitationHash??>
	invited player!
</#if>

<form id="signup-form" method="post" accept-charset="utf-8">
	<div class="input text"><label for="firstName"><@spring.message code="label.first_name"/></label><@spring.formInput "signupForm.firstName", "maxlength='45'", "text"/></div>
	<div class="input text"><label for="lastName"><@spring.message code="label.last_name"/></label><@spring.formInput "signupForm.lastName", "maxlength='45'", "text"/></div>
	<div class="input text"><label for="email"><@spring.message code="label.email"/></label>
			<#if !signupForm.invitationHash??>
				<@spring.formInput "signupForm.email", "maxlength='45'", "text"/>
			<#else>
				<@spring.formInput "signupForm.email", "maxlength='45' readonly='readonly'", "text"/>
			</#if>
	</div>
	<#if !signupForm.invitationHash??>
		<div class="input text"><label for="emailConfirmation"><@spring.message code="label.email_confirmation"/></label><@spring.formInput "signupForm.emailConfirmation", "maxlength='45'", "text"/></div>
	</#if>
	<div class="input password"><label for="password"><@spring.message code="label.password"/></label><@spring.formInput "signupForm.password", "", "password"/></div>
	<div class="input text">
		<#assign label_gender_hint><@spring.message code="label.gender"/></#assign>
		<#assign label_gender_male><@spring.message code="label.gender_male"/></#assign>
		<#assign label_gender_female><@spring.message code="label.gender_female"/></#assign>
		<#assign genderHash = {"0":label_gender_hint,"M":label_gender_male,"F":label_gender_female} >
		<@spring.formSingleSelect "signupForm.gender", genderHash, "style='width: 200px'" />
	</div>
	<div class="input text"><label for="day"><@spring.message code="label.birthday"/></label>
		<#assign label_day><@spring.message code="label.day"/></#assign>
		<#assign dayHash = {"0":label_day, "1":"01", "2":"02", "3":"03", "4":"04", "5":"05", "6":"06", "7":"07", "8":"08", "9":"09", "10":"10",
							   "11":"11", "12":"12", "13":"13", "14":"14", "15":"15", "16":"16", "17":"17", "18":"18", "19":"19", "20":"20",
							   "21":"21", "22":"22", "23":"23", "24":"24", "25":"25", "26":"26", "27":"27", "28":"28", "29":"29", "30":"30", "31":"31"} >
		<@spring.formSingleSelect "signupForm.birthDay", dayHash, "style='width: 90px'" />

		<#assign label_month><@spring.message code="label.month"/></#assign>
		<#assign label_month_01><@spring.message code="label.month_01"/></#assign>
		<#assign label_month_02><@spring.message code="label.month_02"/></#assign>
		<#assign label_month_03><@spring.message code="label.month_03"/></#assign>
		<#assign label_month_04><@spring.message code="label.month_04"/></#assign>
		<#assign label_month_05><@spring.message code="label.month_05"/></#assign>
		<#assign label_month_06><@spring.message code="label.month_06"/></#assign>
		<#assign label_month_07><@spring.message code="label.month_07"/></#assign>
		<#assign label_month_08><@spring.message code="label.month_08"/></#assign>
		<#assign label_month_09><@spring.message code="label.month_09"/></#assign>
		<#assign label_month_10><@spring.message code="label.month_10"/></#assign>
		<#assign label_month_11><@spring.message code="label.month_11"/></#assign>
		<#assign label_month_12><@spring.message code="label.month_12"/></#assign>
		<#assign monthHash = {"-1":label_month, "0":label_month_01, "1":label_month_02, "2":label_month_03, "3":label_month_04, "4":label_month_05, "5":label_month_06,
							   "6":label_month_07, "7":label_month_08, "8":label_month_09, "9":label_month_10, "10":label_month_11, "11":label_month_12} >
		<@spring.formSingleSelect "signupForm.birthMonth", monthHash, "style='width: 120px'" />

		<@spring.formSingleSelect "signupForm.birthYear", yearHash, "style='width: 80px'" />
	</div>
	<div class="input text"><label><@spring.message code="label.clicking_over_signup_you_are_accepting_our_terms_and_conditions" /></label></div>
	<div class="submit"><button class="button button-large button-primary button-enroll" type="button"><@spring.message code="label.signup"/></button></div>
</form>
<div id="message-console" class="error-panel label alert radius" style="display: none"></div>