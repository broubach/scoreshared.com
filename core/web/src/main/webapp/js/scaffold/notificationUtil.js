var NotificationUtil = {

	addClickBehaviorToMessagesList: function(selector, contextPath, labels) {
		$(selector).click(function (e) {
			if ($(this).attr('href').indexOf(',') == -1) {
				return;
			}

			e.preventDefault();
			ClickContext.tableLine = $(this).parent();
			var messageType = $(this).attr('href').split(',')[0];
			var kind = $(this).attr('href').split(',')[1];
			var id = $(this).attr('href').split(',')[2];
			if (messageType == 'contact') {
				var url = contextPath + "app/" + kind + '/invitation/';

		    	$.ajax({
				    url: url,
				    type: 'POST',
				    data: {'user2Id': id},
				    dataType: 'json',
				    success: function() {
				    	ClickContext.tableLine.remove();
				    }
				});

			} else if (messageType == 'approval') {
				var userName;
				if (kind == 'review') {
					userName = $(this).attr('href').split(',')[3];
				}

				NotificationUtil.pendingScoreApprovalsHandleClick(id, kind, userName, contextPath, labels);

			} else if (messageType == 'revision') {
				NotificationUtil.pendingScoreRevisionsHandleClick(id, kind, '<@spring.url relativeUrl="/"/>');
			}
		});
	},

	pendingScoreApprovalsHandleClick: function(id, kind, userName, contextPath, labels) {
		var url = contextPath + 'app/' + kind + '/score/';
		if (kind != 'review') {
	    	$.ajax({
			    url: url,
			    type: 'POST',
			    data: {'scoreId': id},
			    dataType: 'json',
			    complete: function() {
			    	ClickContext.tableLine.remove();
			    }
			});
	
		} else {
	    	ClickContext.currentId = id;
			ClickContext.currentUrl = url;

			$.ajax({
			    url: url,
			    type: 'GET',
			    data: {'scoreId': id},
			    dataType: 'json',
				cache: false,
			    success: function(data) {
			    	$('#scoreId').val(data.scoreId);
			    	$('#playersLeft').text(data.playersLeft);
			    	$('#playersRight').text(data.playersRight);
			    	$('#sets').val(data.sets);
			    	$('#date').val(data.date);
			    	$('#time').val(data.time);
			    	$('#message').val(data.message);

			        $.magnificPopup.open({
						items : {
							src : '#dialog-revision',
							type : 'inline'
						},
						callbacks: {
							close: function() {
								$("#revision-form .error-panel").css('display', 'none');
							}
						}
					});
			    }
			});
		}
	},

	pendingScoreRevisionsHandleClick: function(scoreId, playerInstanceId, kind, contextPath) {
		var url = contextPath + 'app/' + kind + '/revision/';

    	$.ajax({
		    url: url,
		    type: 'POST',
		    data: {'scoreId': scoreId, 'playerInstanceId': playerInstanceId},
		    dataType: 'json',
		    complete: function() {
		    	ClickContext.tableLine.remove();
		    }
		});
	}
};