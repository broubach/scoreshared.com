<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.7.1.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery.Jcrop.min.js"/>"></script>
	<link rel="stylesheet" href="<@spring.url relativeUrl="/css/jquery.Jcrop.min.css"/>" type="text/css" />
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

<form action="<@spring.url relativeUrl="/app/avatar"/>" enctype="multipart/form-data" method="POST">
	<input name="file" type="file"></input>
	<button type="submit"><@spring.message code="label.click_to_load_picture"/></button>
</form>
<img id="target" src="<@spring.url relativeUrl="/app/avatar"/>" />

<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.ready_i_want_to_share_my_scores"/></a>

</body>
</html>

<script language="Javascript">
    jQuery(function($) {
        $('#target').Jcrop({
				boxWidth: 550,
				boxHeight: 380,
				bgColor: '#ffffff',
/*				onChange: showCoords,
				onSelect: showCoords, */ 
				aspectRatio: .76,
				setSelect: [0, 0, 123, 162]
	    });
    });
</script>