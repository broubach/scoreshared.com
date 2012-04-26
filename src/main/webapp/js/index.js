var SignupFlow = {
		onSignupDataPostSuccess: function(data) {
			if (data.errorMessage == undefined) {
				//proceed to captcha validation
				$.ajax({
					url: '/scoreshared/app/signup/captcha',
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
					url: '/scoreshared/app/signup/captcha',
					data: $('#captcha-form').serialize(), 
					type: 'POST',
					dataType: 'json',
					cache: false,
					success: SignupFlow.onSignupCaptchaPostSuccess
				});
			});
		},
		
		onSignupCaptchaPostSuccess: function() {
			window.location.href = '/scoreshared/app/welcome1';
		}
};