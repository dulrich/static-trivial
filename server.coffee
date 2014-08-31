express = require 'express'
path    = require 'path'
app     = express();

log = console.log

config = {
	port: 9876
	proxied: true
}

if config.proxied
	# trust the reverse proxy
	app.enable 'trust proxy'
	app.get 'trust proxy'


app.use mware for mware in [
	express.static path.join __dirname, 'content'
	express.directory path.join __dirname, 'content'
	express.errorHandler()
]

app.all '*', (req,res) ->
	res.send 404, '404: Please learn to spell <a href="/">[^ top]</a>'

app.listen config.port
log "Express running [#{config.port}]"
