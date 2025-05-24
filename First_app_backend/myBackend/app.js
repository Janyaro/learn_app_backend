const express = require("express");
const mongoose = require("mongoose");
const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({extended:true}))
app.use(require("./route/index.js"))

mongoose.connect("mongodb://localhost/flutterTodo").then((val)=>{
    console.log('Database connect successfully');
}).catch((err)=>{
    console.log("error will occur during connection of the database");
})
app.listen(port , ()=>{
    console.log(`Server is started at the port number ${port}`);

})