<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_css=["/css/vendor/select2.css"]>
	<#assign head_additional_js=["/js/vendor/Chart.min.js", 
								"/js/scores.js", 
								"/js/scaffold/playerDecorationUtil.js",
								"/js/vendor/select2.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="content row">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="#"><@spring.message code="label.my_scores"/></a>
		</nav>

		<div class="box-content">

			<div class="row">
				<div class="columns small-10">
					<div class="row">
						<div class="columns small-12">
							<h2><@spring.message code="label.my_scores"/></h2>
							<br/><br/><br/><br/><br/>
						</div>
					</div>
					<div class="row">
						<div class="columns small-3"><input type="text" id="search-term" name="search-term" placeholder="<@spring.message code="label.player_or_comment"/>" value="${searchTerm!""}"/></div>
						<div class="columns small-1"><button id="search-button" class="button button-small no-margin-top"><@spring.message code="label.search"/></button></div>
						<div class="columns small-4 radio direita">
							<label><input id="radioAll" type="radio" name="scoreOutcomeFilter" value="ALL" <#if outcome = 'ALL'>checked='checked'</#if>><@spring.message code="label.all"/></label>&nbsp;
							<label><input id="radioWin" type="radio" name="scoreOutcomeFilter" value="WIN" <#if outcome = 'WIN'>checked='checked'</#if>><@spring.message code="label.win"/></label>&nbsp;
							<label><input id="radioLoss" type="radio" name="scoreOutcomeFilter" value="LOSS" <#if outcome = 'LOSS'>checked='checked'</#if>><@spring.message code="label.loss"/></label></div>
						<div class="columns small-4 direita">
							<#if (ascending)>
								<a id="descendingByDate" href="#"><@spring.message code="label.descending_by_date"/></a>
							<#else>
								<a id="ascendingByDate" href="#"><@spring.message code="label.ascending_by_date"/></a>
							</#if>
						</div>
					</div>
				</div>
				<div class="columns small-2">
					<#if (win + loss > 0)>
						<canvas id="estatistica-jogos"></canvas><br/>
						<p class="centralizado">${win}/${loss} (${win/(win + loss)} %)</p>
					</#if>
				</div>
			</div>

			<div class="row">
				<div class="columns small-12">
					<#if (scores?size <= 0)><p><@spring.message code="label.no_scores_matching_your_criteria_were_found"/></p></#if>
					<ul class="lista-resultados lista-aprovacoes">
						<#list scores as item>
							<li class="item-resultado <#if item.loggedUserWon>resultado-venceu<#else>resultado-perdeu</#if>">
								<table>
									<tbody>
									<tr>
										<td><#if item.confirmed!false><img src="<@spring.url relativeUrl="/img/icons/check.png"/>" title="<@spring.message code="label.confirmed_score"/>"></#if></td>
										<td>${item.date}</td>
										<td>${item.time}</td>
										<td>${item.yourTeamNames}</td>
										<td>${item.detailTextHighlightingWinnerWithLoggedUserAtLeft} <@spring.message code="label.against"/></td>
										<td>${item.opponentsNames}</td>
										<td>
											<#if item.comment??>
												<img src="<@spring.url relativeUrl="/img/text_align_justify.png"/>" title="${item.comment.comment}"/>
											</#if>
										</td>
										<td>
											<#assign avatarHash>${item.sampleOpponentAvatar}</#assign>
											<#if avatarHash?has_content>
												<img class="avatar" src="<@spring.url relativeUrl="/app/avatar?hash=${avatarHash}&small"/>"/>
											</#if>
										</td>
										<td id="actions-column" width="35%">
											<span class="actions hide">
												<a href="edit,${item.score.id?c}" class="button button-small button-primary"><@spring.message code="label.edit"/></a>
												<#if associatedPlayer.owner.id == item.score.owner.id>
													<#if (item.score.connectedPlayersInScore?size > 1)>
														<a href="forward,${item.score.id?c}" class="button button-small button-primary"><@spring.message code="label.forward"/></a>
													</#if>
													<a href="remove,${item.score.id?c}" class="button button-small button-primary"><@spring.message code="label.remove"/></a>
												<#else>
													<a href="hide-permanently,${item.score.id?c}" class="button button-small button-primary"><@spring.message code="label.hide_permanently"/></a>
												</#if>
											</span>
										</td>
									</tr>
									</tbody>
								</table>
							</li>
						</#list>
					</ul>
				</div>
			</div>
			
		</div>
	</div>

	<#include "/helper-snippets/dialog-general-confirm-snippet.ftl">

	<div id="dialog-forward-one-player" class="modal mfp-hide" style="max-width: 500px">
		<div class="row content">
			<div class="columns large-12">
				<input type="hidden" id="forward-one-player_playerId" name="forward-one-player_playerId"></input>
				<h2><@spring.message code="label.confirmation"/></h2>
				<div id="forward-one-player-info-panel" class="label radius" style="display: none"></div>
				<p id="forward-one-player_question">
					<@spring.message code="label.confirm_forward_player"/>
					<@spring.message code="label.do_you_want_to_forward_this_match_to_"/>
				</p>
				<p id="forward-one-player_playerName"></p>
				<div class="row">
					<div class="columns small-12 direita">
						<button class="button button-primary mfp-prevent-close" id="dialog-forward-one-player_yes"><@spring.message code="label.yes"/></button>
						<a class="button mfp-prevent-close" id="dialog-forward-one-player_no"><@spring.message code="label.no"/></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="dialog-forward-multiple-players" class="modal mfp-hide" style="max-width: 500px">
		<div class="row content">
			<div class="columns large-12">
				<input type="hidden" id="forward-multiple-players_playerId" name="forward-multiple-players_playerId"></input>
				<h2><@spring.message code="label.confirmation"/></h2>
				<div id="forward-multiple-players-info-panel" class="label radius" style="display: none"></div>
				<p id="forward-multiple-players_question">
					<@spring.message code="label.confirm_forward_player"/>
				</p>
				<div class="input text">
					<label for="dialog-forward-multiple-players_selection"><@spring.message code="label.please_choose_who_is_going_to_be_the_new_owner_of_this_score"/></label>
					<select id="dialog-forward-multiple-players_selection"></select>
				</div>
				<div class="row">
					<div class="columns small-12 direita">
						<button class="button button-primary mfp-prevent-close" id="dialog-forward-multiple-players_forward"><@spring.message code="label.forward"/></button>
						<a class="button mfp-prevent-close" id="dialog-forward-multiple-players_cancel"><@spring.message code="label.cancel"/></a>
					</div>
				</div>
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
$(function() {
	PlayerDecorationUtil.addPlayerLinksTo('.item-resultado', ${playersForLinkCreation}, '<@spring.url relativeUrl="/"/>')

	DialogGeneralConfirm.init();
	
	var options = {
		context: "<@spring.url relativeUrl="/"/>",
		label_confirm_score_removal: "<@spring.message code="label.confirm_score_removal"/>",
		label_confirm_to_hide_score_permanently: "<@spring.message code="label.confirm_to_hide_score_permanently"/>",
		label_refresh_page_to_see_new_actions_available: "<@spring.message code="label.refresh_page_to_see_new_actions_available"/>",
		ascending: ${(!ascending)?c},
		win: ${win},
		loss: ${loss}
	}
	Scores.init(options);
});
</script>