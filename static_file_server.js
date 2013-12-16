var express = require('express');

var app,config;

app = express();

config = {
	port: 8080
};

app.use(express.static(__dirname + '/content'));
app.use(express.directory(__dirname + '/content'));
app.use(express.errorHandler());

// trust the nginx reverse proxy
app.enable('trust proxy');
app.get('trust proxy');

app.all('*',function(req,res) {
	res.send(404,'404: Please learn to spell <a href="/">[^ top]</a>');
});

app.listen(config.port);
console.log('Express running [%d]',config.port);