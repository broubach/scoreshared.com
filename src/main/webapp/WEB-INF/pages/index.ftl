<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.7.1.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/index.js"/>"></script>
</head>
<body>
	<div id="header">
		<div id="logo">score<br>shared</div>
		<div id="login">
			<form action="<@spring.url relativeUrl="/j_spring_security_check"/>" method="POST">
				<input id="j_username" name="j_username" type="text" maxlength="45"></input>
				<input id="j_password" name="j_password" type="password"></input>
				<input type="submit" value="<@spring.message code="label.enter"/>"></input>
			</form>
		</div>
		<div id="twitter"></div>
	</div>
	<div id="content">
		<div id="video">
			VIDEO
		</div>
		<div id="signup">
			<form id="signup-form">
				<dl>
					<dt><label for="firstName"><@spring.message code="label.first_name"/></label></dt> 
					<dd>
						<input type="text" id="firstName" name="firstName" maxlength="45"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="lastName"><@spring.message code="label.last_name"/></label></dt> 
					<dd>
						<input type="text" id="lastName" name="lastName" maxlength="45"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="email"><@spring.message code="label.email"/></label></dt> 
					<dd>
						<input type="text" id="email" name="email" maxlength="45"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="emailConfirmation"><@spring.message code="label.email_confirmation"/></label></dt> 
					<dd>
						<input type="text" id="emailConfirmation" name="emailConfirmation" maxlength="45"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="password"><@spring.message code="label.password"/></label></dt>
					<dd>
						<input type="password" id="password" name="password"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="gender"><@spring.message code="label.gender"/></label></dt> 
					<dd>
						<select id="gender" name="gender">
							<option value=""><@spring.message code="label.gender.hint"/></option>
							<option value="M">Homem</option>
							<option value="F">Mulher</option>
						</select>
					</dd>
				</dl>
				<dl>
					<dt><label for="day"><@spring.message code="label.birthday"/></label></dt> 
					<dd>
						<select id="day" name="birthDay">
							<option value="0"><@spring.message code="label.day"/></option>
							<option value="1">01</option>
							<option value="2">02</option>
							<option value="3">03</option>
							<option value="4">04</option>
							<option value="5">05</option>
							<option value="6">06</option>
							<option value="7">07</option>
							<option value="8">08</option>
							<option value="9">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						<select name="birthMonth">
							<option value="-1"><@spring.message code="label.month"/></option>
							<option value="0"><@spring.message code="label.month.01"/></option>
							<option value="1"><@spring.message code="label.month.02"/></option>
							<option value="2"><@spring.message code="label.month.03"/></option>
							<option value="3"><@spring.message code="label.month.04"/></option>
							<option value="4"><@spring.message code="label.month.05"/></option>
							<option value="5"><@spring.message code="label.month.06"/></option>
							<option value="6"><@spring.message code="label.month.07"/></option>
							<option value="7"><@spring.message code="label.month.08"/></option>
							<option value="8"><@spring.message code="label.month.09"/></option>
							<option value="9"><@spring.message code="label.month.10"/></option>
							<option value="10"><@spring.message code="label.month.11"/></option>
							<option value="11"><@spring.message code="label.month.12"/></option>
						</select>
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
		</div>
	</div>
	<div id="footer">
	</div>
</body>
</html>

<script type="text/javascript">
	$(function() {
		$('#signup-form button').click(function() {
			$.ajax({
				url: '<@spring.url relativeUrl="/app/signup/data"/>',
				data: $('#signup-form').serialize(), 
				type: 'POST',
				dataType: 'json',
				cache: false,
				success: SignupFlow.onSignupDataPostSuccess
			});
		});
	});
</script>