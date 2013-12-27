<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Home">
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.account_settings"/></a>
		</nav>	
		<div class="box-content">
			<h2><@spring.message code="label.account_settings"/></h2>

			<div class="section-container vertical-tabs" data-section="vertical-tabs">
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.terms_and_conditions"/></a>
					</p>
					<div class="content" data-section-content="">
						<p><h3><@spring.message code="label.terms_and_conditions"/></h3></p>
						<p><@spring.message code="label.terms_and_conditions_content"/></p>
					</div>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/accountSettings/closeAccount"/>"><@spring.message code="label.close_account"/></a>
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