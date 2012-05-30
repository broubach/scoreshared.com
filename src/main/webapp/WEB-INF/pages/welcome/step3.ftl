<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
</head>
<body>

<h2><@spring.message code="label.welcome"/></h2>

<div>
	<ul>
		<li><h6><@spring.message code="label.step1"/></h6></li>
		<li><h6><@spring.message code="label.step2"/></h6></li>
		<li><h4><@spring.message code="label.step3"/></h4></li>
	</ul>
</div>

<h3><@spring.message code="label.show_us_who_you_are"/></h3>

<img src="<@spring.url relativeUrl="/img/pete_sampras.jpg"/>"/>

<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.ready_i_want_to_share_my_scores"/></a>

</body>
</html>