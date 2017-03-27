let express    = require("express");
let mysql      = require('mysql');
let uuidV4     = require('uuid/v4');
let bodyParser = require('body-parser');
let db_connection = require('./db_connection');
let auth = require("basic-auth");

let connection = mysql.createConnection(db_connection);
let app = express();

connection.connect(function(err){
  if(!err) {
    console.log("Database is connected.");    
  } else {
    console.log("Error connecting database.");    
  }
});

app.get("/company/getnewAPIKey", function(req,res) {
  let company_name = req.query.company_name;
  let querystring = "UPDATE companys INNER JOIN companykey ON companys.id = companykey.company_id SET ? WHERE ?";
  let columns = ['companykey.company_id'];
  let newkey = uuidV4();
  connection.query(querystring, [{ key: newkey }, { name: company_name }], function(err, rows, field) {
    if (err) {
      return;
    }
    else {
      res.status(200).send(newkey);
    }
  });
});

app.get("/company/:companyname",function(req,res){
  let companyname = req.params.companyname;
  let querystring = "SELECT ?? FROM companys WHERE name = ?";
  let columns = ['id', 'name', 'address', 'code', 'id13'];
  connection.query(querystring, [columns ,companyname], function(err, rows, fields) {
    if (err) {
      res.status(400).send('Error 400');
    }
    if (!rows.length > 0) {
      res.status(404).send('Error 404');
    } 
    else {
      res.status(200).send(rows);
    }
  });
});

app.use(bodyParser.json());

app.post('/company', function (req, res) {
  let login = auth(req);
  if (!login || login.name !== 'admin' || login.pass !== 'password') {
    res.send('User not authenticated.');
    return;
  }
  let posteddata = req.body;
  console.log(posteddata);
  let companydata = fillcompany(posteddata);
  connection.query('INSERT INTO companys SET ?', companydata, function(err,result) {
    if(err) {
      return;
    }
    else {
      let id = result.insertId;
      let companykey = {company_id: id, key: uuidV4()};
      connection.query('INSERT INTO companykey SET ?', companykey, function(err,result) {
        if(err) {
          return;
        }
        else {
          res.status(200).send('posted');
        }
      });
    } 
  });
});

fillcompany = function(posteddata) {
    var companydata = Object.assign(
        {
            name: "",
            address: "",
            code: "",
            taxbr: "",
            type: 0,
            year: 0,
            owner: "",
            partner: ""
        },
        posteddata
    );
    if (companydata.id13 === undefined) {
        return undefined;
    }
    return companydata;
};

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});