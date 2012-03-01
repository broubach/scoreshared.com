<#import "/spring.ftl" as spring />

<html>
	<head>
		<title><@spring.message code="label.scoreshared"/></title>
		<link type="text/css" href="<@spring.url relativeUrl="/css/le-frog/jquery-ui-1.8.17.custom.css"/>" rel="Stylesheet" />	
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.7.1.min.js"/>"></script>
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-ui-1.8.17.custom.min.js"/>"></script>
	</head>
	<body>
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
				<dl id="requested">
					<dt></dt>
					<dd></dd>
				</dl>
				<dl>
					<dt><textarea id="message"></textarea></dt>
					<dd></dd>
				</dl>
			</form>
		</div>

		<div id="dialog-invitation" title="<@spring.message code="label.association"/>">
			<form id="invitation-form">
				<dl>
					<dt></dt>
					<dd><textarea id="message"></textarea></dd>
				</dl>
			</form>
		</div>

	</body>
</html>

<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery.numeric.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery.maskedinput-1.3.min.js"/>"></script>
<script type="text/javascript" src="<@spring.url relativeUrl="/js/score.js"/>"></script>
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
	$(':button').click(function() {
		NewPlayerWizzard.init($("#playersLeft").val() + ',' + $("#playersRight").val(), '<@spring.url relativeUrl="/"/>','<@spring.message code="label.yes"/>', '<@spring.message code="label.no"/>');
	});

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
					playersList, extractLast( request.term ) ) );
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

	$( "#dialog-search" ).dialog({
		autoOpen: false,
		height: 300,
		width: 350,
		modal: true,
		open: function() {
			$('#search-form input').val('');
		},
		close : function() {
			if (!NewPlayerWizzard.stepSucceeded) {
				NewPlayerWizzard.startForCurrentPlayer();
			} else {
				NewPlayerWizzard.stepSucceeded = false;
			}
		},
		buttons: [{
			text: "<@spring.message code="label.associate"/>",
			click: function() {
				NewPlayerWizzard.stepSucceeded = true;
				$.ajax({
					url: NewPlayerWizzard.contextPath+"/app/score/searchNewUser",
					data: $('#search-form').serialize(), 
					type: 'POST',
					dataType: 'json',
					cache: false,
					success: NewPlayerWizzard.step3
				});
			}
		}]
	});		

	$( "#dialog-friendRequest" ).dialog({
		autoOpen: false,
		height: 300,
		width: 350,
		modal: true,
		close : function() {
			if (!NewPlayerWizzard.stepSucceeded) {
				NewPlayerWizzard.startForCurrentPlayer();
			} else {
				NewPlayerWizzard.stepSucceeded = false;
			}
		},
		buttons: [{
			text: "<@spring.message code="label.associate"/>",
			click: function() {
				NewPlayerWizzard.stepSucceeded = true;
				$.ajax({
					url: NewPlayerWizzard.contextPath+"/app/score/newFriendRequest",
					data: $('#friendRequest-form').serialize(), 
					type: 'POST',
					dataType: 'json',
					cache: false,
					success: NewPlayerWizzard.step4a
				});
			}
		}]
	});

	$( "#dialog-invitation" ).dialog({
		autoOpen: false,
		height: 300,
		width: 350,
		modal: true,
		close : function() {
			if (!NewPlayerWizzard.stepSucceeded) {
				NewPlayerWizzard.startForCurrentPlayer();
			} else {
				NewPlayerWizzard.stepSucceeded = false;
			}
		},
		buttons: [{
			text: "<@spring.message code="label.associate"/>",
			click: function() {
				NewPlayerWizzard.stepSucceeded = true;
				$.ajax({
					url: NewPlayerWizzard.contextPath+"/app/score/newInvitation",
					data: $('#invitation-form').serialize(), 
					type: 'POST',
					dataType: 'json',
					cache: false,
					success: NewPlayerWizzard.step4b
				});
			}
		}]
	});		
});

</script>