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
				<h2><@spring.message code="label.index.phrase1"/></h2>
				<h2><@spring.message code="label.index.phrase2"/></h2>
				<h2><@spring.message code="label.index.phrase3"/></h2>
			</hgroup>
			<div class="foto-banner">
				<div><@spring.message code="label.index.available_for"/>:</br><span data-sport="1">Tennis</span>, <span data-sport="2">Squash</span>, <span data-sport="3">Paddle</span>, <span data-sport="4">Table Tennis</span>, <span data-sport="5">Badminton</span> and others...</div>
				<img src="<@spring.url relativeUrl="/img/foto-esporte-1.png"/>" alt="" width="466" height="325"/>
			</div>
		</div>
	</div>

	<div class="row content">
		<h3 class="pergunta pergunta-jogador"><@spring.message code="label.index.upper.title"/></h3>
		<div class="large-6 columns">
			<ul class="player-steps">
				<li class="step step1" data-step="1"><@spring.message code="label.index.upper.phrase1"/></li>
				<li class="step step2" data-step="2"><@spring.message code="label.index.upper.phrase2"/></li>
				<li class="step step3" data-step="3"><@spring.message code="label.index.upper.phrase3"/></li>
				<li class="step step4" data-step="4"><@spring.message code="label.index.upper.phrase4"/></li>
			</ul>
		</div>
		<div class="large-6 columns" style="min-height: 305px">
			<img src="<@spring.url relativeUrl="/img/screen-player-1.png"/>" class="screenshot-player" alt="" />
		</div>
	</div>

	<div class="row content">
		<h3 class="pergunta"><@spring.message code="label.index.lower.title"/></h3>
		<div class="large-6 columns" style="min-height: 305px">
			<img src="<@spring.url relativeUrl="/img/screen-coach-1.png"/>" class="screenshot-coach" alt="" />
		</div>
		<div class="large-6 columns">
			<ul class="coach-steps">
				<li class="step step1" data-step="1"><@spring.message code="label.index.lower.phrase1"/></li>
				<li class="step step2" data-step="2"><@spring.message code="label.index.lower.phrase2"/></li>
				<li class="step step3" data-step="3"><@spring.message code="label.index.lower.phrase3"/></li>
				<li class="step step4" data-step="4"><@spring.message code="label.index.lower.phrase4"/></li>
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
		$('#login').on("opened", function() {
			$('#j_username').focus();
		});
		$('#fb_button').click(function(){
			$('#fb_form').submit();
		});

		preload(
			"<@spring.url relativeUrl="/img/foto-esporte-1.png"/>",
			"<@spring.url relativeUrl="/img/foto-esporte-2.png"/>",
			"<@spring.url relativeUrl="/img/foto-esporte-3.png"/>",
			"<@spring.url relativeUrl="/img/foto-esporte-4.png"/>",
			"<@spring.url relativeUrl="/img/foto-esporte-5.png"/>",
			"<@spring.url relativeUrl="/img/screen-player-1.png"/>",
			"<@spring.url relativeUrl="/img/screen-player-2.png"/>",
			"<@spring.url relativeUrl="/img/screen-player-3.png"/>",
			"<@spring.url relativeUrl="/img/screen-player-4.png"/>",
			"<@spring.url relativeUrl="/img/screen-coach-1.png"/>",
			"<@spring.url relativeUrl="/img/screen-coach-2.png"/>",
			"<@spring.url relativeUrl="/img/screen-coach-3.png"/>",
			"<@spring.url relativeUrl="/img/screen-coach-4.png"/>"
		);
	});

	function preload() {
		var images = new Array()
		for (i = 0; i < preload.arguments.length; i++) {
			images[i] = new Image();
			images[i].src = preload.arguments[i];
		}
	}
</script>