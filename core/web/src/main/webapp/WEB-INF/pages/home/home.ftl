<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_css=["/css/joyride-2.1.css"]>
	<#assign head_additional_js=[	"/js/scaffold/playerDecorationUtil.js",
									"/js/vendor/Chart.min.js"
									]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.home"/></a>
		</nav>	
		<div class="columns large-6 lista-resultados">
			<div class="box-content">
				<h2><@spring.message code="label.latest_results"/></h2>
				<#list scores as item>
					<div class="item-resultado">
					    <#if item.confirmed!false><img src="<@spring.url relativeUrl="/img/icons/check.png"/>" title="<@spring.message code="label.confirmed_score"/>"></#if>
						<#if (item.detailTextPart1?length > 0)>
							<span class="placar">
								${item.detailTextHighlightingWinnerWithLoggedUserAtLeft}
							</span>
						</#if>
						${item.detailTextPart2}  
						<#assign avatarHash>${item.sampleOpponentAvatar}</#assign>
						<#if avatarHash?has_content>
							<img class="avatar avatar-unico" src="<@spring.url relativeUrl="/app/avatar?hash=${avatarHash}&small"/>"/>
						</#if>
					</div>
				</#list>
				<div class="vermais direita">
					<a href="<@spring.url relativeUrl="/app/scores/0/ALL/false"/>"><@spring.message code="label.see_all_scores"/></a>
				</div>
			</div>
		</div>
		<div class="columns large-6">
			<a id="createScoreButton" href="<@spring.url relativeUrl="/app/score"/>" class="button button-primary js-new-score no-margin-top"><@spring.message code="label.create"/></a>
			<div class="box-content">
				<h2><@spring.message code="label.statistics"/></h2>
				<hr />
				<#if ((win + loss + tie + practice) > 0)>
					<div class="row collapse">
						<div class="columns large-7">
							<canvas id="estatistica-jogos" title="<@spring.message code="label.win_loss_record"/>"></canvas>
						</div>
						<div class="columns large-5">
							<ul class="legenda">
								<li class="vitorias"><@spring.message code="label.win"/></li>
								<li class="derrotas"><@spring.message code="label.loss"/></li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="columns large-7 last">
							<label class="centralizado"><@spring.message code="label.win"/>: ${win} <#if ((win + loss) > 0)>(${(win/(win + loss)) * 100} %)</#if> / <@spring.message code="label.loss"/>: ${loss} / <@spring.message code="label.tie"/>: ${tie} / <@spring.message code="label.practice"/>: ${practice}</label>
						</div>
					</div>
				</#if>
			</div>
		</div>
	</div>

	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">

	<ol id="intro" data-joyride style="display: none">
	  <li data-text="<@spring.message code="label.welcome_wizard.intro.2"/>" data-options="cookieMonster: true; cookieName: JoyRide; cookieDomain: false; cookieExpires: 1">
		<p><@spring.message code="label.welcome_wizard.intro.1"/></p>
	  </li>
	  <li data-id="createScoreButton" data-options="scrollSpeed: 0; tipLocation: bottom; nubPosition: top;">
	  	<p><@spring.message code="label.welcome_wizard.create_button.2"/></p>
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

	<script>
	$(function(){
	    PlayerDecorationUtil.addPlayerLinksTo('.item-resultado', ${playersForLinkCreation}, '<@spring.url relativeUrl="/"/>');

	    //Get the context of the canvas element we want to select
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
		$("#estatistica-jogos").attr('width',$("#estatistica-jogos").parent().width());
		var chart = new Chart(ctx).Pie(data,options);

		// creates picture in the server so it won't take long for FB to load image. It fails in dev environment.
		$.ajax({
	        url: 'http://www.scoreshared.com/chart?win=${win}&loss=${loss}',
	        async: true
	   }); 

		if ($.cookie('JoyRide') == undefined) {
			$(document).foundation('joyride', 'start');
		}
	});
	</script>