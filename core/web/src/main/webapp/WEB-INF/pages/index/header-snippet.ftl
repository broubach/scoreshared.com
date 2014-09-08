		<div class="large-8 columns">
			<ul class="inline-list links right">
				<li class="login"><a href="#coaches" data-dropdown="login"><@spring.message code="label.login"/></a></li>
				<li class="signup"><a href="<@spring.url relativeUrl="/app/signup"/>"><@spring.message code="label.signup"/></a></li>
			</ul>
			<div id="login" class="f-dropdown content medium" data-dropdown-content>
				<div class="row">
					<div class="large-5 columns divisor-lateral">
						<a href="#"><img src="<@spring.url relativeUrl="/img/buttons/button-login-fb.png"/>" alt="" /></a>
					</div>
					<div class="large-7 columns">
						<form action="<@spring.url relativeUrl="/app/j_spring_security_check"/>" id="login-form" method="POST" accept-charset="utf-8">
							<div class="input email"><label for="j_username"><@spring.message code="label.email"/></label><input id="j_username" name="j_username" type="email" maxlength="45" id="UserEmail"/></div>
							<div class="input password"><label for="j_password"><@spring.message code="label.password"/></label><input id="j_password" name="j_password" type="password" id="UserPassword"/></div>
							<br/>
						</form>
						<div class="row">
							<div class="columns large-4">
								<div class="submit"><input class="button button-primary button-small" id="login_button" type="button" value="<@spring.message code="label.login"/>"/></div>
							</div>
							<div class="columns large-8">
								<a href="<@spring.url relativeUrl="/app/forgotPassword/sendInstructions"/>" class="forgot-pass"><@spring.message code="label.forgot_your_password"/></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
