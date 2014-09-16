<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/index/header-snippet.ftl">
	<#assign should_show_feedback=false/>
	<#include "/helper-snippets/basic-header.ftl">
	
	<div class="row banner">
		<div class="columns large-12 last">
			<hgroup class="frases-destaque">
				<h2>Track your scores</h2>
				<h2>Share your stats</h2>
				<h2>Improve your game!</h2>
			</hgroup>
			<div class="foto-banner">
				<div>Available for:</br><span data-sport="1">Tennis</span>, <span data-sport="2">Squash</span>, <span data-sport="3">Paddle</span>, <span data-sport="4">Table Tennis</span>, <span data-sport="5">Badminton</span> and others...</div>
				<img src="<@spring.url relativeUrl="/img/foto-esporte-1.png"/>" alt="" />
			</div>
		</div>
	</div>

	<div class="row content">
		<h3 class="pergunta pergunta-jogador">Keep track of your records to improve your game!</h3>
		<div class="large-6 columns">
			<ul class="player-steps">
				<li class="step step1" data-step="1">What did I do last time I played this guy?</li>
				<li class="step step2" data-step="2">What forehand grip I was using last match?</li>
				<li class="step step3" data-step="3">How many times have we played already?</li>
			</ul>
		</div>
		<div class="large-6 columns">
			<img src="<@spring.url relativeUrl="/img/screen-player-1.png"/>" class="screenshot-player" alt="" />
		</div>
	</div>

	<div class="row content">
		<h3 class="pergunta">Great! How do I use it?</h3>
		<div class="large-6 columns">
			<img src="<@spring.url relativeUrl="/img/screen-coach-1.png"/>" class="screenshot-coach" alt="" />
		</div>
		<div class="large-6 columns">
			<ul class="coach-steps">
				<li class="step step1" data-step="1">Register yourself</li>
				<li class="step step2" data-step="2">Start saving your scores after each match</li>
				<li class="step step3" data-step="3">Keep track of your history</li>
				<li class="step step4" data-step="4">Feel free to share it with your community!</li>
			</ul>
		</div>
	</div>

	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>

<script type="text/javascript">
	$(function(){
		$('.foto-banner span').hover(function(){
			var id = $(this).data('sport');
			$('.foto-banner img').prop('src',$('.foto-banner img').prop('src').replace(/\-\d/g,'-'+id));
		})
		$('.step').hover(function(){
			$(this).css('font-weight','bold');
			var id = $(this).data('step');
			if ($(this).parent().is('.player-steps')) {
				var imagem = $(this).parent().parent().next().children();
			} else {
				var imagem = $(this).parent().parent().prev().children();
			}
			
			imagem.prop('src',imagem.prop('src').replace (/\-\d/g, '-'+id));
		},function(){
			$(this).css('font-weight','normal');
		});
		$('#login_button').click(function() {
			$('#login-form').submit();
		});
	});
</script>