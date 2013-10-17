	<div id="dialog-revision" class="modal mfp-hide">
		<form id="revision-form">
			<div class="row content no-padding-bottom">
				<div class="columns small-10">
					<h2><@spring.message code="label.score_revision"/></h2>
					<p id="info"></p>
					<div class="error-panel label alert radius" style="display: none"></div>
				</div>
			</div>
			<div class="row content no-padding-top no-padding-bottom">
				<div class="columns small-10">
					<div class="input text"><label for="message"><@spring.message code="label.email"/></label><textarea id="message" name="message" class="autosize"></textarea></div>
				</div>
			</div>
			<div class="row content no-padding-top no-padding-bottom">
				<div class="columns large-10">
					<a class="button mfp-prevent-close" id="dialog-revision-cancel"><@spring.message code="label.cancel"/></a>
					<a class="button button-primary mfp-prevent-close" id="dialog-revision-send_request"><@spring.message code="label.send_request"/></a>
				</div>
			</div>
		</form>
	</div>

<script type="text/javascript">
	$("#dialog-revision-cancel").click(function() {
		$.magnificPopup.close();
	});

	$("#dialog-revision-send_request").click(function() {
		if ($.trim($("#revision-form textarea").val()) == "") {
			$("#revision-form .error-panel").css('display', 'block');
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
	            $.magnificPopup.close();
		    }
		});
	});

	$('.autosize').autosize({append: "\n"});
</script>