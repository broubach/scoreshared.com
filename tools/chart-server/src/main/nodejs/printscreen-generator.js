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
        page.set('viewportSize', { width: 400, height : 400 });
        page.set('content', '<page><body><canvas id="estatistica"></canvas></body></page>');
        page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() {
            page.injectJs('Chart.min.js');
            page.evaluate(function(winLoss) {
                $("#estatistica").attr('width',400);
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
				onAnimationComplete : null
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
