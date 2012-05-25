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

<h3><@spring.message code="label.show_us_who_you_are"/></h3>

<img src="<@spring.url relativeUrl="/img/pete_sampras.jpg"/>"/>

<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.ready_i_want_to_share_my_scores"/></a>

</body>
</html>