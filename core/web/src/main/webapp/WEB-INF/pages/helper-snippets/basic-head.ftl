	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<#if head_title??>
		<title>${head_title}</title>
	<#else>
		<title><@spring.message code="label.default_pages_title"/></title>
	</#if>

	<!-- Set the viewport width to device width for mobile -->
	<meta name="viewport" content="width=device-width" />

	<link href="<@spring.url relativeUrl="/favicon.ico"/>" type="image/x-icon" rel="icon" />
	<link href="<@spring.url relativeUrl="/favicon.ico"/>" type="image/x-icon" rel="shortcut icon" />
	<link rel="stylesheet" type="text/css" href="<@spring.url relativeUrl="/css/foundation.min.css"/>" />
	<link rel="stylesheet" type="text/css" href="<@spring.url relativeUrl="/css/normalize.css"/>" />
	<link rel="stylesheet" type="text/css" href="<@spring.url relativeUrl="/css/app.css"/>" />
	<link rel="stylesheet" type="text/css" href="<@spring.url relativeUrl="/css/vendor/magnific-popup.css"/>" />
	<#if head_additional_css??>
		<#list head_additional_css as css>
			<link rel="stylesheet" type="text/css" href="<@spring.url relativeUrl="${css}"/>" />
		</#list>
	</#if>

	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.10.2.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/vendor/custom.modernizr.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/foundation.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery.magnific-popup-0.9.7.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/app.js"/>"></script>
	<#if head_additional_js??>
		<#list head_additional_js as js>
			<script type="text/javascript" src="<@spring.url relativeUrl="${js}"/>"></script>
		</#list>
	</#if>
	