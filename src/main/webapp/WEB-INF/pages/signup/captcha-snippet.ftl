<#import "/spring.ftl" as spring />

<h3><@spring.message code="label.security_control"/></h3>
<h4><@spring.message code="label.insert_word_shown_below"/></h4>
<form id="captcha-form">
	<div class="input text">
		<a id="refresh-captcha" href="#"><@spring.message code="label.try_with_other_words"/></a>
		<img id="captcha" src="<@spring.url relativeUrl="/app/captcha"/>"/>
	</div>
	<div class="input text">
		<label for="captchaAnswer"><@spring.message code="label.insert_it_here"/></label><input id="captchaAnswer" name="captchaAnswer" type="text" maxlength="5"></input>
	</div>

	<div class="submit">
		<button class="button button-large button-primary button-enroll" type="button"><@spring.message code="label.send"/></button>
	</div>
	<div class="input text">
		<a id="goBack" href="#"><@spring.message code="label.back" /></a>
	</div>
</form>
<div id="message-console"></div> 