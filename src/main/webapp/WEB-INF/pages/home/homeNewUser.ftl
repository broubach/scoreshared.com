<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: homeNewUser">
	<#assign head_additional_js=["/js/steps.js",
								"/js/score.js",
								"/js/json2.js",
								"/js/scaffold/friendRequestUtil.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<div class="small-6 large-centered columns">
			<div class="centralizado">
				<h2 class="no-margin-bottom"><@spring.message code="label.share_your_first_score"/></h2>
				<a href="<@spring.url relativeUrl="/app/score"/>" class="button button-primary"><@spring.message code="label.share"/></a>
			</div>
		</div>
	</div>

	<div class="row content">
		<br />
	</div>

	<div class="row content no-padding-bottom">
		<div class="small-12 large-centered columns">
			<div class="centralizado">
				<h2><@spring.message code="label.how_about_adding_racquet_friends_to_your_list"/></h2>
			</div>
		</div>
	</div>

	<div class="row content no-padding-top no-padding-bottom">
		<div class="small-6 columns large-centered">
			<div class="row content no-padding-top">
				<form id="player-form" accept-charset="utf-8" >
					<div class="small-7 columns">
						<div class="input text"><input type="text" id="playerName" name="playerName" placeholder="<@spring.message code="label.type_in_your_friends_name"/>" maxlength="45"></input></div>
					</div>
					<div class="small-5 columns">
						<a id="save" class="button no-margin-top"><@spring.message code="label.add"/></a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="row content">
		<div class="small-6 columns large-centered" id="success-pane" style="display: none">
			<div class="label radius"><@spring.message code="label.player_added_successfully"/></div>
		</div>
	</div>

	<div id="friendsList" class="row content no-padding-top" <#if (players?size <= 0)>style="display: none"</#if>>
		<div class="small-7 columns large-centered auto notificacoes">
			<p><@spring.message code="label.added_friends"/></p>
			<ul id="playerList" class="lista-resultados lista-aprovacoes">
				<#list players as player>
					<li class="item-resultado">
						<table>
							<tbody>
							<tr>
								<td>${player[1]}</td>
							</tr>
							</tbody>
						</table>
					</li>
				</#list>
			</ul>
		</div>
	</div>

	<#assign should_show_checkbox=false>
	<#include "/helper-snippets/dialog-confirm-snippet.ftl">

	<#include "/helper-snippets/dialog-search-snippet.ftl">

	<#include "/helper-snippets/dialog-choose-player-from-list-snippet.ftl">

	<#include "/helper-snippets/dialog-registered-invitation-snippet.ftl">

	<#include "/helper-snippets/dialog-unregistered-invitation-snippet.ftl">

	<div class="row content">
		<br />
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>

<script type="text/javascript">
	$(function() {
		var newPlayerWizardOptions = {
				contextPath: "<@spring.url relativeUrl="/"/>",
				error_please_enter_some_text: "<@spring.message code="error.please_enter_some_text"/>",
				error_please_fill_at_least_one_field_for_search: "<@spring.message code="error.please_fill_at_least_one_field_for_search"/>",
				error_please_fill_out_all_fields: "<@spring.message code="error.please_fill_out_all_fields"/>",
				label_search_for: "<@spring.message code="label.search_for"/>",
				label_take_the_opportunity_to_invite: "<@spring.message code="label.take_the_opportunity_to_invite"/>",
				label_user_not_found: "<@spring.message code="label.user_not_found"/>",
				loggedUserAvatarHash: "${loggedUserAvatarHash}",
				continueWithSavingProcessCallback: function() {
					$.ajax({
						url: '<@spring.url relativeUrl="/app/home/player"/>',
						data: {'playerName': $(document.getElementById('playerName')).val()},
						type: 'POST',
						dataType: 'json',
						cache: false,
						success: function(data) {
							$('#friendsList').show();
							$('#playerList').append('<li class="item-resultado"><table><tbody><tr><td>' + data.playerName + 
									'</td></tr></tbody></table></li>');
							$('#success-pane div div').text(data.playerName);
							$('#playerName').val('');
							$('#success-pane').show();
							$('#success-pane').fadeOut(2000);
						}
					});
				}
		};

		NewPlayerWizard.init(newPlayerWizardOptions);
		NewPlayerWizard.steps['first'] = ProvidePlayerListWithSinglePlayerStep.init(newPlayerWizardOptions);
		NewPlayerWizard.steps[BuildDataWithI18nStep.name] = BuildDataWithI18nStep.init();
	});
</script>