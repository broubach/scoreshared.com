<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
</head>
<body>
<@spring.message code="label.welcome"/>, ${userFirstName}!
<a href="<@spring.url relativeUrl="/j_spring_security_logout"/>">logout</a><br/>

<h2><@spring.message code="label.see_who_already_registered_their_results"/></h2>

<div>
<table>
<tr>
	<td></td>
	<td>Diogo</td>
	<td>6x4</td>
	<td><a href="#">Felipe Freitas</a></td>
	<td><img src="<@spring.url relativeUrl="/img/pete_sampras.jpg"/>"/></td>
</tr>
<tr>
	<td><img src="<@spring.url relativeUrl="/img/pete_sampras.jpg"/>"/></td>
	<td><a href="#">Felipe Freitas</a></td>
	<td>2x6</td>
	<td><a href="#">Rodrigo</a></td>
	<td><img src="<@spring.url relativeUrl="/img/gustavo_kuerten.jpg"/>"/></td>
</tr>
<tr>
	<td><img src="<@spring.url relativeUrl="/img/gustavo_kuerten.jpg"/>"/></td>
	<td><a href="#">Rodrigo</a></td>
	<td>6x4</td>
	<td><a href="#">Rodrigo Soalheiro</a></td>
	<td><img src="<@spring.url relativeUrl="/img/pete_sampras.jpg"/>"/></td>
</tr>
<tfoot>
<tr>
	<td colspan="5"><a href="#">+ <@spring.message code="label.results"/></a></td>
</tr>
<tfoot>
</table>

<a href="<@spring.url relativeUrl="/app/score"/>"><@spring.message code="label.share_score"/></a>

</div>

</body>
</html>