<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_css=[	"/css/vendor/select2.css",
									"/css/vendor/pickadate/classic.css",
									"/css/vendor/pickadate/classic.time.css",
									"/css/vendor/pickadate/classic.date.css"
									]>
	<#assign head_additional_js=[	"/js/vendor/select2-3.4.5.min.js",
									"/js/vendor/pickadate/legacy.js",
									"/js/vendor/pickadate/picker.js",
									"/js/vendor/pickadate/picker.date.js",
									"/js/vendor/pickadate/picker.time.js",
									"/js/scaffold/playerDecorationUtil.js",
									"/js/scaffold/messageUtil.js",
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
					<div class="item-resultado <#if item.confirmed!false>confirmado</#if>">
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
					<a href="<@spring.url relativeUrl="/app/scores/0/ALL/true"/>"><@spring.message code="label.see_all_scores"/></a>
				</div>
			</div>
		</div>
		<div class="columns large-6">
			<a href="<@spring.url relativeUrl="/app/score"/>" class="button button-primary js-new-score no-margin-top"><@spring.message code="label.share"/></a>
			<div class="box-content">
				<h2><@spring.message code="label.statistics"/></h2>
				<hr />
				<div class="row collapse">
					<div class="columns large-7">
						<canvas id="estatistica-jogos"></canvas>
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
						<p class="centralizado">${win}/${loss} (${win/(win + loss)} %)</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	    PlayerDecorationUtil.addPlayerLinksTo('.item-resultado', ${playersForLinkCreation}, '<@spring.url relativeUrl="/"/>')

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
	</script>
	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>