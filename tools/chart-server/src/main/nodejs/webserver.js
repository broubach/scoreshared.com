#!/usr/bin/env node

var fs = require('fs');
var express = require('express');
var app = express();
var spawn = require('child_process').spawn;

var port = process.argv[2];
if (!port) {
    throw Error("Port must be passed as argument");
}

app.get('/',  function(req, res) { 
    res.writeHead( 200, {'Content-Type': 'image/png',  'Content-Disposition': 'filename="'+getPrintscreenName([req.query.win, req.query.loss])+'"'});

    if (!fs.existsSync(getPrintscreenName([req.query.win, req.query.loss]))) {
        var printscreenGenerator = spawn('./printscreen-generator.js', [req.query.win, req.query.loss]);
        printscreenGenerator.stdout.on('close', function() {
            returnFile(res, [req.query.win, req.query.loss]);
        });
    } else {
        returnFile(res, [req.query.win, req.query.loss]);
    }
});

app.listen(port, function() {
    console.log('server ready');
});

function getPrintscreenName(winLoss) {
    return "./printscreen/" + winLoss[0] + "-" + winLoss[1] + ".png";
}

function returnFile(res, winLoss) {
    var img = fs.readFileSync(getPrintscreenName(winLoss));
    res.end(img, 'binary');
}
