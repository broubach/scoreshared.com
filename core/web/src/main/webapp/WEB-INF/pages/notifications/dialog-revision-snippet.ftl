	<div id="dialog-revision" class="modal mfp-hide" style="max-width: 800px">
		<form id="revision-form">
			<input type="hidden" id="scoreId" name="scoreId"/>
			<div class="row content no-padding-bottom">
				<div class="columns small-12">
					<h2><@spring.message code="label.score_revision"/></h2>
					<p id="info"></p>
					<div class="error-panel label alert radius" style="display: none"></div>
				</div>
			</div>
			<div class="row content no-padding-top no-padding-bottom">
				<div class="columns small-3">
					<div class="input text"><input type="text" placeholder="<@spring.message code="system.date_format_ui"/>" id="date" name="date" maxlength="10"/> <input type="text" placeholder="<@spring.message code="system.time_format_ui"/>" id="time" name="time" maxlength="5"/></div>
				</div>
				<div class="columns small-3 direita">
					<div class="input text"><label id="playersLeft" for="sets"></label></div>
				</div>
				<div class="columns small-3">
					<div class="input text"><input type="text" placeholder="<@spring.message code="label.ie_sets"/>" id="sets" name="sets" maxlength="19"/></div>
				</div>
				<div class="columns small-3">
					<div class="input text"><label id="playersRight" for="sets"></label></div>
				</div>
			</div>
			<div class="row content no-padding-top no-padding-bottom">
				<div class="columns small-12">
					<div class="input text"><label for="message"><@spring.message code="label.message"/><textarea id="message" name="message" placeholder="<@spring.message code="label.just_updated_the_score_please_take_a_look"/>" maxlength="2000" class="autosize"></textarea></label></div>
				</div>
			</div>
			<div class="row content no-padding-top no-padding-bottom">
				<div class="columns small-12 direita">
					<a class="button mfp-prevent-close" id="dialog-revision-cancel"><@spring.message code="label.cancel"/></a>
					<a class="button button-primary mfp-prevent-close" id="dialog-revision-send_request"><@spring.message code="label.send_request"/></a>
				</div>
			</div>
		</form>
	</div>

<script type="text/javascript">
	$(function() {
		$("#date").mask("99/99/9999");
		$("#time").mask("99:99");
	 	$('.autosize').autosize({append: "\n"});
	 	$("#dialog-revision-cancel").click(function() {
			$.magnificPopup.close();
		});

		$("#dialog-revision-send_request").click(function() {
			if ($.trim($("#date").val()) == "" || $.trim($("#sets").val()) == "") {
				$("#revision-form .error-panel").css('display', 'block');
				$("#revision-form .error-panel").html('<@spring.message code="error.please_fill_in_at_least_date_and_sets"/>');
				return;
			}

		  	$.ajax({
			    url: ClickContext.currentUrl,
			    type: 'POST',
			    data: {
			    	'scoreId': ClickContext.currentId,
			    	'date': $('#date').val(),
			    	'time': $('#time').val(),
			    	'sets': $('#sets').val(),
			    	'message': $('#message').val()
			    },
			    dataType: 'json',
			    success: function(data) {
			    	if (data.errorMessage == undefined) {
				    	ClickContext.tableLine.remove();
			            $.magnificPopup.close();
			    	} else {
			    		$('.error-panel').html(data.errorMessage);
			    		$('.error-panel').css('display', 'block');
			    	}
			    }
			});
		});
	});
</script>