var ClickContext = {
		tableLine: {},
		id: '',
		kind: ''
};

var Scores = {
	options: {},

	initSearchBarBehavior: function() {
		$('#search-button,#radioAll,#radioWin,#radioLoss,#descendingByDate,#ascendingByDate').click(function(e){
			var searchTerm = $('#search-term').val();
			var outcome = $('input[name=scoreOutcomeFilter]:checked').val();
			var ascending = Scores.options.ascending;
			if (searchTerm) {
				document.location.href = Scores.options.context + 'app/scores/'+ 0 + '/' + searchTerm + "/" + outcome + "/" + ascending;
			} else {
				document.location.href = Scores.options.context + 'app/scores/'+ 0 + '/' + outcome + "/" + ascending;
			}
		});
	},

	initTableHoverBehavior: function() {
		$('.item-resultado').hover(function(){
			$(this).find('span.actions').fadeIn('fast');
		}, function(){
		$(this).find('span.actions').fadeOut();
		});
	},

	initDialogGeneral: function() {
		$('#dialog-general-confirm-yes').click(function(e) {
			if (ClickContext.kind == 'remove') {
				$.ajax({
					url: Scores.options.context + 'app/scores/remove/' + ClickContext.id,
					type: 'DELETE',
					dataType: 'json',
					cache: false,
					complete: function(data) {
						ClickContext.tableLine.remove();
						$.magnificPopup.close(); 
					}
				});
		
			} else if (ClickContext.kind == 'hide-permanently') {
				$.ajax({
					url: Scores.options.context + 'app/scores/hidePermanently',
					data: {'scoreId': ClickContext.id},
					type: 'POST',
					dataType: 'json',
					cache: false,
					complete: function(data) {
						ClickContext.tableLine.remove();
						$.magnificPopup.close();
					}
				});
			}
		});
	},

	initDialogsForward: function() {
		$('#dialog-forward-multiple-players_cancel,#dialog-forward-one-player_no').click(function() { $.magnificPopup.close(); });
		$('#dialog-forward-one-player_yes').click(function() {
			$.ajax({
				url: Scores.options.context + 'app/scores/forward',
				data: {'scoreId': ClickContext.id, 'newUserId': $('#forward-one-player_playerId').val()},
				type: 'POST',
				dataType: 'json',
				cache: false,
				complete: function(data) {
					$('#actions-column', ClickContext.tableLine).html('');
					$('#actions-column', ClickContext.tableLine).html(Scores.options.label_refresh_page_to_see_new_actions_available);
					$.magnificPopup.close();
				}
			});
		});

		$('#dialog-forward-multiple-players_forward').click(function() {
			$.ajax({
				url: Scores.options.context + 'app/scores/forward',
				data: {'scoreId': ClickContext.id, 'newUserId': $('#dialog-forward-multiple-players_selection option:selected').val()},
				type: 'POST',
				dataType: 'json',
				cache: false,
				complete: function(data) {
					$('#actions-column', ClickContext.tableLine).html('');
					$('#actions-column', ClickContext.tableLine).html(Scores.options.label_refresh_page_to_see_new_actions_available);
					$.magnificPopup.close();
				}
			});
		});
	},

	initTableClickBehavior: function() {
		$("td .actions a").click(function (e) {
			e.preventDefault();
			ClickContext.tableLine = $(this).closest("li");
			ClickContext.kind = $(this).attr('href').split(',')[0];
			ClickContext.id = $(this).attr('href').split(',')[1];
		
			if (ClickContext.kind == 'edit') {
				document.location.href = Scores.options.context + 'app/score/' + 
											ClickContext.id + '?postSaveUrl=' + 
											decodeURIComponent(document.location.href).substring(decodeURIComponent(document.location.href).lastIndexOf('app/'));
		
			} else if (ClickContext.kind == 'forward') {
				$.ajax({
					url: Scores.options.context + 'app/scores/playerInstancesForScore/' + ClickContext.id,
					type: 'GET',
					dataType: 'json',
					cache: false,
					success: function(data) {
						if (data.playerInstances.length == 1) {
							$('#forward-one-player_playerId').html(data.playerInstances[0][0]);
							$('#forward-one-player_playerName').html(data.playerInstances[0][1] + "?");
							$.magnificPopup.open({
								items : {
									src : '#dialog-forward-one-player',
									type : 'inline'
								}
							});
		
						} else if (data.playerInstances.length > 1) {
							$('#dialog-forward-multiple-players_selection').select2('destroy');
							$('#dialog-forward-multiple-players_selection').find('option').remove();
							for (var i=0; i<data.playerInstances.length; i++) {
								$('#dialog-forward-multiple-players_selection').append('<option value="'+data.playerInstances[i][0]+'">' + data.playerInstances[i][1] + '</option>');
							}
							$('#dialog-forward-multiple-players_selection').select2({minimumResultsForSearch: -1});
							$.magnificPopup.open({
								items : {
									src : '#dialog-forward-multiple-players',
									type : 'inline'
								}
							});
						}
					}
				});
		
			} else if (ClickContext.kind == 'remove') {
				$('#general-confirmation-question').html(Scores.options.label_confirm_score_removal);
				$.magnificPopup.open({
					items : {
						src : '#dialog-general-confirm',
						type : 'inline'
					}
				});
		
			} else if (ClickContext.kind == 'hide-permanently') {
				$('#general-confirmation-question').html(Scores.options.label_confirm_to_hide_score_permanently);
				$.magnificPopup.open({
					items : {
						src : '#dialog-general-confirm',
						type : 'inline'
					}
				});
			}
		});
	},
	
	initStats: function() {
		var ctx = $("#estatistica-jogos").get(0).getContext("2d");
		var data = [
			{
				value: Scores.options.win,
				color:"#d35400"
			},
			{
				value : Scores.options.loss,
				color : "#e67e22"
			}
		];
		var options = {
			//Boolean - Whether we should show a stroke on each segment
			segmentShowStroke : true,

			//String - The colour of each segment stroke
			segmentStrokeColor : "rgba(250, 250, 250, .2)",

			//Number - The width of each segment stroke
			segmentStrokeWidth : 4,

			//Boolean - Whether we should animate the chart	
			animation : true,

			//Number - Amount of animation steps
			animationSteps : 100,

			//String - Animation easing effect
			animationEasing : "easeOutBounce",

			//Boolean - Whether we animate the rotation of the Pie
			animateRotate : true,

			//Boolean - Whether we animate scaling the Pie from the centre
			animateScale : true,

			//Function - Will fire on animation completion.
			onAnimationComplete : null
		}
		$("#estatistica-jogos").attr('width',$("#estatistica-jogos").parent().width());
		var chart = new Chart(ctx).Pie(data,options);
	},

	init: function(options) {
		Scores.options = options;

		Scores.initTableClickBehavior();

		Scores.initSearchBarBehavior();

		Scores.initDialogGeneral();

		Scores.initDialogsForward();

		Scores.initTableHoverBehavior();

		Scores.initStats();
	}
};