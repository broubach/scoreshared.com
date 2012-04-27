<#import "/spring.ftl" as spring />

			<form id="signup-form">
				<dl>
					<dt><label for="firstName"><@spring.message code="label.first_name"/></label></dt> 
					<dd>
						<@spring.formInput "signupForm.firstName", "maxlength='45'", "text"/>
					</dd>
				</dl>
				<dl>
					<dt><label for="lastName"><@spring.message code="label.last_name"/></label></dt> 
					<dd>
						<@spring.formInput "signupForm.lastName", "maxlength='45'", "text"/>
					</dd>
				</dl>
				<dl>
					<dt><label for="email"><@spring.message code="label.email"/></label></dt> 
					<dd>
						<@spring.formInput "signupForm.email", "maxlength='45'", "text"/>
					</dd>
				</dl>
				<dl>
					<dt><label for="emailConfirmation"><@spring.message code="label.email_confirmation"/></label></dt> 
					<dd>
						<@spring.formInput "signupForm.emailConfirmation", "maxlength='45'", "text"/>
					</dd>
				</dl>
				<dl>
					<dt><label for="password"><@spring.message code="label.password"/></label></dt>
					<dd>
						<@spring.formInput "signupForm.password", "", "password"/>
					</dd>
				</dl>
				<dl>
					<dt><label for="gender"><@spring.message code="label.gender"/></label></dt> 
					<dd>
						<#assign label_gender_hint><@spring.message code="label.gender_hint"/></#assign>
						<#assign label_gender_male><@spring.message code="label.gender_male"/></#assign>
						<#assign label_gender_female><@spring.message code="label.gender_female"/></#assign>
						<#assign genderHash = {"":label_gender_hint,"M":label_gender_male,"F":label_gender_female} >
						<@spring.formSingleSelect "signupForm.gender", genderHash, "" />
					</dd>
				</dl>
				<dl>
					<dt><label for="day"><@spring.message code="label.birthday"/></label></dt> 
					<dd>
						<#assign label_day><@spring.message code="label.day"/></#assign>
						<#assign dayHash = {"0":label_day, "1":"01", "2":"02", "3":"03", "4":"04", "5":"05", "6":"06", "7":"07", "8":"08", "9":"09", "10":"10",
											   "11":"11", "12":"12", "13":"13", "14":"14", "15":"15", "16":"16", "17":"17", "18":"18", "19":"19", "20":"20",
											   "21":"21", "22":"22", "23":"23", "24":"24", "25":"25", "26":"26", "27":"27", "28":"28", "29":"29", "30":"30", "31":"31"} >
						<@spring.formSingleSelect "signupForm.birthDay", dayHash, "" />

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
						<#assign monthHash = {"-1":label_month, "1":label_month_01, "2":label_month_02, "3":label_month_03, "4":label_month_04, "5":label_month_05, "6":label_month_06,
											   "7":label_month_07, "8":label_month_08, "9":label_month_09, "10":label_month_10, "11":label_month_11, "12":label_month_12} >
						<@spring.formSingleSelect "signupForm.birthMonth", monthHash, "" />

						<select name="birthYear">
							<option value="0"><@spring.message code="label.year"/></option>
							<#list thisYear..1900 as i>
								<option value="${i?string("#")}">${i?string("#")}</option>
							</#list>
						</select>
					</dd>
				</dl>
				<button type="button"><@spring.message code="label.signup"/></button>
			</form>
			<div id="messageConsole"></div>