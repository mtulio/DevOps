var express = require('express');
var router = express.Router();
var fs = require("fs");

var global = require("../global_params.js")

/* == Test: http://127.0.0.1:8080/api/configNetworks */
router.get('/configNetworks', function (req, res) {
  //console.log( global.dir_conf + "/networks.json");
  fs.readFile( global.dir_conf + "/networks.json", 'utf8', function (err, data) {
    res.end( data );
  });
})

module.exports = router;
