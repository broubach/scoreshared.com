<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Scores">
	<#assign head_additional_js=["/js/vendor/Chart.min.js"]>
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
										<td width="35%">
											<span class="actions hide">
												<a href="edit,${item.score.id}" class="button button-small button-primary"><@spring.message code="label.edit"/></a>
												<#if associatedPlayer.owner.id == item.score.owner.id>
													<#if (item.score.connectedPlayers?size > 1)>
														<a href="forward,${item.score.id}" class="button button-small button-primary"><@spring.message code="label.forward"/></a>
													</#if>
													<a href="remove,${item.score.id}" class="button button-small button-primary"><@spring.message code="label.remove"/></a>
												<#else>
													<a href="hide-permanently,${item.score.id}" class="button button-small button-primary"><@spring.message code="label.hide_permanently"/></a>
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

	<div id="dialog-forward" class="modal mfp-hide" style="max-width: 500px">
		<div class="row content">
			<div class="columns large-12">
				<h2><@spring.message code="label.confirmation"/></h2>
				<div id="general-info-panel" class="label radius" style="display: none"></div>
				<p id="general-confirmation-question"></p>
				<div class="row">
					<div class="columns small-12 direita">
						<button class="button button-primary mfp-prevent-close" id="dialog-general-confirm-yes"><@spring.message code="label.yes"/></button>
						<a class="button mfp-prevent-close" id="dialog-general-confirm-no"><@spring.message code="label.no"/></a>
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
var ClickContext = {
		tableLine: {},
		id: '',
		kind: ''
};
$(function() {
	$('#search-button,#radioAll,#radioWin,#radioLoss,#descendingByDate,#ascendingByDate').click(function(e){
		var searchTerm = $('#search-term').val();
		var outcome = $('input[name=scoreOutcomeFilter]:checked').val();
		var ascending = ${(!ascending)?c};
		if (searchTerm) {
			document.location.href = '<@spring.url relativeUrl="/app/scores/0/"/>' + searchTerm + "/" + outcome + "/" + ascending;
		} else {
			document.location.href = '<@spring.url relativeUrl="/app/scores/0/"/>' + outcome + "/" + ascending;
		}
	});

	$('.item-resultado').hover(function(){
		$(this).find('span.actions').fadeIn('fast');
	}, function(){
	$(this).find('span.actions').fadeOut();
	});

	DialogGeneralConfirm.init();

	$('#dialog-general-confirm-yes').click(function(e) {
		if (ClickContext.kind == 'remove') {
			$.ajax({
				url: '<@spring.url relativeUrl="/app/scores/remove/"/>' + ClickContext.id,
				type: 'DELETE',
				dataType: 'json',
				cache: false,
				success: function(data) { $.magnificPopup.close(); }
			});

		} else if (ClickContext.kind == 'hide-permanently') {
			$.ajax({
				url: '<@spring.url relativeUrl="/app/scores/hidePermanently/"/>',
				data: {'scoreId': ClickContext.id},
				type: 'POST',
				dataType: 'json',
				cache: false,
				success: function(data) { $.magnificPopup.close(); }
			});
		}
	});

	$("td a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).closest("li");
		ClickContext.kind = $(this).attr('href').split(',')[0];
		ClickContext.id = $(this).attr('href').split(',')[1];

		if (ClickContext.kind == 'edit') {
			document.location.href = '<@spring.url relativeUrl="/app/score/"/>' + 
										ClickContext.id + '?postSaveUrl=' + 
										decodeURIComponent(document.location.href).substring(decodeURIComponent(document.location.href).lastIndexOf('/app/'));

		} else if (ClickContext.kind == 'forward') {
			// TODO: open forward dialog

		} else if (ClickContext.kind == 'remove') {
			$('#general-confirmation-question').html("<@spring.message code="label.confirm_score_removal"/>");
			$.magnificPopup.open({
				items : {
					src : '#dialog-general-confirm',
					type : 'inline'
				}
			});

		} else if (ClickContext.kind == 'hide-permanently') {
			$('#general-confirmation-question').html("<@spring.message code="label.confirm_to_hide_score_permanently"/>");
			$.magnificPopup.open({
				items : {
					src : '#dialog-general-confirm',
					type : 'inline'
				}
			});
		}
	});

	var ctx = $("#estatistica-jogos").get(0).getContext("2d");
	var data = [
		{
			value: ${win},
			color:"#d35400"
		},
		{
			value : ${loss},
			color : "#e67e22"
		},
	];
	var options = {
		//Boolean - Whether we should show a stroke on each segment
		segmentShowStroke : true,
		
		//String - The colour of each segment stroke
		segmentStrokeColor : "rgba(250, 250, 250, .2)",
		
		//Number - The width of each segment stroke
		segmentStrokeWidth : 4,
		
		//Boolean - Whether we should animate the chart	
		animation : true,
		
		//Number - Amount of animation steps
		animationSteps : 100,
		
		//String - Animation easing effect
		animationEasing : "easeOutBounce",
		
		//Boolean - Whether we animate the rotation of the Pie
		animateRotate : true,
	
		//Boolean - Whether we animate scaling the Pie from the centre
		animateScale : true,
		
		//Function - Will fire on animation completion.
		onAnimationComplete : null
	}
	$("#estatistica-jogos").attr('width',$("#estatistica-jogos").parent().width());
	var chart = new Chart(ctx).Pie(data,options);
});
</script>