var express = require('express');
var app = express();

app.use(express.static('test'));

app.get('/', function (req, res) {
    res.sendFile( __dirname + "/" + "index.html" );
})

var server = app.listen(5000, function () {
   var host = server.address().address
   var port = server.address().port
   console.log("App listening at http://%s:%s", host, port)
})