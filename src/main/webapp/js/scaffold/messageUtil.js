var MessageUtil = {

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

				MessageUtil.pendingScoreApprovalsHandleClick(id, kind, userName, contextPath, labels);

			} else if (messageType == 'revision') {
				MessageUtil.pendingScoreRevisionsHandleClick(id, kind, '<@spring.url relativeUrl="/"/>');
			}
		});
	},

	pendingScoreApprovalsHandleClick: function(id, kind, userName, contextPath, labels) {
		var url = contextPath + '/app/' + kind + '/score/';
		if (kind != 'review') {
	    	$.ajax({
			    url: url,
			    type: 'POST',
			    data: {'scoreId': id},
			    dataType: 'json',
			    success: function() {
			    	ClickContext.tableLine.remove();
			    }
			});
	
		} else {
			ClickContext.currentId = id;
			ClickContext.currentUrl = url;
			$('#info').val(labels.label_send_a_message_to_asking_for_revision_1_send_a_message_to + userName + labels.label_send_a_message_to_asking_for_revision_2_asking_for_revision);
	        $("#dialog-revision").dialog("open");
	
		}
	},
	
	pendingScoreRevisionsHandleClick: function(id, kind, contextPath) {
		var url = contextPath + kind + '/revision/';

		if (kind != 'review') {
	    	$.ajax({
			    url: url,
			    type: 'POST',
			    data: {'playerPermissionId': id},
			    dataType: 'json',
			    success: function() {
			    	ClickContext.tableLine.remove();
			    }
			});

		} else {
			$('#scoreId').val(id);
			$('#review-form').submit();
		}
	}
};