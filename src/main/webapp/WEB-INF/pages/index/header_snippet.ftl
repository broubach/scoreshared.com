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
						<form action="<@spring.url relativeUrl="/painel/home"/>" id="UserDisplayForm" method="post" accept-charset="utf-8">
							<div style="display:none;"><input type="hidden" name="_method" value="POST"/></div>
							<div class="input email"><label for="UserEmail"><@spring.message code="label.email"/></label><input name="data[User][email]" type="email" id="UserEmail"/></div>
							<div class="input password"><label for="UserPassword"><@spring.message code="label.password"/></label><input name="data[User][password]" type="password" id="UserPassword"/></div>
							<br/>
						</form>
						<div class="row">
							<div class="columns large-4">
								<div class="submit"><input class="button button-primary button-small" type="submit" value="<@spring.message code="label.login"/>"/></div>
							</div>
							<div class="columns large-8">
								<a href="#" class="forgot-pass"><@spring.message code="label.forgotyourpassword"/></a>
							</div>
						</div>
					</div>
				</div>
			</div>
