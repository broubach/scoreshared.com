<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
</head>
<body>

<h2><@spring.message code="label.welcome"/></h2>

<div>
	<ul>
		<li><h6><@spring.message code="label.step1"/></h6></li>
		<li><h4><@spring.message code="label.step2"/></h4></li>
		<li><h6><@spring.message code="label.step3"/></h6></li>
	</ul>
</div>

<h3><@spring.message code="label.connect_yourself_to_the_social_networks_before_start"/></h3>

<form action="<@spring.url relativeUrl="/app/connect/facebook"/>" method="POST"><button type="submit"><img src="<@spring.url relativeUrl="/img/fb.png"/>"/> <@spring.message code="label.connect"/></button></form>

<#if twitterConnected>
	<img src="<@spring.url relativeUrl="/img/twitter.png"/>"/> <@spring.message code="label.connected"/>: ${twitterAccount}
<#else>
	<form action="<@spring.url relativeUrl="/app/connect/twitter"/>" method="POST"><button type="submit"><img src="<@spring.url relativeUrl="/img/twitter.png"/>"/> <@spring.message code="label.connect"/></button></form>
</#if>
<br/>
<a href="<@spring.url relativeUrl="/app/welcome/step1"/>"><@spring.message code="label.back"/></a>
<a href="<@spring.url relativeUrl="/app/welcome/step3"/>"><@spring.message code="label.next_step"/></a>

</body>
</html>