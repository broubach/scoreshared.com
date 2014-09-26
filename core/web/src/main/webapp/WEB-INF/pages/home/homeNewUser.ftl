<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_css=["/css/joyride-2.1.css"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<div class="small-6 large-centered columns">
			<div class="centralizado">
				<h2 class="no-margin-bottom"><@spring.message code="label.create_your_first_score"/></h2>
				<a id="createScoreButton" href="<@spring.url relativeUrl="/app/score"/>" class="button button-primary"><@spring.message code="label.create"/></a>
			</div>
		</div>
	</div>

	<div class="row content">
		<br />
	</div>

	<#include "/helper-snippets/basic-footer.ftl">

	<ol id="intro" data-joyride style="display: none">
	  <li data-text="<@spring.message code="label.welcome_wizard.intro.2"/>" data-options="cookieMonster: true; cookieName: JoyRide; cookieDomain: false; cookieExpires: 1">
		<p><@spring.message code="label.welcome_wizard.intro.1"/></p>
	  </li>
	  <li data-id="createScoreButton" data-options="scrollSpeed: 0; tipLocation: bottom; nubPosition: top;">
	  	<p><@spring.message code="label.welcome_wizard.create_button.1"/></p>
	  </li>
	  <li data-class="menu-score" data-options="tipLocation: bottom; nubPosition: top;">
	  	<p><@spring.message code="label.welcome_wizard.scores.1"/></p>
	  </li>
	  <li data-class="menu-mensagens" data-options="tipLocation: bottom; nubPosition: top;">
	  	<p><@spring.message code="label.welcome_wizard.notifications.1"/></p>
	  </li>
	  <li data-class="menu-profile" data-options="tipLocation: bottom; nubPosition: top;">
	  	<p><@spring.message code="label.welcome_wizard.profile.1"/></p>
	  </li>
	  <li data-id="feedback" data-button="<@spring.message code="label.welcome_wizard.feedback.2"/>" data-options="tipLocation: right; nubPosition: left;">
	  	<p><@spring.message code="label.welcome_wizard.feedback.1"/></p>
	  </li>
	</ol>

</body>
</html>

<script type="text/javascript">
	$(function() {
		if ($.cookie('JoyRide') == undefined) {
			$(document).foundation('joyride', 'start');
		}
	});
</script>