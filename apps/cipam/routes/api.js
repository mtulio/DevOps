/*
 * REST API
 *
 * URI:
 * - /api
 * --- /getConfig
 * --- /getConfigNets
 * --- /getConfigNet?name=NETNAME
 * --- /getConfigBacks
 * --- /getConfigBacks?name=BACKNAME
 * --- /getNet?name=NETNAME
 * --- /getNetIP?&netname=NETNAME&name=NETNAME
 * --- /exec --> ROUTING
 * 
 */

/* GLOBALS */
var express = require('express');
var router = express.Router();
var fs = require("fs"),
  url = require("url");

var global = require("../global_params.js")

var base_uri = '/api'

/* ROUTES */

var route_api_exec = require('./api_exec');
router.use('/exec', route_api_exec);

/* REST */
/* == curl -X GET -s http://localhost:8080/api/getConfigNets | python -mjson.tool */
router.get('/getConfigNets', function (req, res) {
  console.log( "GET %s: %s", base_uri, url.parse(req.url).pathname);
  fs.readFile( global.dir_conf + "/networks.json", 'utf8', function (err, data) {
    res.end( data );
  });
})

module.exports = router;
