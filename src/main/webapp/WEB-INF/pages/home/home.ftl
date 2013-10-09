<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Home">
	<#assign head_additional_css=[	"/css/vendor/magnific-popup.css",
									"/css/vendor/select2.css",
									"/css/vendor/pickadate/classic.css",
									"/css/vendor/pickadate/classic.time.css",
									"/css/vendor/pickadate/classic.date.css"
									]>
	<#assign head_additional_js=[	"/js/vendor/jquery.magnific-popup.min.js",
									"/js/vendor/select2.js",
									"/js/vendor/pickadate/legacy.js",
									"/js/vendor/pickadate/picker.js",
									"/js/vendor/pickadate/picker.date.js",
									"/js/vendor/pickadate/picker.time.js",
									"/js/app.js"
									]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/home/header_snippet.ftl">
	<#include"/helper-snippets/basic-header.ftl">

	<div class="row content">
		<nav class="breadcrumbs">
			<span>You are here: </span> <a href="/scoreshared/painel/home">Home</a>
		</nav>
		<div class="columns large-6 lista-resultados">
			<div class="box-content">
				<h2>Latest results</h2>
				<div class="item-resultado confirmado">
					<span class="placar"> 
						<span class="winner">5</span> x 4
					</span> against <a href="#">Rodrigo</a> <img src="/scoreshared/img/avatars/user1.png" class="avatar avatar-unico" alt="" />
				</div>
				<div class="item-resultado ">
					<span class="placar">
						1 x <span class="winner">1</span>
					</span> against <a href="#">Rodrigo</a> <img src="/scoreshared/img/avatars/user2.png" class="avatar avatar-unico" alt="" />
				</div>
				<div class="item-resultado confirmado">
					<span class="placar">
						<span class="winner">3</span> x 1
					</span> against <a href="#">Rodrigo</a> <img src="/scoreshared/img/avatars/user3.png" class="avatar avatar-unico" alt="" />
				</div>
				<div class="item-resultado ">
					<span class="placar">
						5 x <span class="winner">6</span>
					</span> against <a href="#">Rodrigo</a> <img src="/scoreshared/img/avatars/user4.png" class="avatar avatar-unico" alt="" />
				</div>
				<div class="vermais direita">
					<a href="#">See all results</a>
				</div>
			</div>
		</div>
		<div class="columns large-6">
			<a href="/scoreshared/painel/registerScore" class="button button-primary js-new-score no-margin-top">New Score</a>
			<div class="box-content">
				<h2>Stats</h2>
				<hr />
				<div class="row collapse">
					<div class="columns large-7">
						<canvas id="estatistica-jogos"></canvas>
					</div>
					<div class="columns large-5">
						<ul class="legenda">
							<li class="vitorias">Wins</li>
							<li class="derrotas">Loses</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="columns large-7 last">
						<p class="centralizado">2/2 (50 %)</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
//Get the context of the canvas element we want to select
var ctx = $("#estatistica-jogos").get(0).getContext("2d");
var data = [
	{
		value: 2,
		color:"#d35400"
	},
	{
		value : 2,
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