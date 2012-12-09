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

		aux = $('input:first', '#' + Sets.playersPane).val();
		$('input:first', '#' + Sets.playersPane).val($('input:eq(1)', '#' + Sets.playersPane).val());
		$('input:eq(1)', '#' + Sets.playersPane).val(aux);
	}
};

/**
 * Graph representing the steps in the wizard
 *
 * #1/4                     |startForCurrentPlayer  |step1
 * startForCurrentPlayer    |                       |/app/score/isAssociated, step1
 * step1                    |                       |
 * step2                    |                       |
 * step3                    |                       |
 * step3a                   |                       |
 * step3b                   |                       |
 * step3c                   |                       |
 * step4a                   |startForCurrentPlayer  |
 * step4b                   |startForCurrentPlayer  |
 *
 * #2/4                     |step2                            |step3  |step3a
 * startForCurrentPlayer    |                                 |       |
 * step1                    |step2, UI, /app/score/searchUser |       |
 * step2                    |                                 |step3  |
 * step3                    |                                 |       |step3a, UI, /app/score/searchUser (with BACK!!)
 * step3a                   |                                 |step3  |
 * step3b                   |                                 |       |
 * step3c                   |                                 |       |
 *
 * #3/4                     |step3b                                                |step3c
 * startForCurrentPlayer    |                                                      |
 * step1                    |                                                      |
 * step2                    |                                                      |
 * step3                    |step3b, UI, /app/score/newFriendRequest (with BACK!!) |step3c, UI, /app/score/newInvitation (with BACK!!)
 * step3a                   |                                                      |
 * step3b                   |                                                      |
 * step3c                   |                                                      |
 *
 * #4/4                     |step4a                         |step4b
 * startForCurrentPlayer    |                               |
 * step1                    |                               |
 * step2                    |                               |
 * step3                    |                               |
 * step3a                   |                               |
 * step3b                   |step4a, startForCurrentPlayer  |
 * step3c                   |                               |step4b, startForCurrentPlayer
 *
 * Back buttons in: #dialog-friendListRequest (step3a); #dialog-friendRequest (step3b); #dialog-invitation (step3c)
 **/
