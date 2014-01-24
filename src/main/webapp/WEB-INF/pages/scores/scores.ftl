<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Notifications">
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
						<div class="columns small-3"><input type="text" id="search-text" name="search-text" placeholder="<@spring.message code="label.player_or_comment"/>"/></div>
						<div class="columns small-1"><button id="search-button" class="button button-small no-margin-top"><@spring.message code="label.search"/></button></div>
						<div class="columns small-4 radio direita"><label><input type="radio" name="scoreOutcomeFilter" value="ALL"><@spring.message code="label.all"/></label>&nbsp;<label><input type="radio" name="scoreOutcomeFilter" value="WIN"><@spring.message code="label.win"/></label>&nbsp;<label><input type="radio" name="scoreOutcomeFilter" value="LOSS"><@spring.message code="label.loss"/></label></div>
						<div class="columns small-4 direita"><a href="#"><@spring.message code="label.descendent_by_date"/></a></div>
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
					<ul class="lista-resultados lista-aprovacoes">
						<#list scores as item>
							<li class="item-resultado <#if item.loggedUserWon>resultado-venceu<#else>resultado-perdeu</#if>">
								<table>
									<tbody>
									<tr>
										<td><#if item.confirmed!false><img src="<@spring.url relativeUrl="/img/icons/check.png"/>" title="<@spring.message code="label.confirmed_score"/>"></#if></td>
										<td>${item.date}</td>
										<td>${item.time}</td>
										<td>${item.score.leftPlayerNames}</td>
										<td>6x4 against</td>
										<td>${item.score.rightPlayerNames}</td>
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
												<a href="remove,${item.score.id}" class="button button-small button-primary"><@spring.message code="label.remove"/></a>
												<#if associatedPlayer.owner.id == item.score.owner.id><a href="forward,${item.score.id}" class="button button-small button-primary"><@spring.message code="label.forward"/></a></#if>
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

	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>

<script type="text/javascript">
var ClickContext = {
		tableLine: {},
		currentId: {},
		currentUrl: {}
};
$(function() {
	
	// TODO: add behavior for search, radios, and link
	$('.item-resultado').hover(function(){
		$(this).find('span.actions').fadeIn('fast');
	}, function(){
	$(this).find('span.actions').fadeOut();
	});

	$("td a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).closest("li");

		var kind = $(this).attr('href').split(',')[0];
		var id = $(this).attr('href').split(',')[1];

		// TODO: if edit, forward to score edit uc
		// TODO: if remove, ask for confirmation
		// TODO: if forward, show forward interface
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