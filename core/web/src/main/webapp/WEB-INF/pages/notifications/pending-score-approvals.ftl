<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_js=["/js/jquery.autosize-1.17.8.min.js",
								"/js/scaffold/playerDecorationUtil.js",
								"/js/jquery.maskedinput-1.3.1.min.js"]>
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
						<a href="<@spring.url relativeUrl="/app/notifications/contactRequests"/>"><@spring.message code="label.contact_requests"/>  <#if (_total_pending_friend_requests > 0)><span>(${_total_pending_friend_requests})</span></#if></a>
					</p>
				</section>
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.pending_score_approvals"/> <#if (_total_pending_score_approvals > 0)><span>(${_total_pending_score_approvals})</span></#if></a>
					</p>
					<div class="content" data-section-content="">
						<#if (pendingScores?size <= 0)><p><@spring.message code="label.you_have_no_scores_to_approve_at_the_moment"/></p></#if>
						<ul class="lista-resultados lista-aprovacoes">
							<#list pendingScores as item>
								<li class="item-resultado <#if item.loggedUserWon>resultado-venceu<#else>resultado-perdeu</#if>">
									<table>
										<tbody>
										<tr>
											<td><img class="avatar" src="<@spring.url relativeUrl="/app/avatar?hash=${(item.sampleOpponentAvatar?html)!}&small"/>"/></td>
											<td>${item.opponentsNames}</td>
											<td>${item.detailTextHighlightingWinnerWithLoggedUserAtRight}</td>
											<td><@spring.message code="label.you"/></td>
											<td><img src="<@spring.url relativeUrl="/img/icons/time.png"/>" alt="${item.dateTime}" title="${item.dateTime}">${item.dateTime}</td>
											<td width="40%">
												<span class="actions hide">
													<a href="accept,${item.score.id?c},${item.score.owner.fullName}" class="button button-small button-primary"><@spring.message code="label.accept"/></a>
													<a href="review,${item.score.id?c},${item.score.owner.fullName}" class="button button-small button-warning"><@spring.message code="label.ask_for_revision"/></a>
													<a href="ignore,${item.score.id?c},${item.score.owner.fullName}" class="button button-small"><@spring.message code="label.ignore"/></a>
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
						<a href="<@spring.url relativeUrl="/app/notifications/pendingScoreRevisions"/>"><@spring.message code="label.pending_score_revisions"/> <#if (_total_pending_score_revisions > 0)><span>(${_total_pending_score_revisions})</span></#if></a>
					</p>
				</section>
			</div>
		</div>
	</div>

	<#include "dialog-revision-snippet.ftl">

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
		currentId: {},
		currentUrl: {}
};
$(function() {
	PlayerDecorationUtil.addPlayerLinksTo('.item-resultado', ${playersForLinkCreation}, '<@spring.url relativeUrl="/"/>')

	$('.item-resultado').hover(function(){
		$(this).find('span.actions').fadeIn('fast');
	}, function(){
	$(this).find('span.actions').fadeOut();
	});

	$("td .actions a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).closest("li");

		var kind = $(this).attr('href').split(',')[0];
		var id = $(this).attr('href').split(',')[1];
		var userName = $(this).attr('href').split(',')[2];

		NotificationUtil.pendingScoreApprovalsHandleClick(id, kind, userName, '<@spring.url relativeUrl="/"/>', {
			label_send_a_message_to_asking_for_revision_1_send_a_message_to: '<@spring.message code="label.send_a_message_to_asking_for_revision_1_send_a_message_to"/>',
			label_send_a_message_to_asking_for_revision_2_asking_for_revision: '<@spring.message code="label.send_a_message_to_asking_for_revision_2_asking_for_revision"/>'});
	});
});
</script>