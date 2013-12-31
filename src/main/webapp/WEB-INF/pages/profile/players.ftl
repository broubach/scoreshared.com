<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Home">
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
						<p><h3><@spring.message code="label.players"/></h3></p>

						<#if (players?size <= 0)><p><@spring.message code="label.you_have_no_players_to_manage_at_the_moment"/></p></#if>
						<ul class="lista-resultados lista-aprovacoes">
							<#list players as player>
								<li class="item-resultado">
									<table>
										<tbody>
											<tr>
												<#if player.association??>
													<td><img class="avatar" src="<@spring.url relativeUrl="/app/avatar?hash=${(player.association.profile.avatarHash?html)!}&small"/>"/></td>
													<td>${player.name}</td>
													<td width="50%">
														<span class="actions hide">
															<a href="removeLink,${player.id}" class="button button-small button-primary"><@spring.message code="label.remove_link"/></a>
														</span>
													</td>
												<#else>
													<td></td>
													<td>${player.name}</td>
													<td width="50%">
														<span class="actions hide">
															<a href="rename,${player.id},${player.name}" class="button button-small button-primary"><@spring.message code="label.rename"/></a>
															<a href="invite,${player.id},${player.name}" class="button button-small button-warning"><@spring.message code="label.invite"/></a>
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
	removeLink: function() {
		// post deletion
		// show feedback message
		// redraw if necessary
	},

	rename: function() {
		// post rename
		// show feedback message
		// redraw if necessary
	},

	remove: function() {
		// post removal
		// show feedback message
		// redraw if necessary
	}
};
$(function() {
	$('.item-resultado').hover(function(){
		$(this).find('span.actions').fadeIn('fast');
	}, function(){
	$(this).find('span.actions').fadeOut();
	});

	$('#dialog-general-confirm-no').click(function() {
        $.magnificPopup.close();
	});

	$("td a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).closest("li");

		var kind = $(this).attr('href').split(',')[0];
		var id = $(this).attr('href').split(',')[1];
		var name = $(this).attr('href').split(',')[2];
		if (kind == "removeLink") {
			$('#confirmation-question').html("<@spring.message code="label.are_you_sure_you_want_to_remove_the_link_to_the_user_"/>" + name);
			$('#dialog-general-confirm-yes').click(ClickContext.removeLink);
			$.magnificPopup.open({
				items : {
					src : '#dialog-general-confirm',
					type : 'inline'
				}
			});

		} else if (kind == "rename") {
			$('#dialog-rename-player-rename').click(ClickContent.rename);
			$.magnificPopup.open({
				items : {
					src : '#dialog-rename-player',
					type : 'inline'
				}
			});

		} else if (kind == "invite") {
			NewPlayerWizard.breadCrumb = [];
			NewPlayerWizard.start('first');

		} else if (kind == "remove") {
			$('#confirmation-question').html("<@spring.message code="label.are_you_sure_you_want_to_remove_this_player_from_your_list"/>" + name);
			$('#dialog-general-confirm-yes').click(ClickContext.remove);
			$.magnificPopup.open({
				items : {
					src : '#dialog-general-confirm',
					type : 'inline'
				}
			});
		}
	});

	var newPlayerWizardOptions = {
			contextPath: "<@spring.url relativeUrl="/"/>",
			error_please_enter_some_text: "<@spring.message code="error.please_enter_some_text"/>",
			error_please_fill_at_least_one_field_for_search: "<@spring.message code="error.please_fill_at_least_one_field_for_search"/>",
			error_please_fill_out_all_fields: "<@spring.message code="error.please_fill_out_all_fields"/>",
			label_search_for: "<@spring.message code="label.search_for"/>",
			label_take_the_opportunity_to_invite: "<@spring.message code="label.take_the_opportunity_to_invite"/>",
			label_user_not_found: "<@spring.message code="label.user_not_found"/>",
			loggedUserAvatarHash: "${loggedUserAvatarHash}",
			continueWithSavingProcessCallback: function() { }
	};

	NewPlayerWizard.init(newPlayerWizardOptions);
	NewPlayerWizard.steps['first'] = ProvidePlayerListWithSinglePlayerStep.init(newPlayerWizardOptions);
	NewPlayerWizard.steps[BuildDataWithI18nStep.name] = BuildDataWithI18nStep.init();
});
</script>