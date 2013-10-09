<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: homeNewUser">
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
	<#include "/helper-snippets/basic-header.ftl">

	<a href="/scoreshared/pages/feedbackform" id="feedback" class="ajax-popup-link"><img src="<@spring.url relativeUrl="/img/buttons/feedback.png"/>" alt="" /></a>
	<div class="row content">
		<div class="small-6 large-centered columns">
			<div class="centralizado">
				<h2>Share your first result</h2>
				<a href="/scoreshared/painel/registerScore" class="button">Compartilhar</a>
			</div>
			<div class="item-resultado">
				<img src="<@spring.url relativeUrl="/img/avatars/user1.png"/>" class="avatar" alt="" /> <a href="#">João</a>
				<span class="placar"> 1 x <span class="winner">5</span></span>
				<a href="#">João</a> <img src="<@spring.url relativeUrl="/img/avatars/user1.png"/>" class="avatar" alt="" />
			</div>
			<div class="item-resultado">
				<img src="<@spring.url relativeUrl="/img/avatars/user2.png"/>" class="avatar" alt="" /> <a href="#">Felipe</a>
				<span class="placar"> 1 x <span class="winner">1</span></span>
				<a href="#">Felipe</a> <img src="<@spring.url relativeUrl="/img/avatars/user2.png"/>" class="avatar" alt="" />
			</div>
			<div class="item-resultado">
				<img src="<@spring.url relativeUrl="/img/avatars/user3.png"/>" class="avatar" alt="" /> <a href="#">Rodrigo</a> <span class="placar">
				<span class="winner">6</span> x 1</span>
				<a href="#">Rodrigo</a> <img src="<@spring.url relativeUrl="/img/avatars/user3.png"/>" class="avatar" alt="" />
			</div>
			<div class="item-resultado">
				<img src="<@spring.url relativeUrl="/img/avatars/user4.png"/>" class="avatar" alt="" /> <a href="#">Felipe</a>
				<span class="placar"> <span class="winner">4</span> x 3</span>
				<a href="#">Felipe</a> <img src="<@spring.url relativeUrl="/img/avatars/user4.png"/>" class="avatar" alt="" />
			</div>
		</div>
	</div>

	<div class="row content">
		<br />
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>