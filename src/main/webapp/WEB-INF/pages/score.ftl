<#import "/spring.ftl" as spring />

<!DOCTYPE html>
	<head>
		<title><@spring.message code="label.scoreshared"/></title>
		<link type="text/css" href="<@spring.url relativeUrl="/css/le-frog/jquery-ui-1.8.17.custom.css"/>" rel="Stylesheet" />	
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.7.1.min.js"/>"></script>
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-ui-1.8.17.custom.min.js"/>"></script>
	</head>
	<body>
		<a href="<@spring.url relativeUrl="/j_spring_security_logout"/>">logout</a><br/>
		<form id="score-form" method="post" action="<@spring.url relativeUrl="/app/score"/>">
			<dl>
				<dt><label for="date"><@spring.message code="label.date"/></label></dt>
				<dd><@spring.formInput "score.date", "", "text"/> <@spring.formInput "score.time", "", "text"/></dd>
			</dl>
			<div id="playersPane">
				<@spring.formInput "score.playersLeft", "", "text"/> <@spring.formInput "score.playersRight", "", "text"/>
			</div>
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
			<dl>
				<dt><label for="comment"><@spring.message code="label.comment"/></label></dt>
				<dd><@spring.formTextarea "score.comment"/> <@spring.formCheckbox "score.private"/> <label for="private"><@spring.message code="label.private"/></label></dd>
			</dl>
			<@spring.formCheckbox "score.postInTwitter"/> <label for="postInTwitter"><@spring.message code="label.post_in_twitter"/></label>
			<@spring.formCheckbox "score.postInFacebook"/> <label for="postInFacebook"><@spring.message code="label.post_in_facebook"/></label>
			<input type="button" value="<@spring.message code="label.save"/>"/>
		</form>

		<div id="dialog-confirm" style="display:none"></div>

		<div id="dialog-search" title="<@spring.message code="label.association"/>">
			<form id="search-form">
				<@spring.formHiddenInput "search.playerNameInScore", "" />
				<dl>
					<dt><label for="name"><@spring.message code="label.email"/></label></dt>
					<dd><@spring.formInput "search.email", "", "text"/></dd>
				</dl>
				<@spring.message code="label.or"/>
				<hr/>
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
			</form>
		</div>

		<div id="dialog-friendRequest" title="<@spring.message code="label.association"/>">
			<form id="friendRequest-form">
				<input type="hidden" name="playerName" />
				<input type="hidden" name="email" />
				<dl id="requested">
					<dt></dt>
					<dd></dd>
				</dl>
				<dl id="requester">
					<dt><textarea name="message"></textarea></dt>
					<dd></dd>
				</dl>
			</form>
		</div>

		<div id="dialog-friendListRequest" title="<@spring.message code="label.association"/>" style="display: none">
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

		<div id="dialog-invitation" title="<@spring.message code="label.association"/>">
			<form id="invitation-form">
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
<script type="text/javascript" src="<@spring.url relativeUrl="/js/score.js?6"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/json2.js"/>"></script>
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
		label_yes: '<@spring.message code="label.yes"/>',
		label_no: '<@spring.message code="label.no"/>',
		label_associate: '<@spring.message code="label.associate"/>',
		label_send_request: '<@spring.message code="label.send_request"/>',
		label_invite: '<@spring.message code="label.invite"/>',
		label_user_not_found: '<@spring.message code="label.user_not_found"/>',
		label_take_the_opportunity_to_invite: '<@spring.message code="label.take_the_opportunity_to_invite"/>',
		label_back: '<@spring.message code="label.back" />',
		loggedUserAvatarUrl: '/loggedUser/avatar/url',
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
});

</script>