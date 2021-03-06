<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.home"/></a> <a href="#" class="current"><@spring.message code="label.profile"/></a>
		</nav>	
		<div class="box-content">
			<h2><@spring.message code="label.profile"/></h2>

			<div class="section-container vertical-tabs" data-section="vertical-tabs">
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/basic-information"/>"><@spring.message code="label.basic_information"/></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/personal-information"/>"><@spring.message code="label.personal_information"/></a>
					</p>
				</section>
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.social_networks"/></a>
					</p>
					<div class="content" data-section-content="">
						<p>
							<h3><@spring.message code="label.social_networks"/></h3>
						</p>
						<div class="row">
							<div class="row">
								<div class="small-12 columns centralizado">
									<#if facebookConnected>
									    <#if canDisconnect> 
										    <form action="<@spring.url relativeUrl="/app/connect/facebook"/>" method="POST"><input type="hidden" name="_method" value="delete" /><button type="submit" class="button"><img src="<@spring.url relativeUrl="/img/fb.png"/>"/> <@spring.message code="label.disconnect"/></button>: ${facebookAccount}</form>
										<#else>
											<span class="button secondary disabled"><img src="<@spring.url relativeUrl="/img/fb.png"/>"/> <@spring.message code="label.connected"/>: ${facebookAccount}</span>
										</#if>
									<#else>
										<form action="<@spring.url relativeUrl="/app/connect/facebook"/>" method="POST"><input type="hidden" name="scope" value="email,publish_actions" /><button type="submit" class="button"><img src="<@spring.url relativeUrl="/img/fb.png"/>"/> <@spring.message code="label.connect"/></button></form>
									</#if>
								</div>
							</div>
							<div class="row">
								<div class="small-12 columns centralizado">
									<#if twitterConnected>
									    <#if canDisconnect>
										    <form action="<@spring.url relativeUrl="/app/connect/twitter"/>" method="POST"><input type="hidden" name="_method" value="delete" /><button type="submit" class="button"><img src="<@spring.url relativeUrl="/img/twitter.png"/>"/> <@spring.message code="label.disconnect"/></button>: ${twitterAccount}</form>
										<#else>
											<span class="button secondary disabled"><img src="<@spring.url relativeUrl="/img/twitter.png"/>"/> <@spring.message code="label.connected"/>: ${twitterAccount}</span>
										</#if>
									<#else>
										<form action="<@spring.url relativeUrl="/app/connect/twitter"/>" method="POST"><button type="submit" class="button"><img src="<@spring.url relativeUrl="/img/twitter.png"/>"/> <@spring.message code="label.connect"/></button></form>
									</#if>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/avatar"/>"><@spring.message code="label.avatar"/></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/players/page/0/ascending/true"/>"><@spring.message code="label.players"/></a>
					</p>
				</section>
			</div>
		</div>
	</div>

	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>