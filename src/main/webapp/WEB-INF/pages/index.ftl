<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
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
			<form>
				<dl>
					<dt><label for="firstname"><@spring.message code="label.first_name"/></label></dt> 
					<dd>
						<input type="text" id="firstname" maxlength="45"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="lastname"><@spring.message code="label.last_name"/></label></dt> 
					<dd>
						<input type="text" id="lastname" maxlength="45"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="email"><@spring.message code="label.email"/></label></dt> 
					<dd>
						<input type="text" id="email" maxlength="45"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="email_confirmation"><@spring.message code="label.email_confirmation"/></label></dt> 
					<dd>
						<input type="text" id="email_confirmation" maxlength="45"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="password"><@spring.message code="label.password"/></label></dt>
					<dd>
						<input type="password" id="password"></input>
					</dd>
				</dl>
				<dl>
					<dt><label for="gender"><@spring.message code="label.gender"/></label></dt> 
					<dd>
						<select id="gender">
							<option><@spring.message code="label.gender.hint"/></option>
							<option value="Homem">Homem</option>
							<option value="Mulher">Mulher</option>
						</select>
					</dd>
				</dl>
				<dl>
					<dt><label for="day"><@spring.message code="label.birthday"/></label></dt> 
					<dd>
						<select id="day">
							<option><@spring.message code="label.day"/></option>
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
						<select>
							<option><@spring.message code="label.month"/></option>
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
						<select>
							<option><@spring.message code="label.year"/></option>
							<#list thisYear..1900 as i>
								<option>${i?string("#")}</option>
							</#list>
						</select>
					</dd>
				</dl>
				<input type="button" value="<@spring.message code="label.signup"/>"></input>
			</form>
		</div>
	</div>
	<div id="footer">
	</div>
</body>
</html>