<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Index">
	<#assign head_additional_css=[	"/css/vendor/magnific-popup.css",
									"/css/vendor/select2.css",
									"/css/vendor/pickadate/classic.css",
									"/css/vendor/pickadate/classic.time.css",
									"/css/vendor/pickadate/classic.date.css"
									]>
	<#assign head_additional_js=[	"/js/jquery.magnific-popup-0.9.7.min.js",
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

	<#assign header_snippet="/index/header_snippet.ftl">
	<#assign should_show_feedback=false/>
	<#include "/helper-snippets/basic-header.ftl">
	
	<div class="row banner">
		<div class="columns large-12 last">
			<hgroup class="frases-destaque">
				<h2><@spring.message code="label.index.share_scores"/></h2>
				<h2><@spring.message code="label.index.track_stats"/></h2>
				<h2><@spring.message code="label.index.improve_your_game"/></h2>
			</hgroup>
			<div class="foto-banner">
				<div>Available for:</br><span data-sport="1">Tennis</span>, <span data-sport="2">Squash</span>, <span data-sport="3">Paddle</span>, <span data-sport="3">Table Tennis</span> and others...</div>
				<img src="<@spring.url relativeUrl="/img/foto-esporte-1.png"/>" alt="" />
			</div>
		</div>
	</div>

	<div class="row content">
		<h3 class="pergunta pergunta-jogador">I'm a player! How do I use It?</h3>
		<div class="large-6 columns">
			<ul class="player-steps">
				<li class="step step1" data-step="1">Register yourself</li>
				<li class="step step2" data-step="2">Start sharing your scores...</li>
				<li class="step step3" data-step="3">Checkout how your friends are doing...</li>
				<li class="step step4" data-step="4">Take a look at your coache's advices!</li>
			</ul>
		</div>
		<div class="large-6 columns">
			<img src="<@spring.url relativeUrl="/img/screen-player-1.png"/>" class="screenshot-player" alt="" />
		</div>
	</div>

	<div class="row content">
		<h3 class="pergunta">I'm a coach! Can I give advices to my students?</h3>
		<div class="large-6 columns">
			<img src="<@spring.url relativeUrl="/img/screen-coach-1.png"/>" class="screenshot-coach" alt="" />
		</div>
		<div class="large-6 columns">
			<ul class="coach-steps">
				<li class="step step1" data-step="1">Register yourself</li>
				<li class="step step2" data-step="2">Wait for an invite from some student...</li>
				<li class="step step3" data-step="3">Read de comments on the shared score...</li>
				<li class="step step4" data-step="4">Reply with valuable info!</li>
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