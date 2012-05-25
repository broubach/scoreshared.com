var SignupFlow = {
		context: '',
		init: function(context) {
			SignupFlow.context = context;
		},
		
		onSignupDataPostSuccess: function(data) {
			if (data.errorMessage == undefined) {
				//proceed to captcha validation
				$.ajax({
					url: SignupFlow.context + '/app/signup/captcha',
					type: 'GET',
					success: SignupFlow.onSignupCaptchaGetSuccess
				});

			} else {
				if (data.errorMessage instanceof Array) {
					$('#messageConsole').text("");
					for (var i = 0; i<data.errorMessage.length; i++) {
						$('#messageConsole').append(data.errorMessage[i] + '<br/>');
					}
				} else {
					$('#messageConsole').html(data.errorMessage);
				}
			}
		},

		onSignupCaptchaGetSuccess: function(data) {
			$('#signup').html(data);

			$('#captcha-form button').click(function() {
				$.ajax({
					url: SignupFlow.context + '/app/signup/captcha',
					data: $('#captcha-form').serialize(), 
					type: 'POST',
					dataType: 'json',
					cache: false,
					success: SignupFlow.onSignupCaptchaPostSuccess
				});
			});

			$('#refreshCaptcha').click(function() {
				$('#captcha').attr('src', SignupFlow.context + '/app/captcha?' + (new Date()).getTime());
			});

			$('#signup #goBack').click(SignupFlow.backFromCaptcha);
		},

		onSignupCaptchaPostSuccess: function(data) {
			if (data.errorMessage == undefined) {
				window.location.href = SignupFlow.context + '/app/welcome/step1';
			} else {
				$('#messageConsole').html(data.errorMessage);
			}
		},

		backFromCaptcha: function() {
			$.ajax({
				url: SignupFlow.context + '/app/signup/data',
				type: 'GET',
				success: SignupFlow.onSignupDataGetSuccess
			});
		},

		onSignupDataGetSuccess: function(data) {
			$('#signup').html(data);
			
			SignupFlow.bindSignupDataPost();
		},
		
		bindSignupDataPost: function() {
			$('#signup-form button').click(function() {
				$.ajax({
					url: SignupFlow.context + '/app/signup/data',
					data: $('#signup-form').serialize(), 
					type: 'POST',
					dataType: 'json',
					cache: false,
					success: SignupFlow.onSignupDataPostSuccess
				});
			});
		}
};