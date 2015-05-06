var http = require('http'),
    express = require('express');

function ttsUrl() {
  if (process.env.VCAP_SERVICES) {
    var svcInfo = JSON.parse(process.env.VCAP_SERVICES);
    for (var label in svcInfo) {
      var svcs = svcInfo[label];
      for (var index in svcs) {
        var uri = svcs[index].credentials.uri;
        console.log(uri);
        return uri;
      }
    }
    return null;
  }
  else {
    return "";
  }
}
var ttsurl = ttsUrl(); // || 'static-address';

// Create the web server
var server = express();

// Set EJS as the view engine module to use
server.set('view engine', 'ejs');
server.use(express.static(__dirname + '/public'));

server.get('/',function(req, res) {
    res.render('index.ejs', {tts_url: ttsurl});
});

server.listen(process.env.VCAP_APP_PORT || 8080);
