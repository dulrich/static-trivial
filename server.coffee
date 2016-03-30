# Static-Trivial: a trivial static file server with listings
# Copyright (C) 2013 - 2015  David Ulrich (http://github.com/dulrich)
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, version 3 of the License.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

express = require 'express'
path    = require 'path'
app     = express()

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
