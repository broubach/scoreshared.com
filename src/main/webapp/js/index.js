var SignupFlow = {
		onSuccessResponse: function(data) {
			if (data.errorMessage == undefined) {
				$('#messageConsole').text('success!');
			} else {
				$('#messageConsole').text(data.errorMessage);
			}
		}
};
