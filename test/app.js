// App.js 
var express = require('express');
var app = express();

var bodyParser = require('body-parser');
var session = require('express-session');
app.set('view engine', 'ejs');
app.use("/", express.static(__dirname + '/public'));
app.use("/", express.static(__dirname + '/node_modules'));
app.use("/bower_components", express.static(__dirname + '/bower_components'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(session({secret: '1234567890QWERTY'}));
app.get("/",function(req,res){
	res.send("index.html");
});

app.get('/about', function (req, res) {
  res.sendFile(__dirname + '/public/about.html');
});

app.get('/signin', function (req, res) {
  var previousPage = req.headers.referer;
	if(previousPage.indexOf('signin') < 0){
    req.session['previousPage'] = previousPage;  
  }
  res.sendFile(__dirname + '/public/signin.html');
});

app.get('/station1', function (req, res) {
	var isLogin = false;
	if (req.session['user']){
		isLogin = true;
	}
	res.render("station1", { isLogin : isLogin });
});

app.get('/station2', function (req, res) {
  res.sendFile(__dirname + '/public/station2.html');
});

app.get('/station3', function (req, res) {
  res.sendFile(__dirname + '/public/station3.html');
});

// Connect mySQL
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '123456',
  database : 'project'
});

connection.connect(function(err){
  if(err){
    console.log('Error connecting to Db');
    return;
  }
  console.log('Connection established');
});



app.get('/getData',function(req,res) {
  var result = getDataFromDb(function(err, result){
    res.json(result);  
  });
  
	// connection.query('SELECT * FROM  `station1` ORDER BY time LIMIT 10',function(err,rows){
	// 	if(err){
	// 		console.log(err);
	// 		res.status(500);
	// 	} 
	// 	else
	// 	{
	// 	  console.log('Data received from Db:\n');

	// 	  // var result = [];
	// 	  // for (var i = rows.length() ; i >= 0 ;i--){
	// 	  // 	var temp = rowDate[i];
	// 	  // 	result.push(temp);
	// 	  // }

	// 	  res.json(rows);
	// 	}
	// });

	
});

function getDataFromDb(callback){
  connection.query('SELECT * FROM  `station1` ORDER BY time DESC LIMIT 10',function(err,rows){
    if(err){
      console.log(err);
      callback(err, []);
    } 
    else
    {
      console.log('Data received from Db:\n');

      var result = [];
      for (var i = rows.length - 1 ; i >= 0 ;i--){
        var temp = rows[i];
        temp.time = temp.time.toLocaleString();
        console.log(temp.time);
        result.push(temp);
      }

      callback(null, result);
    }
  });
}

var value = 0;
var count = 0;
function InsertData(){
  var t = new Date();
  //var strtime = "2015-11-23 03:28:00"
  var strTime = t.getUTCFullYear() + "-" + t.getMonth() + "-" + t.getDate()  + " " + t.getHours() + ":" + t.getMinutes() + ":" + t.getSeconds()
  if ( count % 2 == 0){
    value += 10;
  } 
  else{
    value -= 5;
  }
  var strQuery = "INSERT INTO `project`.`station1` (`time`, `value`) VALUES ('" + strTime + "', ' "+ value + "')"
  connection.query(strQuery ,function(err,rows){
    console.log(err);
    console.log("inserted");
  });
  count++;
}

app.post("/signin", function(req, res){
	console.log("post login");
	console.log(req.body);
	if ( req.body.username == "admin" && req.body.password == "admin" ){
		req.session["user"] = "admin";
		req.session.save();
		return res.redirect(req.session['previousPage']);
	}
	return res.redirect("/signin");
});

app.get("/logout", function(req, res){
	if( req.session['user'] )
	{
		req.session['user'] = false;
	
	}
	res.redirect("/station1");

});

app.get("/check", function(req, res){
	InsertData();
})

// connection.end(function(err) {
//   // The connection is terminated gracefully
//   // Ensures all previously enqueued queries are still
//   // before sending a COM_QUIT packet to the MySQL server.
// });

var server = require('http').createServer(app);
var io = require('socket.io').listen(server);


const port = 80;

server.listen(port, () => {
  console.log(`Server running at http://:${port}/`);
});

setInterval(function(){
  InsertData();
}, 1000);

io.on('connection', function(client){
  console.log("connect");
  setInterval(function(){
    getDataFromDb(function(err, data){
      client.emit("sendData", {data: data});  
    })
    
  }, 1000);

  client.on('disconnect', function(){});
});
