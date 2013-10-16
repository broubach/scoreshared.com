<#import "/spring.ftl" as spring />

<div class="modal">
	<div class="row content">
		<div class="columns large-10">
			<form id="feedback-form" accept-charset="utf-8">
				<h2><@spring.message code="label.we_would_love_to_hear_from_you"/></h2>
				<div class="input textarea">
					<label for="FeedbackMessage"><@spring.message code="label.send_your_message"/></label>
					<textarea name="message" class="autosize" cols="30" rows="6" id="message"></textarea>
				</div>
				<div class="submit"><input class="button" id="send-feedback" value="<@spring.message code="label.send"/>" type="button"></div>
			</form>
		</div>
	</div>
</div>

<script>
	$('#send-feedback').click(function(){
		$.ajax({
			url: '<@spring.url relativeUrl="/app/feedbackForm"/>',
			data: $('#feedback-form').serialize(),
			type: 'POST',
			dataType: 'json',
			cache: false,
			complete: function(data) {
				$.magnificPopup.close();
			}
		});

		return false;		
	});

	$('.autosize').autosize({append: "\n"});
</script>