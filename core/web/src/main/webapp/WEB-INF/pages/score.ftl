<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_additional_css=["/css/vendor/select2.css",
								"/css/vendor/pickadate/classic.css",
								"/css/vendor/pickadate/classic.time.css",
								"/css/vendor/pickadate/classic.date.css",
								"/css/app.css"]>
	<#assign head_additional_js=["/js/vendor/select2-3.4.6-custom.min.js",
								"/js/vendor/pickadate/legacy.js",
								"/js/vendor/pickadate/picker.js",
								"/js/vendor/pickadate/picker.date.js",
								"/js/vendor/pickadate/picker.time.js",
								"/js/jquery.autosize-1.17.8.min.js",
								"/js/app.js",
								"/js/jquery.numeric.js",
								"/js/steps.js",
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
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.home"/></a> <a href="#" class="current"><@spring.message code="label.register_score"/></a>
		</nav>	
		<div class="large-12 columns">
			<div class="box-content">
				<div class="row">
			   		<form id="score-form" method="post" action="<@spring.url relativeUrl="/app/score"/>" accept-charset="utf-8">
						<div class="small-12 large-12 columns">
							<h2><@spring.message code="label.score_details"/></h2>
						</div>
						<div class="small-12 large-12 columns">
						    <@spring.bind "score" />
							<#if (spring.status.errors.fieldErrorCount > 0)>
								<ul>
							    <@spring.bind "score.date" />
						        <#list spring.status.errorMessages as error>
						            <li>${error}</li>
						        </#list>
							    <@spring.bind "score.playersLeft" />
						        <#list spring.status.errorMessages as error>
						            <li>${error}</li>
						        </#list>
						        </ul>
							</#if>
						</div>
						<div class="small-12 large-7 columns">
							<@spring.formHiddenInput "score.commentId", ""/>
							<@spring.formHiddenInput "score.id", ""/>
							<@spring.formHiddenInput "score.ownerId", ""/>
							<@spring.formHiddenInput "score.newPlayersNotToBeRemembered", ""/>
							<@spring.formHiddenInput "score.updatable", ""/>
							<#assign isScoreUpdatableReadonlyAttributes>
								<#if !score.updatable>
									readonly="readonly"
								</#if>
							</#assign>
							<div class="resultados">
								<div class="row" id="playersPane">
									<div class="columns small-6 large-6">
										<div class="input text"><@spring.formInput "score.playersLeft", "style='width:100%'", "text"/></div>								
									</div>
									<div class="columns small-6 large-6">
										<div class="input text"><@spring.formInput "score.playersRight", "style='width:100%'", "text"/></div>
									</div>
								</div>
								<#assign player1Attribute>class='player1' maxlength='2' ${isScoreUpdatableReadonlyAttributes}</#assign>
								<#assign player2Attribute>maxlength='2' ${isScoreUpdatableReadonlyAttributes}</#assign>
								<div class="resultado-set" id="setsPane">
									<div class="row">
										<div class="columns small-2 large-2">
											<label class="nset"><@spring.message code="label.set"/> 1</label>
										</div>
										<div class="columns large-3 small-3 placar">
											<div class="input text"><@spring.formInput "score.set1Left", player1Attribute, "text"/></div>		
										</div>
										<div class="columns large-2 small-2">
											&nbsp;
										</div>
										<div class="columns large-3 small-3 placar">
											<div class="input text"><@spring.formInput "score.set1Right", player2Attribute, "text"/></div>
											</div>
										<div class="columns small-2 large-2">
											<#if score.updatable>
											<a href="javascript:Sets.deleteY(1);" class="js-remove-set"><img src="<@spring.url relativeUrl="/img/icons/menos.png"/>" alt="" /></a>
											</#if>
										</div>
									</div>
								</div>
								<#list 2..5 as i>
									<#if !(score.sets['"set"+i+"Left"'?eval]??)><#break></#if>
									<div class="resultado-set" id="setsPane${i}">
										<div class="row">
											<div class="columns small-2 large-2">
												<label class="nset"><@spring.message code="label.set"/> ${i}</label>
											</div>
											<div class="columns large-3 small-3 placar">
												<div class="input text"><@spring.formInput "score.set${i}Left", "class='player1'", "text"/></div>		
											</div>
											<div class="columns large-2 small-2">
												&nbsp;
											</div>
											<div class="columns large-3 small-3 placar">
												<div class="input text"><@spring.formInput "score.set${i}Right", "", "text"/></div>
											</div>
											<div class="columns small-2 large-2">
												<#if score.updatable>
												<a href="javascript:Sets.deleteY(${i});" class="js-remove-set"><img src="<@spring.url relativeUrl="/img/icons/menos.png"/>" alt="" /></a>
												</#if>
											</div>
										</div>
									</div>
								</#list>
								<#if score.updatable>
									<a href="javascript:Sets.increase();" class="js-add-set"><img src="<@spring.url relativeUrl="/img/icons/mais.png"/>" alt="" /></a>
									<hr/>
									<p>
										<span class="label round"><@spring.message code="label.use_ctrl_space_to_get_a_list_of_existing_players"/></span>
									</p>
								</#if>
							</div>
						</div>
						<div class="small-12 large-5 columns">
							<#assign isScoreUpdatableAttributes>
								<#if !score.updatable>
									disabled="disabled" readonly="readonly"
								</#if>
							</#assign>
							<#assign dateAttributes>class="datepicker" ${isScoreUpdatableAttributes}</#assign>
							<#assign timeAttributes>class="timepicker" ${isScoreUpdatableAttributes}</#assign>
							<div class="input text"><label for="date"><@spring.message code="label.date"/> (<@spring.message code="label.required"/>)</label><@spring.formInput "score.date", dateAttributes, "text"/></div>
							<div class="input text"><label for="time"><@spring.message code="label.time"/></label><@spring.formInput "score.time", timeAttributes, "text"/></div>
							<#assign label_comment_sample>class='autosize' placeholder='<@spring.message code="label.comment_sample"/>' cols='30' rows='6'</#assign>			
							<div class="input textarea"><label for="comment"><@spring.message code="label.private_comment"/></label><@spring.formTextarea "score.comment", label_comment_sample/></div>
							<br/>
							<#assign with100Attribute>style='width:100%' ${isScoreUpdatableAttributes}</#assign>
							<div class="input select">
								<label for="sportId"><@spring.message code="label.what_sport_do_you_intend_to_score" /></label>
								<#assign label_sport_tennis><@spring.message code="label.sport_tennis"/></#assign>
								<#assign label_sport_table_tennis><@spring.message code="label.sport_table_tennis"/></#assign>
								<#assign label_sport_badminton><@spring.message code="label.sport_badminton"/></#assign>
								<#assign label_sport_squash><@spring.message code="label.sport_squash"/></#assign>
								<#assign label_sport_beach_tennis><@spring.message code="label.sport_beach_tennis"/></#assign>
								<#assign label_sport_paddle><@spring.message code="label.sport_paddle"/></#assign>
								<#assign label_sport_other><@spring.message code="label.sport_other"/></#assign>
								<#assign sportsHash = {"0":label_sport_tennis, "1":label_sport_table_tennis, "2":label_sport_badminton, "3":label_sport_squash, "4":label_sport_beach_tennis, "5":label_sport_paddle, "6":label_sport_other} >
								<@spring.formSingleSelect "score.sportId", sportsHash, with100Attribute />
							</div>
							<br/>

							<div class="row collapse">
								<#assign label_on><@spring.message code="label.on"/></#assign>
								<#assign label_off><@spring.message code="label.off"/></#assign>
								<#assign onOffHash = {"true":label_on, "false":label_off} />
								<div class="small-2 large-2 columns">
									<a href="#" class="js-toggle-switch disabled"><img src="<@spring.url relativeUrl="/img/icons/facebook.png"/>" alt="" /></a>
									<div class="small-2 switch tiny disabled">
										<@spring.formRadioButtons "score.postInFacebook", onOffHash, "", "" />
										<span class="disabled"></span>
							        </div>
						     	</div>
						     	<#if facebookConnected>
							     	<div class="small-9 columns" id="facebook_panel_loading" style="display: none">
							     		<label><img src="<@spring.url relativeUrl="/img/loading.gif"/>" /><@spring.message code="label.loading_preview"/>...</label>
							     	</div>
							     	<div class="small-9 columns" id="facebook_panel_enabled" style="display: none">
							     	    <label><@spring.message code="label.facebook_this_is_the_preview_of_the_information_you_will_share_in_your_post"/>:</label>
							     	    <div id="facebook_post" style="border: 1px solid #DCDCDC; line-height: 26px; border-radius: 5px">
								     		<img src="#" id="graph"/>
								     		<h6 id="facebook_panel_title">-</h6>
								     		<h6 id="facebook_panel_subtitle">-</h6>
								     		<#assign socialMessageOpts>maxlength=45 placeholder="<@spring.message code="label.add_your_spice_to_the_post_here"/>"</#assign>
								     		<@spring.formInput "score.socialMessage", socialMessageOpts, "text"/>
							     	    </div>
							     	</div>
						     	<#else>
							     	<div class="small-9 columns" id="facebook_panel_disabled">
							     		<label><@spring.message code="label.facebook_disabled"/></label>
							     	</div>
						     	</#if>
							</div>
							<div class="row collapse">
						     	<div class="columns large-12">
						     		<br/>
									<a id="save" class="no-margin-top button button-primary right"><@spring.message code="label.save"/></a>
								</div>
							</div>
							<br/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

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
	$(function() {
		FacebookPreview.init("<@spring.url relativeUrl="/"/>", "<@spring.url relativeUrl="/"/>chart");
		<#if !facebookConnected>
		    $(':radio').attr('disabled', 'disabled');
		    $(':radio').attr('readonly', 'readonly');
		</#if>
		$('#postInFacebook0').click(function() {
			FacebookPreview.render();
		});
		$('#postInFacebook1').click(function() {
			$('#facebook_panel_enabled').hide(1000);
		});
		$('#sportId').select2({ minimumResultsForSearch: -1});
		$('.autosize').autosize({
			append : "\n"
		});
		$('.js-toggle-switch').click(function() {
			var campo = $(this).next().find('input:first').attr('name');
			$('input[name=' + campo + ']:not(:checked)').click();
			return false;
		});
		$('.datepicker').pickadate({
			format : '<@spring.message code="system.datepicker_date_format"/>'
		});
		$('.timepicker').pickatime({
			format : '<@spring.message code="system.datepicker_time_format"/>'
		});

		$("#set1Left,#set1Right,#set2Left,#set2Right,#set3Left,#set3Right,#set4Left,#set4Right,#set5Left,#set5Right").numeric({ decimal: false, negative: false });
		Sets.init("playersPane", "setsPane", "<@spring.message code="label.nth_set"/>", "<@spring.message code="label.set"/>", ${playersList}, "${associatedPlayer.name}", ${(score.updatable)?c});

		var newPlayerWizardOptions = {
			contextPath: "<@spring.url relativeUrl="/"/>",
			error_please_enter_some_text: "<@spring.message code="error.please_enter_some_text"/>",
			error_please_fill_at_least_one_field_for_search: "<@spring.message code="error.please_fill_at_least_one_field_for_search"/>",
			error_please_fill_out_all_fields: "<@spring.message code="error.please_fill_out_all_fields"/>",
			label_search_for: "<@spring.message code="label.search_for"/>",
			label_take_the_opportunity_to_invite: "<@spring.message code="label.take_the_opportunity_to_invite"/>",
			label_user_not_found: "<@spring.message code="label.user_not_found"/>",
			loggedUserAvatarHash: "${loggedUserAvatarHash}", 
			playersList: ${playersList}
		};
		NewPlayerWizard.init(newPlayerWizardOptions);

		<#if (score.id??)>
			$("#comment").focus();
		<#elseif (unusedPlayersList != '[]')>
			$("#playersRight").select2("open");
		</#if>
	});
</script>
<#if ((unusedPlayersList?? && unusedPlayersList == '[]') || !score.updatable)>
	<style>
			.select2-drop { display: none !important };
	</style>
</#if>