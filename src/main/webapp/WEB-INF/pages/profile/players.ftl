<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Home">
	<#assign head_additional_js=["/js/steps.js",
								"/js/score.js",
								"/js/json2.js",
								"/js/scaffold/friendRequestUtil.js",
								"/js/players.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.profile"/></a>
		</nav>	
		<div class="box-content">
			<h2><@spring.message code="label.profile"/></h2>

			<div class="section-container vertical-tabs" data-section="vertical-tabs">
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/personal-information"/>"><@spring.message code="label.personal_information"/></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/social-networks"/>"><@spring.message code="label.social_networks"/></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/avatar"/>"><@spring.message code="label.avatar"/></a>
					</p>
				</section>
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.players"/></a>
					</p>
					<div class="content" data-section-content="">
						<input type="hidden" id="playerName" name="playerName"/>
						<p><h3><@spring.message code="label.players"/></h3></p>

						<div id="player-added-panel" class="label radius" style="display: none"></div>
						<div class="row">
							<div class="columns small-4 direita"><input type="text" name="add-new-player-input" id="add-new-player-input" placeholder="<@spring.message code="label.add_new_player"/>"></input></div>
							<div class="columns small-3"><button id="add-new-player-button" class="button button-small no-margin-top"><@spring.message code="label.add"/></button></div>
							<div class="columns small-4 direita">
								<#if (players?size > 0)>
									<#if (request.requestUri?ends_with("false"))>
										<a href="<@spring.url relativeUrl="/app/profile/players/ascending/true"/>"><@spring.message code="label.ascending"/></a>
									<#else>
										<a href="<@spring.url relativeUrl="/app/profile/players/ascending/false"/>"><@spring.message code="label.descending"/></a>
									</#if>
								<#else>
									&nbsp;
								</#if>
							</div>
							<div class="columns small-1">
							</div>
						</div>
						<#if (players?size <= 0)><p id="empty-players-message"><@spring.message code="label.you_have_no_players_to_manage_at_the_moment"/></p></#if>
						<ul class="lista-resultados lista-aprovacoes">
							<#list players as player>
								<li class="item-resultado">
									<table>
										<tbody>
											<tr>
												<#if player.connected>
													<td id="avatar-column"><img class="avatar" src="<@spring.url relativeUrl="/app/avatar?hash=${(player.association.profile.avatarHash?html)!}&small"/>"/></td>
													<td>${player.name}</td>
													<td id="actions-column" width="50%">
														<span class="actions hide">
															<a href="removeLink,${player.id}" class="button button-small button-primary"><@spring.message code="label.remove_link"/></a>
														</span>
													</td>
												<#else>
													<td></td>
													<td id="name-column">${player.name}</td>
													<td width="50%">
														<span class="actions hide">
															<a href="rename,${player.id}" class="button button-small button-primary"><@spring.message code="label.rename"/></a>
															<a href="invite,${player.id}" class="button button-small button-warning"><@spring.message code="label.invite"/></a>
															<#if !player.hasMatchAssociated><a href="remove,${player.id},${player.name}" class="button button-small"><@spring.message code="label.remove"/></a></#if>
														</span>
													</td>
												</#if>
											</tr>
										</tbody>
									</table>
								</li>
							</#list>
						</ul>
					</div>
				</section>
			</div>
		</div>
	</div>

	<#include "/helper-snippets/dialog-general-confirm-snippet.ftl">

	<#include "/profile/dialog-rename-player-snippet.ftl">

	<#assign should_show_checkbox=false>
	<#include "/helper-snippets/dialog-confirm-snippet.ftl">

	<#include "/helper-snippets/dialog-search-snippet.ftl">

	<#include "/helper-snippets/dialog-choose-player-from-list-snippet.ftl">

	<#include "/helper-snippets/dialog-registered-invitation-snippet.ftl">

	<#include "/helper-snippets/dialog-unregistered-invitation-snippet.ftl">

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
};
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
			continueWithSavingProcessCallback: function() { $.magnificPopup.close(); }
	};
	var invitationWizardOptions = {
		label_no: '<@spring.message code="label.no"/>',
		label_cancel: '<@spring.message code="label.cancel"/>'
	};
	InvitationWizard.init(newPlayerWizardOptions, invitationWizardOptions);

	var dialogRemoveOptions = {
			label_are_you_sure_you_want_to_remove_this_player_from_your_list: "<@spring.message code="label.are_you_sure_you_want_to_remove_this_player_from_your_list"/>",
			label_player_removed_successfully: "<@spring.message code="label.player_removed_successfully"/>",
			context_path: '<@spring.url relativeUrl="/"/>'
	};
	DialogRemove.init(dialogRemoveOptions);
	
	var dialogRemoveLinkOptions = {
			label_are_you_sure_you_want_to_remove_the_link_to_this_user: "<@spring.message code="label.are_you_sure_you_want_to_remove_the_link_to_this_user"/>",
			label_refresh_page_to_see_new_actions_available: "<@spring.message code="label.refresh_page_to_see_new_actions_available"/>",
			label_link_removed_successfully: "<@spring.message code="label.link_removed_successfully"/>",
			context_path: '<@spring.url relativeUrl="/"/>'
	};
	DialogRemoveLink.init(dialogRemoveLinkOptions);

	DialogRename.init();

	DialogGeneralConfirm.init();

	var playerCrudOptions = {
			label_player_added_successfully: "<@spring.message code="label.player_added_successfully"/>",
			label_refresh_page_to_see_new_actions_available: "<@spring.message code="label.refresh_page_to_see_new_actions_available"/>",
			context_path: '<@spring.url relativeUrl="/"/>'
	};
	PlayerCrud.init(playerCrudOptions);
});
</script>