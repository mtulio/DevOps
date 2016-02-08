
/* GLOBALS */
var express = require('express'),
  path  = require("path");

var app = express();

var global = require("./global_params.js")

/* Init Web server */
app.use(express.static(path.join(__dirname, global.DocumentRoot)));

//app.listen(process.env.PORT || 3000);
var server = app.listen(global.PORT, function () {

  var host = server.address().address
  var port = server.address().port

  console.log("Server listening at http://%s:%s", host, port)

})

/* ROUTE */
var route_index = require('./routes/index');
var route_api = require('./routes/api');

app.use('/', route_index);
app.use('/api', route_api);

