	<header class="row">
		<div class="large-4 columns">
			<h1><a href="<@spring.url relativeUrl="/"/>"><img src="<@spring.url relativeUrl="/img/logo-score-shared.png"/>" alt="" width="195" height="86"/></a></h1>
		</div>
		<#if header_snippet??>
			<#include header_snippet>
		</#if>
	</header>

	<#if (!(should_show_feedback??) || should_show_feedback)>
		<a href="<@spring.url relativeUrl="/app/feedback-form"/>" id="feedback" class="ajax-popup-link"><img src="<@spring.url relativeUrl="/img/buttons/feedback.png"/>" alt="" /></a>
	</#if>