var NewPlayerWizard = {
	options: {},
	scorePlayers: [],
	currentScorePlayer: 0,
	stepSucceeded: false,
	breadCrumb: [],
	step3aData: [],

	applyDefaults: function(options){
		options['contextPath'] = (options['contextPath'] == undefined ? '/scoreshared' : options['contextPath']);
		options['label_yes'] = (options['label_yes'] == undefined ? 'yes' : options['label_yes']);
		options['label_no'] = (options['label_no'] == undefined ? 'no' : options['label_no']);
		options['label_send_request'] = (options['label_send_request'] == undefined ? 'send request' : options['label_send_request']);
		options['label_invite'] = (options['label_invite'] == undefined ? 'invite' : options['label_invite']);
		options['label_user_not_found'] = (options['label_user_not_found'] == undefined ? 'not found' : options['label_user_not_found']);
		options['label_take_the_opportunity_to_invite'] = (options['label_take_the_opportunity_to_invite'] == undefined ? 'take the opportunity to invite' : options['label_take_the_opportunity_to_invite']);
		options['label_back'] = (options['label_back'] == undefined ? 'back' : options['label_back']);
		options['loggedUserAvatarUrl'] = (options['loggedUserAvatarUrl'] == undefined ? '/loggedUser/avatar/url' : options['loggedUserAvatarUrl']);
		// TODO: start passing over the correct url
		if (options['continueWithSavingProcessCallback'] == undefined) {
			options.continueWithSavingProcessCallback = function() {
				$("#score-form").submit();
			};
		}
		return options;
	},

	start: function(choosenPlayers) {
		NewPlayerWizard.scorePlayers = NewPlayerWizard.createList(choosenPlayers);

		NewPlayerWizard.currentScorePlayer = 0;
		NewPlayerWizard.startForCurrentPlayer();
	},

	createList : function(choosenPlayers) {
		var choosenPlayers = NewPlayerWizard.trimList(choosenPlayers);
		var choosenPlayersList = choosenPlayers.split(',');
		for ( var i = 0; i < choosenPlayersList.length; i++) {
			if (choosenPlayersList[i] == '') {
				choosenPlayersList.splice(i, 1);
				i--;
			}
		}
		return choosenPlayersList;
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
		NewPlayerWizard.stepSucceeded = false;
		if (NewPlayerWizard.currentScorePlayer < NewPlayerWizard.scorePlayers.length) {
			$.ajax({
				url: NewPlayerWizard.options.contextPath+"/app/score/isAssociated",
				data: {'player': NewPlayerWizard.scorePlayers[NewPlayerWizard.currentScorePlayer++]},
				type: 'POST',
				dataType: 'json',
				cache: false,
				success: NewPlayerWizard.step1
			});
		} else {
			NewPlayerWizard.options.continueWithSavingProcessCallback();
		}
	},

	step1: function(data) {
		console.log('step1');
		if (data.proceedWithConfirmation == 'true') {
			$("#dialog-confirm").attr('title', data.title);
			$("#dialog-confirm").dialog({
				resizable: false,
				modal: true,
				close : function() {
					$("#dialog-confirm").dialog("destroy");
					NewPlayerWizard.dialogCloseCallback();
				},
				buttons : [ {
					text : NewPlayerWizard.options.label_yes,
					click : function() {
						NewPlayerWizard.stepSucceeded = true;
						$("#dialog-confirm").dialog("close");
						$('#search-form input').val('');
						NewPlayerWizard.step2();
					}
				}, {
					text : NewPlayerWizard.options.label_no,
					click : function() {
						$("#dialog-confirm").dialog("close");
					}
				} ]
			});
		} else {
			NewPlayerWizard.startForCurrentPlayer();
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
		    if (data.playerList.length > 1) {
		        NewPlayerWizard.step3a(data);

		    } else {
		        NewPlayerWizard.step3b(data);
		    }
		} else {
		    NewPlayerWizard.step3c(data);
		}
	},

	step3a: function(data) {
        console.log('step3a');
        NewPlayerWizard.step3aData = data;

		$("#dialog-friendListRequest table tbody").html('');
		for ( var i = 0; i < data.playerList.length; i++) {
            var row = "<tr><td><a href='"+data.playerList[i][0]+"'>";
            row += "<img src='" + NewPlayerWizard.options.contextPath + "/app/avatar?hash="
                    + data.playerList[i][1] + "&small'/>";
            row += "</a></td><td><a href='"+data.playerList[i][0]+"'>";
            row += data.playerList[i][2];
            row += "</a></td><td><a href='"+data.playerList[i][0]+"'>";
            row += data.playerList[i][3];
            row += "</a></td></tr>";
            $("#dialog-friendListRequest table tbody").append(row);

            $("#dialog-friendListRequest table tbody tr:eq(" + i + ") a").click(function(e) {
                e.preventDefault();
        		NewPlayerWizard.storeBreadcrumb('step3a', undefined, NewPlayerWizard.step3aData);
                $.ajax({
                    url: NewPlayerWizard.options.contextPath + "/app/score/searchUser",
                    type: 'POST',
                    data: {'email': $(this).attr('href')},
                    dataType: 'json',
                    cache: false,
                    success: function(data) {
                        NewPlayerWizard.stepSucceeded = true;
                        $("#dialog-friendListRequest").dialog("close");

                        NewPlayerWizard.stepSucceeded = true;
                        NewPlayerWizard.step3(data);
                    }
                });
            });
        }

        $("#dialog-friendListRequest").dialog("open");
	},

	step3b: function(data) {
        console.log('step3b');
        $("#dialog-friendRequest input[name='email']").val(data.playerList[0][0]); // email
        $("#requested dt").text(data.playerList[0][1]); // avatarHash
        if (data.playerList[0][3] != undefined) {
            $("#requested dd").html(data.playerList[0][2] + "<br/>" + data.playerList[0][3]); // fullName + location
        } else {
            $("#requested dd").html(data.playerList[0][2]); // fullName
        }
        $("#requester textarea").text(data.invitationMessage); // invitationMessage
        $("#requester dd").text(NewPlayerWizard.options.loggedUserAvatarUrl); // logged user avatar
        $("#dialog-friendRequest input[name='playerName']").val(data.playerNameInScore); // playerName
        $("#dialog-friendRequest").dialog("open");
	},

	step3c: function(data) {
        console.log('step3c');
        $("#invitation-form input[name='playerName']").val(data.playerNameInScore); // playerName
        $("#invitation-form dt:eq(0)").html(data.playerNameInScore + " " + NewPlayerWizard.options.label_user_not_found + '<br/>' + NewPlayerWizard.options.label_take_the_opportunity_to_invite); // fullName + location
        $("#invitation-form textarea").text(data.invitationMessage); // invitationMessage
        $("#invitation-form input[name='email']").val(data.email); // email
        $("#dialog-invitation").dialog("open");
	},

	step4a: function() {
		console.log('step4a');
		$("#dialog-friendRequest").dialog( "close" );
		NewPlayerWizard.startForCurrentPlayer();
	},

	step4b: function() {
		console.log('step4b');
		$("#dialog-invitation").dialog( "close" );
		NewPlayerWizard.startForCurrentPlayer();
	},

	dialogCloseCallback: function() {
		if (!NewPlayerWizard.stepSucceeded) {
			NewPlayerWizard.startForCurrentPlayer();
		} else {
			NewPlayerWizard.stepSucceeded = false;
		}
	},

	init: function(options) {
		NewPlayerWizard.options = NewPlayerWizard.applyDefaults(options);

		$(':button').click(function() {
			NewPlayerWizard.start($("#playersLeft").val() + ',' + $("#playersRight").val());
		});

		$( "#dialog-search" ).dialog({
            resizable: true,
			autoOpen: false,
			modal: true,
			close : NewPlayerWizard.dialogCloseCallback,
			buttons: [{
				text: NewPlayerWizard.options.label_associate,
				click: function() {
					NewPlayerWizard.storeBreadcrumb('step2', '#search-form');
					NewPlayerWizard.stepSucceeded = true;
					$('#playerNameInScore').val(NewPlayerWizard.scorePlayers[NewPlayerWizard.currentScorePlayer - 1]);
					$.ajax({
						url: NewPlayerWizard.options.contextPath+"/app/score/searchUser",
						data: $('#search-form').serialize(),
						type: 'POST',
						dataType: 'json',
						cache: false,
						success: NewPlayerWizard.step3
					});
				}
			}]
		});

		$( "#dialog-friendRequest" ).dialog({
            resizable: true,
			autoOpen: false,
			modal: true,
			close : NewPlayerWizard.dialogCloseCallback,
			buttons: [{
                text: NewPlayerWizard.options.label_back,
                click: function() {
                    NewPlayerWizard.stepSucceeded = true;
            		$("#dialog-friendRequest").dialog( "close" );
            		NewPlayerWizard.goBack();
                }
            },{
				text: NewPlayerWizard.options.label_send_request,
				click: function() {
					NewPlayerWizard.stepSucceeded = true;
					$.ajax({
						url: NewPlayerWizard.options.contextPath+"/app/score/newFriendRequest",
						data: $('#friendRequest-form').serialize(),
						type: 'POST',
						dataType: 'json',
						cache: false,
						success: NewPlayerWizard.step4a
					});
				}
			}]
		});

        $( "#dialog-friendListRequest" ).dialog({
            resizable: true,
            autoOpen: false,
            modal: true,
            close : NewPlayerWizard.dialogCloseCallback,
            buttons: [{
                text: NewPlayerWizard.options.label_back,
                click: function() {
                    NewPlayerWizard.stepSucceeded = true;
            		$("#dialog-friendListRequest").dialog( "close" );
            		NewPlayerWizard.goBack();
                }
            }]
        });

		$( "#dialog-invitation" ).dialog({
            resizable: true,
			autoOpen: false,
			modal: true,
			close : NewPlayerWizard.dialogCloseCallback,
			buttons: [{
                text: NewPlayerWizard.options.label_back,
                click: function() {
                    NewPlayerWizard.stepSucceeded = true;
            		$("#dialog-invitation").dialog( "close" );
            		NewPlayerWizard.goBack();
                }
            }, {
				text: NewPlayerWizard.options.label_invite,
				click: function() {
					NewPlayerWizard.stepSucceeded = true;
					$.ajax({
						url: NewPlayerWizard.options.contextPath+"/app/score/newInvitation",
						data: $('#invitation-form').serialize(),
						type: 'POST',
						dataType: 'json',
						cache: false,
						success: NewPlayerWizard.step4b
					});
				}
			}]
		});
	},

	storeBreadcrumb: function(functionName, formName, data) {
		if (data != undefined) {
		    NewPlayerWizard.breadCrumb.push([functionName, undefined, data]);
		} else {
		    NewPlayerWizard.breadCrumb.push([functionName, formName, $(formName).values()]);
		}
	},

	goBack: function() {
	    var lastCrumb = NewPlayerWizard.breadCrumb.pop();
	    if (lastCrumb[1] == undefined) {
	    	eval("NewPlayerWizard." + lastCrumb[0] + "(" + JSON.stringify(lastCrumb[2]) + ")");
	    } else {
		    $(lastCrumb[1]).values(lastCrumb[2]);
		    eval("NewPlayerWizard." + lastCrumb[0] + "()");
	    }
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