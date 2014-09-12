<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_js=["/js/vendor/Chart.min.js"]>
	<#include "/helper-snippets/basic-head.ftl">
	<meta property="og:title" content="${title}" />
	<meta property="og:site_name" content="Scoreshared"/>
	<meta property="og:url" content="${http_server_address_port}/app/facebook/${hash}" />
	<meta property="og:description" content="${subtitle}" />
	<meta property="fb:app_id" content="166057316847038" />
	<meta property="og:image" content="${http_server_address_port}/chart?win=${win}&loss=${loss}" />
    <meta property="og:type" content="scoreshared:${type}">
	<meta property="personal_message" content="${personalMessage}" />
</head>
<body>
	<#assign header_snippet="/index/header-snippet.ftl">
	<#assign should_show_feedback=false/>
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<div class="small-4 columns">
		    <canvas id="estatistica-jogos" title="<@spring.message code="label.win_loss_record"/>"></canvas>
		</div>

		<div class="small-8 columns">
			<h2>${title}</h2>
			<h3>${subtitle}</h3>

			<h4><@spring.message code="label.score_shared_personal_message_from"/> ${subject}</h4>
			<textarea readonly="readonly" style="resize: none;">${personalMessage}</textarea>
		</div>
	</div>

	<div class="row content">
		<br />
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>

<script type="text/javascript">
$(function(){
	var ctx = $("#estatistica-jogos").get(0).getContext("2d");
	var data = [
		{
			value: ${win},
			color:"#d35400"
		},
		{
			value : ${loss},
			color : "#e67e22"
		},
	];
	var options = {
		//Boolean - Whether we should show a stroke on each segment
		segmentShowStroke : true,
		
		//String - The colour of each segment stroke
		segmentStrokeColor : "rgba(250, 250, 250, .2)",
		
		//Number - The width of each segment stroke
		segmentStrokeWidth : 4,
		
		//Boolean - Whether we should animate the chart	
		animation : true,
		
		//Number - Amount of animation steps
		animationSteps : 100,
		
		//String - Animation easing effect
		animationEasing : "easeOutBounce",
		
		//Boolean - Whether we animate the rotation of the Pie
		animateRotate : true,
	
		//Boolean - Whether we animate scaling the Pie from the centre
		animateScale : true,
		
		//Function - Will fire on animation completion.
		onAnimationComplete : null
	}
	$("#estatistica-jogos").attr('width',250);
	$("#estatistica-jogos").attr('height',250);
	var chart = new Chart(ctx).Pie(data,options);

	$('#login_button').click(function() {
		$('#login-form').submit();
	});
});
</script>