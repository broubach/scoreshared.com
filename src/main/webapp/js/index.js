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

			$('#signup #goBack').click(SignupFlow.backFromCaptcha);
		},

		onSignupCaptchaPostSuccess: function(data) {
			if (data.errorMessage == undefined) {
				window.location.href = '/scoreshared/app/welcome/step1';
			} else {
				$('#messageConsole').html(data.errorMessage);
			}
		},

		backFromCaptcha: function() {
			$.ajax({
				url: '/scoreshared/app/signup/data',
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
					url: '/scoreshared/app/signup/data',
					data: $('#signup-form').serialize(), 
					type: 'POST',
					dataType: 'json',
					cache: false,
					success: SignupFlow.onSignupDataPostSuccess
				});
			});
		}

};