<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_js=["/js/scaffold/playerDecorationUtil.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="content row">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.home"/></a> <a href="#" class="current"><@spring.message code="label.notifications"/></a>
		</nav>	

		<div class="box-content">
			<h2><@spring.message code="label.notifications"/></h2>

			<div style="" class="section-container auto notificacoes" data-section="">
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.contact_requests"/> <#if (_total_pending_friend_requests > 0)><span>(${_total_pending_friend_requests})</span></#if></a>
					</p>
					<div class="content" data-section-content="">
						<#if (contacts?size <= 0)><p><@spring.message code="label.you_have_no_contact_requests_at_the_moment"/></p></#if>
						<ul class="lista-resultados lista-aprovacoes">
							<#list contacts as item>
								<li class="item-resultado">
									<table>
										<tbody>
										<tr>
											<td><img src="<@spring.url relativeUrl="/app/avatar?hash=${(item[0]?html)!}&small"/>" class="avatar"/></td>
											<td>${item[1]} ${item[2]}</td>
											<td width="30%">
												<span class="actions hide">
													<a href="accept,${item[3]}" class="button button-small button-primary"><@spring.message code="label.accept"/></a>
													<a href="ignore,${item[3]}" class="button button-small"><@spring.message code="label.ignore"/></a>
												</span>
											</td>
										</tr>
										</tbody>
									</table>
								</li>
							</#list>
						</ul>
					</div>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/notifications/pendingScoreApprovals"/>"><@spring.message code="label.pending_score_approvals"/>  <#if (_total_pending_score_approvals > 0)><span>(${_total_pending_score_approvals})</span></#if></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/notifications/pendingScoreRevisions"/>"><@spring.message code="label.pending_score_revisions"/> <#if (_total_pending_score_revisions > 0)><span>(${_total_pending_score_revisions})</span></#if></a>
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

<script type="text/javascript">
var ClickContext = {
		tableLine: {}
};
$(function() {
	$('.item-resultado').hover(function(){
		$(this).find('span.actions').fadeIn('fast');
	}, function(){
	$(this).find('span.actions').fadeOut();
	})

	$("td a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).closest("li");

		var kind = $(this).attr('href').split(',')[0];
		var id = $(this).attr('href').split(',')[1];
		var url = '<@spring.url relativeUrl="/app/"/>' + kind + '/invitation/';

    	$.ajax({
		    url: url,
		    type: 'POST',
		    data: {'user2Id': id},
		    dataType: 'json',
		    complete: function() {
		    	ClickContext.tableLine.remove();
		    }
		});
	});
	PlayerDecorationUtil.addPlayerLinksTo('.item-resultado', ${playersForLinkCreation}, '<@spring.url relativeUrl="/"/>')
});
</script>