var playersList = ["Andre Agassi",
                   "Pete Sampras",
                   "Sergi Bruguera",
                   "Yevgeny Kafelnikov",
                   "Goran Ivanisevic",
                   "Slobodan Milosevic",
                   "Richard Krajicek",
                   "Jimmy Connors",
                   "Felipe Freitas",
                   "Roger Federer",
                   "Rafael Nadal",
                   "Andy Roddick",
                   "Novak Jokovic",
                   "Andy Murray"];

var Sets = {
	MAX: 5,
	playersPane: "",
	setsPane: "",
	nthSetLabel: "",
	setLabel: "",
	count: 1,

	init: function(playersPane, setsPane, nthSetLabel, setLabel) {
		Sets.playersPane = playersPane;
		Sets.setsPane = setsPane;
		Sets.nthSetLabel = nthSetLabel;
		Sets.setLabel = setLabel;
		$('label', document.getElementById(Sets.setsPane)).append(Sets.count + Sets.nthSetLabel);
		$('input', document.getElementById(Sets.setsPane)).blur(Sets.switchSidesIfNeeded);
		Sets.updateAllSetsInfo();
		Sets.switchSidesIfNeeded();
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

		if (nr < Sets.count) {
			$('dd a', set).remove();
			$('dd', set).append('<a href="javascript:Sets.deleteY('+nr+');">-</a>');
		} else {
			$('dd a', set).remove();
			$('dd', set).append('<a href="javascript:Sets.increase();">+ '+Sets.setLabel+'</a>');
		}
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
			leftVal = $('#set' + (i + 1) + 'left', sets[i]).val();
			rightVal = $('#set' + (i + 1) + 'right', sets[i]).val();
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

		aux = $('input:first', '#' + Sets.playersPane).val();
		$('input:first', '#' + Sets.playersPane).val($('input:eq(1)', '#' + Sets.playersPane).val());
		$('input:eq(1)', '#' + Sets.playersPane).val(aux);
	}
};

var NewPlayerWizzard = {
	contextPath: "",
	label_yes: "",
	label_no: "",
	continueWithSavingProcessCallback: {},
	newPlayers: [],
	currentNewPlayer: 0,
	stepSucceeded: false,

	init: function(choosenPlayers, contextPath, label_yes, label_no) {
		NewPlayerWizzard.label_yes = label_yes;
		NewPlayerWizzard.label_no = label_no;
		NewPlayerWizzard.contextPath = contextPath;
		NewPlayerWizzard.currentNewPlayer = 0;
		NewPlayerWizzard.continueWithSavingProcessCallback = function() {
			$("#score-form").submit();
		};

		NewPlayerWizzard.start(choosenPlayers, playersList);
	},

	start: function(choosenPlayers, playersList) {
		NewPlayerWizzard.newPlayers = NewPlayerWizzard.createList(choosenPlayers, playersList);

		NewPlayerWizzard.startForCurrentPlayer();
	},

	createList : function(choosenPlayers, playersList) {
		var choosenPlayers = NewPlayerWizzard.trimList(choosenPlayers);
		var result = choosenPlayers.split(',');
		var choosenPlayersList = choosenPlayers.split(',');
		for ( var j = 0; j < playersList.length; j++) {
			for ( var i = 0; i < choosenPlayersList.length; i++) {
				if (choosenPlayersList[i] == '' || playersList[j] == '') {
					if (choosenPlayersList[i] == '') {
						choosenPlayersList.splice(i, 1);
						result.splice(i, 1);
						i--;
					}
					continue;
				}
				if (choosenPlayersList[i].toUpperCase() == playersList[j]
						.toUpperCase()) {
					choosenPlayersList.splice(i, 1);
					result.splice(i, 1);
					i--;
				}
			}
		}
		return result;
	},

	trimList: function(commaSeparatedString) {
		var result = commaSeparatedString.split(',');
		for (var i = 0; i<result.length; i++) {
			result[i] = result[i].trim();
		}
		return result.join(',');
	},

	startForCurrentPlayer: function() {
		console.log('startForCurrentPlayer');
		NewPlayerWizzard.stepSucceeded = false;
		if (NewPlayerWizzard.currentNewPlayer < NewPlayerWizzard.newPlayers.length) {
			$.ajax({
				url: NewPlayerWizzard.contextPath+"/app/score/newUser",
				data: {'player': NewPlayerWizzard.newPlayers[NewPlayerWizzard.currentNewPlayer++]}, 
				type: 'POST',
				dataType: 'json',
				cache: false,
				success: NewPlayerWizzard.step1
			});
		} else {
			NewPlayerWizzard.continueWithSavingProcessCallback();
		}
	},

	step1: function(data) {
		console.log('step1');
		if (data.proceedWithConfirmation) {
			$("#dialog-confirm").attr('title', data.title);
			$("#dialog-confirm").dialog({
				resizable: false,
				height: 140,
				modal: true,
				close : function() {
					$("#dialog-confirm").dialog("destroy");
					if (!NewPlayerWizzard.stepSucceeded) {
						NewPlayerWizzard.startForCurrentPlayer();
					} else {
						NewPlayerWizzard.stepSucceeded = false;
					}
				},
				buttons : [ {
					text : NewPlayerWizzard.label_yes,
					click : function() {
						NewPlayerWizzard.stepSucceeded = true;
						$("#dialog-confirm").dialog("close");
						NewPlayerWizzard.step2();
					}
				}, {
					text : NewPlayerWizzard.label_no,
					click : function() {
						$("#dialog-confirm").dialog("close");
					}
				} ]
			});
		} else {
			NewPlayerWizzard.startForCurrentPlayer();
		}
	},

	step2: function() {
		console.log('step2');
		$("#dialog-search").dialog("open");
	},

	step3: function(data) {
		console.log('step3');
		$("#dialog-search").dialog( "close" );
		if (data.playerFound) {
			$("#requested dt").text(data.playerName);
			$("#requested dd").text(data.playerLocation);
			$("#friendRequest-form textarea").text(data.requestMessage);
			$("#dialog-friendRequest").dialog("open");
		} else { 
			$("#invitation-form textarea").text(data.invitationMessage);
			$("#dialog-invitation").dialog("open");
		}
	},

	step4a: function() {
		console.log('step4a');
		$("#dialog-friendRequest").dialog( "close" );
		NewPlayerWizzard.startForCurrentPlayer();
	},

	step4b: function() {
		console.log('step4b');
		$("#dialog-invitation").dialog( "close" );
		NewPlayerWizzard.startForCurrentPlayer();
	}
};