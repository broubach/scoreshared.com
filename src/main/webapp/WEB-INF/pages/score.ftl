<#import "/spring.ftl" as spring />

<!DOCTYPE html>
	<head>
		<title><@spring.message code="label.scoreshared"/></title>
		<link type="text/css" href="<@spring.url relativeUrl="/css/score.css"/>" rel="Stylesheet" />	
		<link type="text/css" href="<@spring.url relativeUrl="/css/le-frog/jquery-ui-1.9.2.custom.min.css"/>" rel="Stylesheet" />	
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.8.3.min.js"/>"></script>
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-ui-1.9.2.custom.min.js"/>"></script>
	</head>
	<body>
		<a href="<@spring.url relativeUrl="/j_spring_security_logout"/>">logout</a><br/>
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
        
   		<form id="score-form" method="post" action="<@spring.url relativeUrl="/app/score"/>">
			<@spring.formHiddenInput "score.commentId", ""/>
			<@spring.formHiddenInput "score.id", ""/>
			<@spring.formHiddenInput "score.newPlayersNotToBeRemembered", ""/>
   			<div>
				<dl id="playersPane">
					<dl>
						<dt><label for="playersLeft"><@spring.message code="label.players"/></label></dt>
						<dd><@spring.formInput "score.playersLeft", "", "text"/> x <@spring.formInput "score.playersRight", "", "text"/></dd>
					</dl>
				</dl>
				<dl id="setsPane">
					<dt><label for="set1Left"></label></dt>
					<dd><@spring.formInput "score.set1Left", "", "text"/> <@spring.formInput "score.set1Right", "", "text"/> <a href="javascript:Sets.increase();">+ <@spring.message code="label.set"/></a></dd>
				</dl>
				<#list 2..5 as i>
					<#if !(score.sets['"set"+i+"Left"'?eval]??)><#break></#if>
					<dl id="setsPane${i}">
						<dt><label for="set${i}Left"></label></dt>
						<dd><@spring.formInput "score.set${i}Left", "", "text"/> <@spring.formInput "score.set${i}Right", "", "text"/> <a href="javascript:Sets.increase();">+ <@spring.message code="label.set"/></a></dd>
					</dl>
				</#list>
			</div>
			<div>
				<dl>
					<dt><label for="date"><@spring.message code="label.date"/></label></dt>
					<dd><@spring.formInput "score.date", "", "text"/> <@spring.formInput "score.time", "", "text"/></dd>
				</dl>
				<dl>
					<dt><label for="comment"><@spring.message code="label.private_comment"/></label></dt>
					<dd>
						<@spring.formTextarea "score.comment"/>
						<dl>
							<dt><@spring.message code="label.share_the_comment_with_your_coach"/></dt>
							<dd><@spring.formInput "score.coach", "", "text" /></dd>
						</dl>
					</dd>
				</dl>
				<dl>
					<dt><@spring.message code="label.what_sport_is_this_score_for" /></dt>
					<dd>
						<#assign label_sport_tennis><@spring.message code="label.sport_tennis"/></#assign>
						<#assign label_sport_table_tennis><@spring.message code="label.sport_table_tennis"/></#assign>
						<#assign label_sport_badminton><@spring.message code="label.sport_badminton"/></#assign>
						<#assign label_sport_squash><@spring.message code="label.sport_squash"/></#assign>
						<#assign label_sport_beach_tennis><@spring.message code="label.sport_beach_tennis"/></#assign>
						<#assign label_sport_paddle><@spring.message code="label.sport_paddle"/></#assign>
						<#assign label_sport_other><@spring.message code="label.sport_other"/></#assign>
						<#assign sportsHash = {"0":label_sport_tennis, "1":label_sport_table_tennis, "2":label_sport_badminton, "3":label_sport_squash, "4":label_sport_beach_tennis, "5":label_sport_paddle, "6":label_sport_other} >
						<@spring.formSingleSelect "score.sportId", sportsHash, "" />
					</dd>
				</dl>
			</div>
			<div>
				<@spring.formCheckbox "score.postInTwitter"/> <label for="postInTwitter"><@spring.message code="label.post_in_twitter"/></label>
				<@spring.formCheckbox "score.postInFacebook"/> <label for="postInFacebook"><@spring.message code="label.post_in_facebook"/></label>
				<input type="button" id="save" value="<@spring.message code="label.save"/>"/>
			</div>
		</form>

		<div id="dialog-confirm" style="display:none" title="<@spring.message code="label.confirmation"/>">
			<p id="confirmation-question"></p>
			<label><input type="checkbox"/><@spring.message code="label.dont_ask_again_for_this_player"/></label>
		</div>

		<div id="dialog-search" title="<@spring.message code="label.invitation"/>">
			<form id="search-form">
				<p id="search-for-username"></p>
				<div class="error-panel"></div>
				<@spring.formHiddenInput "search.playerNameInScore", "" />
				<dl>
					<dt><label for="name"><@spring.message code="label.first_name"/></label></dt>
					<dd><@spring.formInput "search.firstName", "", "text"/></dd>
				</dl>
				<dl>
					<dt><label for="name"><@spring.message code="label.last_name"/></label></dt>
					<dd><@spring.formInput "search.lastName", "", "text"/></dd>
				</dl>
				<dl>
					<dt><label for="name"><@spring.message code="label.city"/></label></dt>
					<dd><@spring.formInput "search.city", "", "text"/></dd>
				</dl>
				<dl>
					<dt><label for="name"><@spring.message code="label.country"/></label></dt>
					<dd><@spring.formInput "search.country", "", "text"/></dd>
				</dl>
				<@spring.message code="label.or"/>
				<hr/>
				<dl>
					<dt><label for="name"><@spring.message code="label.email"/></label></dt>
					<dd><@spring.formInput "search.email", "", "text"/></dd>
				</dl>
			</form>
		</div>

		<div id="dialog-choosePlayerFromList" title="<@spring.message code="label.invitation"/>" style="display: none">
			<@spring.message code="label.select_a_player"/>
			<table>
			<thead>
			<tr>
				<td></td><td><@spring.message code="label.name"/></td><td><@spring.message code="label.location"/></td>
			</tr>
			</thead>
			<tbody>
			</tbody>
			</table>
		</div>

		<#include "dialogRegisteredInvitationSnippet.ftl">

		<div id="dialog-unregisteredInvitation" title="<@spring.message code="label.invitation"/>">
			<div class="error-panel"></div>
			<form id="unregisteredInvitation-form">
				<input type="hidden" name="playerName" />
				<dl>
					<dt></dt>
					<dd><textarea id="message" name="message" ></textarea></dd>
				</dl>
				<dl>
					<dt><@spring.message code="label.email"/></dt>
					<dd><input type="text" name="email"></input></dd>
				</dl>
			</form>
		</div>

	</body>
