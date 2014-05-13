<#import "/spring.ftl" as spring />

<div class="modal">
	<div class="row content">
		<div class="columns large-12">
			<form id="feedback-form" accept-charset="utf-8" class="no-margin-bottom">
				<h2><@spring.message code="label.we_would_love_to_hear_from_you"/></h2>
				<div id="feedback-panel" class="label radius" style="display: none"></div>
				<div class="input textarea">
					<label for="message"><@spring.message code="label.send_your_message"/></label>
					<textarea name="message" class="autosize" cols="30" rows="6" id="message"></textarea>
				</div>
				<div class="row content no-padding-bottom">
					<div class="columns small-12 direita">
						<div class="submit"><input class="button" id="send-feedback" value="<@spring.message code="label.send"/>" type="button"></div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$('#send-feedback').click(function(){
		$('#feedback-panel').css('display', 'block');
		if ($('#message').val().length <= 0) {
			$('#feedback-panel').addClass('alert');
			$('#feedback-panel').html('<@spring.message code="label.please_fill_in_the_field_with_a_message"/>');
			return false;
		}
		$('#feedback-panel').removeClass('alert');
		$('#feedback-panel').html('<@spring.message code="label.sending_please_wait"/>');
		$('#message').attr('readonly', '');
		$('#send-feedback').attr('disabled', '');
		$.ajax({
			url: '<@spring.url relativeUrl="/app/feedbackForm"/>',
			data: $('#feedback-form').serialize(),
			type: 'POST',
			dataType: 'json',
			cache: false,
			complete: function(data) {
				$('#feedback-panel').html('<@spring.message code="label.sent_thank_you_very_much_well_try_our_best_to_answer_your_message"/>');
				setTimeout(function() { $.magnificPopup.close(); }, 2500);
			}
		});

		return false;		
	});

	$('.autosize').autosize({append: "\n"});
</script>