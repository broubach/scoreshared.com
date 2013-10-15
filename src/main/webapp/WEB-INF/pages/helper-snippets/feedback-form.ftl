<div class="modal">
	<div class="row content">
		<div class="columns large-10">
			<div style="display:none;"><input name="_method" value="POST" type="hidden"></div>
			<h2>We would love to hear from you!</h2>
			<div class="input textarea">
				<label for="FeedbackMessage">Send your message</label>
				<textarea name="data[Feedback][message]" class="autosize" cols="30" rows="6" id="FeedbackMessage"></textarea>
			</div>
			<div class="submit"><input class="button" id="send-feedback" value="Send" type="submit"></div>
		</div>
	</div>
</div>
<script>
	$('#send-feedback').click(function(){
		$.magnificPopup.close();
		return false;		
	});

	// Define o textarea com autosize
	$('.autosize').autosize({append: "\n"});
</script>