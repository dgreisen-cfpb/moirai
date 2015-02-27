conf = require('./config')

express = require('express')
bodyParser = require('body-parser')
session = require('cookie-session')
routes = require('./routes')
middleware = require('./middleware')

couch = require('./couch_utils')
couch.nano_admin.db.create('moirai')

app = express()
app.use(bodyParser.json())
app.use(session({secret: conf.SECRET_KEY, name: 'express_sess'}))
app.use(middleware.couch)
routes(app)

server = app.listen(5001, () ->
  host = server.address().address
  port = server.address().port
  console.log('app listening at http://%s:%s', host, port)
)