</html>

<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery.numeric.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery.maskedinput-1.3.min.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/steps.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/score.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/json2.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/scaffold/friendRequestUtil.js"/>"></script>
<script type="text/javascript">
function split( val ) {
	return val.split( /,\s*/ );
}
function extractLast( term ) {
	return split( term ).pop();
}

$(function() {
	$("#set1Left,#set1Right,#set2Left,#set2Right,#set3Left,#set3Right,#set4Left,#set4Right,#set5Left,#set5Right").numeric({ decimal: false, negative: false });
	$("#time").mask("99:99");
	$("#date").datepicker({dateFormat: '<@spring.message code="label.datepicker_date_format"/>'});
	Sets.init("playersPane", "setsPane", "<@spring.message code="label.nth_set"/>", "<@spring.message code="label.set"/>");

	var newPlayerWizardOptions = {
		contextPath: '<@spring.url relativeUrl="/"/>',
		error_please_enter_some_text: '<@spring.message code="error.please_enter_some_text"/>',
		error_please_fill_at_least_one_field_for_search: '<@spring.message code="error.please_fill_at_least_one_field_for_search"/>',
		error_please_fill_out_all_fields: '<@spring.message code="error.please_fill_out_all_fields"/>',
		label_back: '<@spring.message code="label.back" />',
		label_invite: '<@spring.message code="label.invite"/>',
		label_save_without_invitation: '<@spring.message code="label.save_without_invitation"/>',
		label_search_for: '<@spring.message code="label.search_for"/>',
		label_send_invitation: '<@spring.message code="label.send_invitation"/>',
		label_take_the_opportunity_to_invite: '<@spring.message code="label.take_the_opportunity_to_invite"/>',
		label_user_not_found: '<@spring.message code="label.user_not_found"/>',
		label_yes: '<@spring.message code="label.yes"/>',
		loggedUserAvatarHash: '${loggedUserAvatarHash}', 
		playersList: ${playersList}
	};
	NewPlayerWizard.init(newPlayerWizardOptions);
	
	$( "#playersLeft,#playersRight" ).bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
		})
		.autocomplete({
			minLength: 0,
			source: function( request, response ) {
				// delegate back to autocomplete, but extract the last term
				response( $.ui.autocomplete.filter(
					${playersList}, extractLast( request.term ) ) );
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			},
			select: function( event, ui ) {
				var terms = split( this.value );
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push( ui.item.value );
				// add placeholder to get the comma-and-space at the end
				terms.push( "" );
				this.value = terms.join( ", " );
				return false;
			}
		});

	$("#playersRight").focus();

	$( "#coach" ).autocomplete({
		source: ${playersList}
	});
});

</script>