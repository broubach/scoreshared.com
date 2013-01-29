<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
	<link type="text/css" href="<@spring.url relativeUrl="/css/le-frog/jquery-ui-1.9.2.custom.min.css"/>" rel="Stylesheet" />	
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.8.3.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-ui-1.9.2.custom.min.js"/>"></script>
	<script type="text/javascript" src="<@spring.url relativeUrl="/js/scaffold/friendRequestUtil.js"/>"></script>
</head>
<body>
	<img src="<@spring.url relativeUrl="/app/avatar?hash=${player.avatarHash}"/>">${player.user.fullName}
	<input type="button" id="sendMessage" value="<@spring.message code="label.send_message"/>"/>
	<#if player.connected>
		<input type="button" id="remove" value="<@spring.message code="label.remove_from_player_list"/>"/>
	<#elseif !player.invitationDate??>
		<input type="button" id="connect" value="<@spring.message code="label.connect"/>"/>
	</#if>
	<br>
	<div>
		<table>
			<thead>
				<tr>
					<th colspan="4"><@spring.message code="label.results"/></th>
				</tr>
			</thead>
			<tbody>
			<#list scores as item>
				<tr>
					<td>
						${item.dateTime}
					</td>
					<td>${item.detailText}</td>
					<td>
						<#assign avatarHash>${item.sampleOpponentAvatar}</#assign>
						<#if avatarHash?has_content>
							<img src="<@spring.url relativeUrl="/app/avatar?hash=${avatarHash}&small"/>"/>
						</#if>
					</td>
				</tr>
			</#list>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3"><a href="#">prev</a> <a href="#">next</a></td>
				</tr>
			</tfoot>
		</table>
		<img>
	</div>
	<div>
		<img src="<@spring.url relativeUrl="/app/stats/chart/${win}/${loss}"/>">
	</div>
	<div>
		<dl>
			<dt><@spring.message code="label.age" />:</dt>
			<dd>${player.age}</dd>
		</dl>
		<dl>
			<dt><@spring.message code="label.residence" />: </dt>
			<dd>${player.residence}</dd>
		</dl>
		<#if player.showContactInfoToFriends>
			<dl>
				<dt><@spring.message code="label.phone_number" />: </dt>
				<dd>${player.phoneNumber}</dd>
			</dl>
		</#if>
		<dl>
			<dt><@spring.message code="label.academy" />: </dt>
			<dd>${player.academy}</dd>
		</dl>
		<dl>
			<dt><@spring.message code="label.plays" />: </dt>
			<dd>${player.plays}</dd>
		</dl>
		<dl>
			<dt><@spring.message code="label.coach" />: </dt>
			<dd>${player.coach}</dd>
		</dl>
		<dl>
			<dt><@spring.message code="label.site" />: </dt>
			<dd>${player.site}</dd>
		</dl>
		<dl>
			<dt><@spring.message code="label.self_definition" />:</dt>
			<dd>${player.style}</dd>
		</dl>
	</div>

	<div id="dialog-confirm" title="<@spring.message code="label.confirmation"/>">
		<p><@spring.message code="label.the_association_with_this_player_will_be_deleted_are_you_sure" /></p>
	</div>

	<#include "dialogRegisteredInvitationSnippet.ftl">
</body>
</html>

<script type="text/javascript">
$(function() {
	$('#dialog-confirm').dialog({
        resizable: true,
        modal: true,
		autoOpen: false,
        buttons: {
            '<@spring.message code="label.yes"/>': function() {
        		$.ajax({
        			url: '<@spring.url relativeUrl="/app/player/remove/${player.user.id}" />',
        			type: 'DELETE',
					cache: false,
       			    success: function(result) {
       			    	$('#remove').after('<input type="button" id="connect" value="<@spring.message code="label.connect"/>">');
       			    	$('#remove').remove();
						$('#connect').click(function(e) {
							openFriendRequestDialog();
						});
       			    	$('#dialog-confirm').dialog("close");
       			    }
        		});
            },
            '<@spring.message code="label.no"/>': function() {
            	$('#dialog-confirm').dialog("close");
            }
        }
    });

	$( "#dialog-registeredInvitation" ).dialog({
        resizable: true,
		autoOpen: false,
		modal: true,
		buttons: {
			'<@spring.message code="label.yes"/>': function() {
				$.ajax({
					url: '<@spring.url relativeUrl="/app/player/connect/" />',
					data: $('#registeredInvitation-form').serialize(),
					type: 'POST',
					dataType: 'json',
					cache: false,
					success: function(data) {
		            	$('#dialog-registeredInvitation').dialog("close");
					}
				});
			},
			'<@spring.message code="label.no"/>': function() {
            	$('#dialog-registeredInvitation').dialog("close");
            }
		}
	});

	$('#remove').click(function(e) {
    	$('#dialog-confirm').dialog("open");
	});

	$('#connect').click(function(e) {
		openFriendRequestDialog();
	});
});

function openFriendRequestDialog() {
	<#if player.id??>
		$("#registeredInvitation-form input[name='playerId']").val(${player.id});
	</#if>

	$.ajax({
		url: '<@spring.url relativeUrl="/app/player/userInfo/${player.user.id}" />',
		type: 'GET',
		cache: false,
		success: function(data) {
			FriendRequestUtil.openFriendRequestDialog(data, '<@spring.url relativeUrl="/"/>', '${loggedUserAvatarHash}');
		}
	});
}

</script>