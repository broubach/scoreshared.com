<#import "/spring.ftl" as spring />

<html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.7.1.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery.Jcrop.min.js"/>"></script>
	<link rel="stylesheet" href="<@spring.url relativeUrl="/css/jquery.Jcrop.min.css"/>" type="text/css" />
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/welcome.js"/>"></script>
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

<h3><@spring.message code="label.show_us_how_you_are"/></h3>

<form id="fileUpload-form" action="<@spring.url relativeUrl="/app/welcome/step3"/>" enctype="multipart/form-data" method="POST">
	<@spring.formHiddenInput "welcomeStep3Form.x", "" />
	<@spring.formHiddenInput "welcomeStep3Form.y", "" />
	<@spring.formHiddenInput "welcomeStep3Form.x2", "" />
	<@spring.formHiddenInput "welcomeStep3Form.y2", "" />
	<@spring.formHiddenInput "welcomeStep3Form.avatarUploaded", "" />

	<span id="leftPanel">
		<ol>
			<li>
				<@spring.message code="label.select_your_favorite_picture"/><br/>
				<@spring.formInput "welcomeStep3Form.file", "", "file"/>
			</li>
			<li>
				<@spring.message code="label.cut_your_best_angle_and_see_how_it_looks"/><br/>
				<img/>
			</li>
		</ol>
	</span>

	<span id="rightPanel">
		<img id="target" src="<@spring.url relativeUrl="/app/avatar"/>?${((.now?datetime)?string)?replace(" ", "")}" />
	</span>

	<button type="submit"><@spring.message code="label.ready_i_want_to_share_my_scores"/></button>
</form>

</body>
</html>

<script type="text/javascript">
    jQuery(function($) {
        $('#target').Jcrop({
				boxWidth: 550,
				boxHeight: 380,
				bgColor: '#ffffff',
				onChange: showCoords,
				onSelect: showCoords, 
				aspectRatio: .76,
				setSelect: [0, 0, 123, 162]
	    });
		Step3Bindings.start();
    });
</script>