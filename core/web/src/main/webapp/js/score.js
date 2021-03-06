var Sets = {
	MAX: 5,
	playersPane: "",
	setsPane: "",
	nthSetLabel: "",
	setLabel: "",
	playersList: [],
	loggedUserPlayerName: "",
	count: 1,

	init: function(playersPane, setsPane, nthSetLabel, setLabel, playersList, loggedUserPlayerName, isScoreUpdatable) {
		Sets.playersPane = playersPane;
		Sets.setsPane = setsPane;
		Sets.nthSetLabel = nthSetLabel;
		Sets.setLabel = setLabel;
		Sets.playersList = playersList;
		Sets.loggedUserPlayerName = loggedUserPlayerName;
		Sets.isScoreUpdatable = isScoreUpdatable;
		$('label', document.getElementById(Sets.setsPane)).append(Sets.count + Sets.nthSetLabel);
		$('input', document.getElementById(Sets.setsPane)).blur(Sets.switchSidesIfNeeded);
		Sets.updateAllSetsInfo();
		Sets.switchSidesIfNeeded();
		Sets.initDropDown();
	},

	initDropDown: function() {
		$("#playersLeft,#playersRight").select2({
			multiple : true,
			tags: true,
			tokenSeparators: [","],
			selectOnBlur: function() {
				return $('.select2-input.select2-focused').val().length > 0;
			},
			query : function(query) {
				var data = { results : [] };

				$.each(Sets.playersList, function() {
					 if (query.term.length == 0 || this.toUpperCase().indexOf(query.term.toUpperCase()) >= 0) {
						 data.results.push({id: this, text: this });
					 }
				});

				query.callback(data);
			},
		    initSelection : function (element, callback) {
		        var data = [];
		        $(ProvidePlayerListStep.createList(element.val())).each(function () {
		        	var isLocked = false;
		        	if (Sets.loggedUserPlayerName.toUpperCase() == this.playerName.toUpperCase() || !Sets.isScoreUpdatable) {
		        		isLocked = true;
		        	}
		            data.push({id: this.playerName, text: this.playerName, locked: isLocked});
		        });
		        callback(data);
		    },
		    createSearchChoice : function(term, data) {
		    	if ($(data).filter(function() {
		    		  return this.text.localeCompare(term)===0;
		    		}).length===0) {
		    		return {id:term, text:term};
		    	}
		    }
		});
		$("#playersLeft,#playersRight").select2("readonly", !Sets.isScoreUpdatable);
	},
	
	destroyDropDown: function() {
		$('#playersLeft,#playersRight').select2("destroy");
	},

	increase: function() {
		if (Sets.count < Sets.MAX) {
			Sets.count++;
			var newSet = $(document.getElementById(Sets.setsPane)).clone();
			newSet.attr('id', Sets.setsPane + Sets.count);
			$('input', newSet).val('');
			var prevSet = $(document.getElementById(Sets.setsPane));
			for (var i = 2; i < Sets.count; i++) {
				prevSet = prevSet.next();
			}
			prevSet.after(newSet);
			Sets.updateAllSetsInfo();
		}
	},

	deleteY: function(y) {
		if (y > 0 && y <= Sets.count && Sets.count > 1) {
			if (y <= 1) {
				$(document.getElementById(Sets.setsPane)).remove();
			} else {
				$(document.getElementById(Sets.setsPane + y)).remove();
			}
			Sets.count--;
			Sets.updateAllSetsInfo();
		}
	},

	updateAllSetsInfo: function() {
		var sets = Sets.getAllSets();
		Sets.count = sets.length;
		var jSet = $(sets[0]);
		jSet.attr('id', Sets.setsPane);
		Sets.decorate(jSet, 1);
		for (var i = 2; i <= Sets.MAX && (i-1) < sets.length; i++) {
			jSet = $(sets[i-1]);
			jSet.attr('id', Sets.setsPane + i);
			Sets.decorate(jSet, i);
		}
	},

	getAllSets: function() {
		var sets = [];
		var curSet = document.getElementById(Sets.setsPane);
		if (curSet) {
			sets.push(curSet);
		}

		for (var i = 2; i <= Sets.MAX; i++) {
			curSet = document.getElementById(Sets.setsPane + i);
			if (curSet) {
				sets.push(curSet);
			}
		}

		return sets;
	},

	decorate: function(set, nr) {
		$('label', set).text(nr + Sets.nthSetLabel);
		$('label', set).attr('for', 'set' + nr + 'Left');
		$($('input', set).get(0)).attr('id', 'set' + nr + 'Left');
		$($('input', set).get(0)).attr('name', 'set' + nr + 'Left');
		$($('input', set).get(1)).attr('id', 'set' + nr + 'Right');
		$($('input', set).get(1)).attr('name', 'set' + nr + 'Right');
		$('input', set).blur(Sets.switchSidesIfNeeded);

		$('div a', set).attr('href', 'javascript:Sets.deleteY('+nr+');');
	},

	switchSidesIfNeeded: function() {
		var winner = Sets.calculateWinner();
		// if there's winner and if side switch needed
		if (winner == 1) {
			Sets.switchSides();
		}
	},

	// returns -1: left; 0: no winner; 1: right
	calculateWinner: function() {
		var leftTotal = 0;
		var rightTotal = 0;
		var leftVal;
		var rightVal;
		var sets = Sets.getAllSets();
		for (var i = 0; i< sets.length; i++) {
			// calculate winner for each
			leftVal = $('#set' + (i + 1) + 'Left', sets[i]).val();
			rightVal = $('#set' + (i + 1) + 'Right', sets[i]).val();
			if (leftVal != '' && rightVal != '' && parseInt(leftVal) > parseInt(rightVal)) {
				leftTotal++;
			} else if (leftVal != '' && rightVal != '' && parseInt(rightVal) > parseInt(leftVal)) {
				rightTotal++;
			} else if (leftVal != '' && rightVal == '') {
				leftTotal++;
			} else if (rightVal != '' && leftVal == '') {
				rightTotal++;
			}
		}

		// finally decide winner
		if (leftTotal > rightTotal) {
			return -1;
		} else if (rightTotal > leftTotal) {
			return 1;
		}
		return 0;
	},

	switchSides: function() {
		var sets = Sets.getAllSets();
		var aux;
		for (var i = 0; i< sets.length; i++) {
			aux = $('input:first', sets[i]).val();
			$('input:first', sets[i]).val($('input:eq(1)', sets[i]).val());
			$('input:eq(1)', sets[i]).val(aux);
		}

		Sets.destroyDropDown();

		aux = $('#playersLeft').val();
		$('#playersLeft').val($('#playersRight').val());
		$('#playersRight').val(aux);
		
		Sets.initDropDown();
	}
};

