#!/usr/bin/env node

var fs = require('fs');
var phantom = require('phantom');

var win = process.argv[2];
var loss = process.argv[3];

if (!win || !loss) {
    throw Error("Win and loss should be passed as a parameter.");
}

function getPrintscreenName(winLoss) {
    return "./printscreen/" + winLoss[0] + "-" + winLoss[1] + ".png";
}

phantom.create('', {}, function (ph) {
    ph.createPage(function (page) {
        page.viewportSize={ width: 600, height: 315 };
        page.set('content', '<html><body>' +
                            '<style>' +
                                '.legenda {' +
                                '	list-style:none;' +
                                '	color:#b3b3b3;' +
                                '   font-size: 3em;' +
                                '   line-height: 1.6;' +
                                '   font-family: "Helvetica Neue","Helvetica",Helvetica,Arial,sans-serif' +
                                '}' +
                                '.legenda li:before {' +
                                "	content:'.';" +
                                '	margin-right:5px;' +
                                '	padding:0 6px;' +
                                '	border-radius: 4px;' +
                                '}' +
                                '.vitorias:before {' +
                                '	color: #d35400;' +
                                '	background-color: #d35400;' +
                                '}' +
                                '.derrotas:before {' +
                                '	color: #e67e22;' +
                                '	background-color: #e67e22;' +
                                '}' +
                            '</style>' +
                            '<div style="display:table; clear: both; width: 600; margin: 0; padding: 0"><div style="margin: 0; padding: 0; position: relative; width: 315px; float: left"><canvas id="estatistica" width="315" height="315" style="margin: 0; padding: 0; width: 315px; height: 315px;"></div>' + 
                            '<div style="margin: 0; padding: 0; position: relative; width: 200px; float: right"><br/><br/><br/><ul class="legenda">' +
                                '<li class="vitorias">win</li>' + 
                                '<li class="derrotas">loss</li>' +
                            '</ul></div></div></body></html>');
        page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() {
            page.injectJs('Chart.min.js');
            page.evaluate(function(winLoss) {
                $("#estatistica").attr('width', 315);
                $("#estatistica").attr('height', 315);
                var ctx = $('#estatistica').get(0).getContext('2d');
                var data = [{
		                  value: parseInt(winLoss[0],10),
				    color:"#d35400"
				},
				{
				    value : parseInt(winLoss[1],10),
				    color : "#e67e22"
                           }];
                var options = {
		              //Boolean - Whether we should show a stroke on each segment
				segmentShowStroke : true,

				//String - The colour of each segment stroke
				segmentStrokeColor : "rgba(250, 250, 250, .2)",

				//Number - The width of each segment stroke
				segmentStrokeWidth : 4,

				//Boolean - Whether we should animate the chart
				animation : false,

				//Function - Will fire on animation completion.
				onAnimationComplete : null,

                                responsive : false
                };
                new Chart(ctx).Pie(data, options);
                return ctx;

	     }, function(result) {
		page.render(getPrintscreenName([win, loss]));
                console.log('file generation completed!');

                ph.exit();
            }, [win, loss]);
        });
    });
});
