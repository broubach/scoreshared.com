	<div id="dialog-revision" style="display:none" title="<@spring.message code="label.score_revision"/>">
		<form id="revision-form">
			<p id="info"></p>
			<div class="error-panel"></div>
			<textarea id="message" name="message" ></textarea>
		</form>
	</div>

<script type="text/javascript">
	$( "#dialog-revision" ).dialog({
		autoOpen: false,
		modal: true,
		width:'auto',
		buttons: [{
			text: '<@spring.message code="label.send_request"/>',
			click: function() {
				if ($.trim($("#revision-form textarea").val()) == "") {
					$("#revision-form .error-panel").html('<@spring.message code="error.please_enter_some_text"/>');
					return;
				}

		    	$.ajax({
				    url: ClickContext.currentUrl,
				    type: 'POST',
				    data: {
				    	'scoreId': ClickContext.currentId,
				    	'message': $('#message').val()
				    },
				    dataType: 'json',
				    success: function() {
				    	ClickContext.tableLine.remove();
				        $("#dialog-revision").dialog("close");
				    }
				});
			}
		},{
			text: '<@spring.message code="label.cancel"/>',
			click: function() {
		        $("#dialog-revision").dialog("close");
			}
		}]
	});
</script>