<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<div class="small-6 large-centered columns">
			<div class="row content">
				<div class="small-4 columns">
					<h3>
						<@spring.message code="label.step1"/>
					</h3>
				</div>
				<div class="small-4 columns">
					<a class="button no-margin-top no-margin-bottom medium secondary disabled">
						<@spring.message code="label.step2"/>
					</a>
				</div>
				<div class="small-4 columns direita">
					<h3>
						<@spring.message code="label.step3"/>
					</h3>
				</div>
			</div>
		</div>

		<div class="small-6 large-centered columns">
			<div class="centralizado">
				<h2><@spring.message code="label.connect_yourself_to_the_social_networks_before_start"/></h2>
			</div>

			<div class="row">
				<div class="small-6 columns centralizado">
					<#if facebookConnected>
						<span class="button secondary disabled"><img src="<@spring.url relativeUrl="/img/fb.png"/>"/> <@spring.message code="label.connected"/>: ${facebookAccount}</span>
					<#else>
						<form action="<@spring.url relativeUrl="/app/connect/facebook"/>" method="POST"><input type="hidden" name="scope" value="email" /><button type="submit" class="button"><img src="<@spring.url relativeUrl="/img/fb.png"/>"/> <@spring.message code="label.connect"/></button></form>
					</#if>
				</div>
				<div class="small-6 columns centralizado">
					<#if twitterConnected>
						<img src="<@spring.url relativeUrl="/img/twitter.png"/>"/> <@spring.message code="label.connected"/>: ${twitterAccount}
					<#else>
						<form action="<@spring.url relativeUrl="/app/connect/twitter"/>" method="POST"><button type="submit" class="button"><img src="<@spring.url relativeUrl="/img/twitter.png"/>"/> <@spring.message code="label.connect"/></button></form>
					</#if>
				</div>
			</div>

			<div class="row">
				<div class="small-6 columns">
					<a href="<@spring.url relativeUrl="/app/welcome/step1"/>"><@spring.message code="label.back"/></a>
				</div>
				<div class="small-6 columns direita">
					<a href="<@spring.url relativeUrl="/app/welcome/step3"/>"><@spring.message code="label.next_step"/></a>
				</div>
			</div>
		</div>
	</div>
	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>