var NewPlayerWizard = {
	context: {
		options: {},
		players: [],
		currentPlayer: 0,
		currentPlayerId: undefined
	},
	steps: {},
	nextStep: '',
	breadCrumb: [],

	applyDefaults: function(options){
		options['contextPath'] = (options['contextPath'] == undefined ? '/webapp/' : options['contextPath']);
		options['error_please_enter_some_text'] = (options['error_please_enter_some_text'] == undefined ? 'please enter some text' : options['error_please_enter_some_text']);
		options['error_please_fill_at_least_one_field_for_search'] = (options['error_please_fill_at_least_one_field_for_search'] == undefined ? 'please fill at least one field for search' : options['error_please_fill_at_least_one_field_for_search']);
		options['error_please_fill_out_all_fields'] = (options['error_please_fill_out_all_fields'] == undefined ? 'please fill out all fields' : options['error_please_fill_out_all_fields']);
		options['label_search_for'] = (options['label_search_for'] == undefined ? 'search for' : options['label_search_for']);
		options['label_take_the_opportunity_to_invite'] = (options['label_take_the_opportunity_to_invite'] == undefined ? 'take the opportunity to invite' : options['label_take_the_opportunity_to_invite']);
		options['label_user_not_found'] = (options['label_user_not_found'] == undefined ? 'not found' : options['label_user_not_found']);
		options['loggedUserAvatarHash'] = (options['loggedUserAvatarHash'] == undefined ? '/loggedUser/avatar/url' : options['loggedUserAvatarHash']);
		if (options['continueWithSavingProcessCallback'] == undefined) {
			options.continueWithSavingProcessCallback = function() {
				$("#score-form").submit();
			};
		}
		return options;
	},

	start: function(nextStep, data) {
		console.log('start: ' + nextStep);
		var step = null;
		do {
			step = NewPlayerWizard.steps[nextStep];
			if (step.storeInBreadCrumbs()) {
				NewPlayerWizard.breadCrumb.push([nextStep, data]);
			}
			step.execute(NewPlayerWizard.context, data);
			nextStep = step.getNextStep();
		} while (nextStep != undefined && !step.isSuspensive());
		console.log('exited start: ' + nextStep);
		NewPlayerWizard.nextStep = nextStep;
	},

	resume: function(data) {
		console.log('resume');
		NewPlayerWizard.start(NewPlayerWizard.nextStep, data);
	},

	goBack: function(steps, data) {
		if (!steps) {
			steps = 1;
		}
		if (NewPlayerWizard.breadCrumb.length < steps) {
			return;
		}
		var stepName = NewPlayerWizard.breadCrumb[NewPlayerWizard.breadCrumb.length - steps][0];
		var step = null;
		for (var i = NewPlayerWizard.breadCrumb.length - 1; i >= 0; i--) {
			step = NewPlayerWizard.breadCrumb.pop();
			if (step[0] == stepName) {
				break;
			}
		}
		if (!step) {
			return;
		}
		if (step[3]) {
		    $(step[2]).values(step[3]);
		}
		if (!data) {
			data = step[1];
		}
		NewPlayerWizard.start(step[0], data);
	},

	init: function(options) {
		NewPlayerWizard.context.options = NewPlayerWizard.applyDefaults(options);

		NewPlayerWizard.steps['first'] = ProvidePlayerListStep.init(NewPlayerWizard.context);
		NewPlayerWizard.steps[CheckIfPlayerShouldBeInvitedStep.name] = CheckIfPlayerShouldBeInvitedStep.init(NewPlayerWizard.context);
		NewPlayerWizard.steps[UserConfirmationStep.name] = UserConfirmationStep.init(NewPlayerWizard.context);
		NewPlayerWizard.steps[OpenSearchDialogStep.name] = OpenSearchDialogStep.init(NewPlayerWizard.context);
		NewPlayerWizard.steps[ProcessSearchResultStep.name] = ProcessSearchResultStep.init(NewPlayerWizard.context);
		NewPlayerWizard.steps[ChoosePlayerFromListStep.name] = ChoosePlayerFromListStep.init(NewPlayerWizard.context);
		NewPlayerWizard.steps[InviteRegisteredUserStep.name] = InviteRegisteredUserStep.init(NewPlayerWizard.context);
		NewPlayerWizard.steps[InviteUnregisteredUserStep.name] = InviteUnregisteredUserStep.init(NewPlayerWizard.context);
		NewPlayerWizard.steps[EndStep.name] = EndStep.init(NewPlayerWizard.context);

		$('#save').click(function() {
			NewPlayerWizard.breadCrumb = [];
			NewPlayerWizard.start('first');
		});
	},

	storeFormDataInBreadCrumbs: function(formName) {
		var lastCrumb = NewPlayerWizard.breadCrumb.pop();
	    lastCrumb[2] = formName;
	    lastCrumb[3] = $(formName).values();
		NewPlayerWizard.breadCrumb.push(lastCrumb);
	}
};

