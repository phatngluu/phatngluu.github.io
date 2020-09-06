```sh
npm init

npm install express --save

npm install body-parser --save
```

```
/*
server_app.get('/', function(req, res){
    res.send('/')
})

// GET service with user input
server_app.get('/getPara/:param', function(req, res){
    var param = req.params.param
    res.send('Your param: ' + param)
})
// GET service with user input
server_app.get('/getquery', function(req, res){
    var query1 = req.query.query1
    var query2 = req.query.query2
    res.send('Your param: ' + query1 + ", " + query2)
})
// POST service with user input
server_app.post('/testPostMethod', function(req, res){
    var strData = req.body.para
    var strData2 = req.body.para2
    res.send('Your post param is: ' + strData + ',' + strData2)
})

// currency service
server_app.get('/exchange', function(req, res){
    var amount = req.query.amount
    var type = req.query.type
    if (type === "vnd"){
        res.send('VND: ' + amount + " => USD: " + amount*0.000043)
    } else {
        res.send('USD: ' + amount + " => VND: " + amount*23090.18)
    }
})

// currency service
server_app.post('/exchange2', function(req, res){
    var amount = req.body.amount
    var type = req.body.type
    if (type === "vnd"){
        res.send('VND: ' + amount + " => USD: " + amount*0.000043)
    } else {
        res.send('USD: ' + amount + " => VND: " + amount*23090.18)
    }
})

server_app.get('/folder', function(req, res){
    res.send('folder')
})
*/
```

