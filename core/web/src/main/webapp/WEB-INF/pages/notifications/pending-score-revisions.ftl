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
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/notifications/contactRequests"/>"><@spring.message code="label.contact_requests"/> <#if (_total_pending_friend_requests > 0)><span>(${_total_pending_friend_requests})</span></#if></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/notifications/pendingScoreApprovals"/>"><@spring.message code="label.pending_score_approvals"/> <#if (_total_pending_score_approvals > 0)><span>(${_total_pending_score_approvals})</span></#if></a>
					</p>
				</section>
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.pending_score_revisions"/> <#if (_total_pending_score_revisions > 0)><span>(${_total_pending_score_revisions})</span></#if></a>
					</p>
					<div class="content" data-section-content="">
						<#if (pendingRevisions?size <= 0)><p><@spring.message code="label.you_have_no_scores_to_review_at_the_moment"/></p></#if>
						<ul class="lista-resultados lista-aprovacoes">
							<form id="review-form" method="post" action="<@spring.url relativeUrl="/app/review/revision"/>">
								<input type="hidden" id="scoreId" name="scoreId" />
								<#list pendingRevisions as item>
									<li class="item-resultado">
										<table>
											<tbody>
												<tr>
													<td><@spring.message code="label.reviewed_by"/>: <img class="avatar" src="<@spring.url relativeUrl="/app/avatar?hash=${(item.playerInstance.player.avatar?html)!}&small"/>"/> ${item.playerInstance.player.name}</td>
													<td width="30%" rowspan="6">
														<span class="actions hide">
															<a href="approve,${item.score.id?c},${item.playerInstance.id?c}" class="button button-small button-primary"><@spring.message code="label.approve"/></a>
															<a href="ignore,${item.score.id?c},${item.playerInstance.id?c}" class="button button-small"><@spring.message code="label.ignore"/></a>
														</span>
													</td>
												</tr>
												<tr><td><@spring.message code="label.original_date"/>: ${item.dateTime}</td></tr>
												<tr><td><@spring.message code="label.reviewed_date"/>: ${item.revisionDateTime}</td></tr>
												<tr><td><@spring.message code="label.original_score"/>: ${item.opponentsNames} ${item.detailTextHighlightingWinnerWithLoggedUserAtRight} <@spring.message code="label.you"/></td></tr>
												<tr><td><@spring.message code="label.reviewed_score"/>: ${item.opponentsNames} ${item.revisionScoreWithLoggedUserAtRight} <@spring.message code="label.you"/></td></tr>
												<tr><td><@spring.message code="label.revision_message"/>: ${item.playerInstance.revisionMessage!""}</td></tr>
											</tbody>
										</table>
									</li>
								</#list>
							</form>
						</ul>
					</div>
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

<script type="text/javascript" src="<@spring.url relativeUrl="/js/scaffold/notificationUtil.js"/>"></script>

<script type="text/javascript">
var ClickContext = {
		tableLine: {},
};
$(function() {
	PlayerDecorationUtil.addPlayerLinksTo('.item-resultado', ${playersForLinkCreation}, '<@spring.url relativeUrl="/"/>')

	$('.item-resultado').hover(function(){
		$(this).find('span.actions').fadeIn('fast');
	}, function(){
	$(this).find('span.actions').fadeOut();
	})

	$("td .actions a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).closest("li");

		var kind = $(this).attr('href').split(',')[0];
		var scoreId = $(this).attr('href').split(',')[1];
		var playerInstanceId = $(this).attr('href').split(',')[2];

		NotificationUtil.pendingScoreRevisionsHandleClick(scoreId, playerInstanceId, kind, '<@spring.url relativeUrl="/"/>');
	});
});
</script>