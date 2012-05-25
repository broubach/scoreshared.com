<#import "/spring.ftl" as spring />

<h3><@spring.message code="label.security_control"/></h3>
<h4><@spring.message code="label.insert_word_shown_below"/></h4>
<a id="refreshCaptcha" href="#"><@spring.message code="label.try_with_other_words"/></a>
<img id="captcha" src="<@spring.url relativeUrl="/app/captcha"/>"/>
<form id="captcha-form">
	<@spring.message code="label.insert_it_here"/>: <input name="captchaAnswer" type="text" maxlength="5"></input>
	<button type="button"><@spring.message code="label.send"/></button>
</form>
<div id="messageConsole"></div>
<a id="goBack" href="#"><@spring.message code="label.back" /></a> 