/**
 * Based on http://stackoverflow.com/questions/1489486/jquery-plugin-to-serialize-a-form-and-also-restore-populate-the-form/12218972#12218972
 */
$.fn.values = function(data) {
    var els = $(this).find(':input').get();

    if(typeof data != 'object') {
        // return all data
        data = {};

        $.each(els, function() {
            if (this.name && !this.disabled && (this.checked
                            || /select|textarea/i.test(this.nodeName)
                            || /text|hidden|password/i.test(this.type))) {
                data[this.name] = $(this).val();
            }
        });
        return data;
    } else {
        $.each(els, function() {
            if (this.name && data[this.name]) {
                if(this.type == 'checkbox' || this.type == 'radio') {
                    $(this).attr("checked", (data[this.name] == $(this).val()));
                } else {
                    $(this).val(data[this.name]);
                }
            }
        });
        return $(this);
    }
};

FacebookPreview = {
	imageServer: '',
	contextPath: '',
	render: function() {
		if ($('#facebook_panel_loading').length <= 0) {
			return;
		}
		$('#facebook_panel_loading').show();

		var loggedUserIsWinner = false;
		var winner = Sets.calculateWinner();
		if (winner < 0) {
			var playersArray = document.getElementById("score-form").elements["playersLeft"].value.split(",");
			for (var i=0; i<playersArray.length; i++) {
				if (Sets.loggedUserPlayerName.toUpperCase() == playersArray[i].toUpperCase().trim()) {
					loggedUserIsWinner = true;
				}
			}
		}

		$.ajax({
			url: FacebookPreview.contextPath+"app/score/playerStats",
			data: {
				'sportId': document.getElementById('score-form').elements["sportId"].value,
				'date': document.getElementById('score-form').elements["date"].value,
				'loggedUserIsWinner': loggedUserIsWinner
			},
			dataType: 'json',
			cache: false,
			success: FacebookPreview.processStats
		});
	},

	processStats: function(data) {
		document.getElementById("facebook_panel_title").innerHTML = data.title;
		document.getElementById("facebook_panel_subtitle").innerHTML = data.subtitle;
		
		var graph = document.getElementById('graph');
		graph.onload = function () {
			$('#facebook_panel_loading').hide();
			$('#facebook_panel_enabled').show(1000);
		};

		graph.src = FacebookPreview.imageServer + '?win=' + data.win + '&loss=' + data.loss;         
	},

	init: function(contextPath, imageServer) {
		FacebookPreview.imageServer = imageServer;
		FacebookPreview.contextPath = contextPath;
	}
};
