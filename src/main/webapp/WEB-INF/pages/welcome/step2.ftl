<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
</head>
<body>

<h2><@spring.message code="label.welcome"/></h2>

<div>
	<span><@spring.message code="label.step1"/></span>
	<span><@spring.message code="label.step2"/></span>
	<span><@spring.message code="label.step3"/></span>
</div>

<h3><@spring.message code="label.connect_yourself_to_the_social_networks_before_start"/></h3>

<a href="#"><img src="<@spring.url relativeUrl="/img/fb.png"/>"/><@spring.message code="label.connect"/></a><br/>
<a href="#"><img src="<@spring.url relativeUrl="/img/twitter.png"/>"/><@spring.message code="label.connect"/></a><br/>
<br/>
<a href="<@spring.url relativeUrl="/app/welcome/step3"/>"><@spring.message code="label.next_step"/></a>

</body>
</html>