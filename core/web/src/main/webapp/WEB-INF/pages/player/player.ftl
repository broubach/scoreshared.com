<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_js=["/js/vendor/Chart.min.js",
								 "/js/scaffold/playerDecorationUtil.js",
								 "/js/scaffold/friendRequestUtil.js"]>
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
				<div class="columns small-2"><img src="<@spring.url relativeUrl="/app/avatar?hash=${player.avatarHash}"/>" class="avatar"/></div>
				<div class="columns small-5"><h2>${player.user.fullName}</h2></div>
				<div class="columns small-5">
					<#if !player.connected && !player.invitationDate??>
						<button id="connect" class="button button-small"><@spring.message code="label.connect"/></button>
					</#if>&nbsp;
				</div>
			</div>
			<div class="row">
				<div class="columns small-5">
					<#if (scores?size <= 0)><p><@spring.message code="label.no_scores_were_found_for_this_player"/></p></#if>
					<ul class="lista-resultados lista-aprovacoes">
						<#list scores as item>
							<li class="item-resultado <#if item.loggedUserWon>resultado-venceu<#else>resultado-perdeu</#if>">
								<table>
									<tbody>
									<tr>
										<td>
											${item.dateTime}
										</td>
										<td>${item.detailText}</td>
										<td width="10%">
											<#assign avatarHash>${item.sampleOpponentAvatar}</#assign>
											<#if avatarHash?has_content>
												<img src="<@spring.url relativeUrl="/app/avatar?hash=${avatarHash}&small"/>" class="avatar"/>
											</#if>
										</td>
									</tr>
									</tbody>
								</table>
							</li>
						</#list>
					</ul>
				</div>
				<div class="columns small-5">
					<div class="row">
						<div class="columns small-5 input text direita"><@spring.message code="label.age" /></div>
						<div class="columns small-7">${player.age}</div>
					</div>
					<div class="row">
						<div class="columns small-5 input text direita"><@spring.message code="label.residence" /></div>
						<div class="columns small-7">${player.residence}</div>
					</div>
					<#if player.showContactInfoToFriends>
						<div class="row">
							<div class="columns small-5 input text direita"><@spring.message code="label.phone_number" /></div>
							<div class="columns small-7">${player.phoneNumber}</div>
						</div>
					</#if>
					<div class="row">
						<div class="columns small-5 input text direita"><@spring.message code="label.academy" /></div>
						<div class="columns small-7">${player.academy}</div>
					</div>
					<div class="row">
						<div class="columns small-5 input text direita"><@spring.message code="label.plays" /></div>
						<div class="columns small-7">${player.plays}</div>
					</div>
					<div class="row">
						<div class="columns small-5 input text direita"><@spring.message code="label.coach" /></div>
						<div class="columns small-7">${player.coach}</div>
					</div>
					<div class="row">
						<div class="columns small-5 input text direita"><@spring.message code="label.site" /></div>
						<div class="columns small-7">${player.site}</div>
					</div>
					<div class="row">
						<div class="columns small-5 input text direita"><@spring.message code="label.self_definition" /></div>
						<div class="columns small-7">${player.style}</div>
					</div>
				</div>
				<div class="columns small-2">
					<#if (win + loss > 0)>
						<canvas id="estatistica-jogos"></canvas><br/>
						<p class="centralizado">${win}/${loss} (${win/(win + loss)} %)</p>
					</#if>
				</div>
			</div>
		</div>
	</div>

	<#include "/helper-snippets/dialog-registered-invitation-snippet.ftl">

	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>

<script type="text/javascript">
$(function() {
	PlayerDecorationUtil.addPlayerLinksTo('.item-resultado', ${playersForLinkCreation}, '<@spring.url relativeUrl="/"/>')

	$('#connect').click(function(e) {
		<#if player.id??>
			$("#registeredInvitation-form input[name='playerId']").val(${player.id});
		</#if>
	
		$.ajax({
			url: '<@spring.url relativeUrl="/app/player/userInfo/${player.user.id}" />',
			type: 'GET',
			cache: false,
			success: function(data) {
				FriendRequestUtil.openFriendRequestDialog(data, '<@spring.url relativeUrl="/"/>');
			}
		});
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