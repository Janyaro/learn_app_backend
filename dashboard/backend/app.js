const express = require("express");
const mongoose = require("mongoose");
const app = express();
const port = 3000;

app.use(express.json())
app.use(express.urlencoded({extended:true}))
app.use(require("./router/index.js"));

mongoose.connect("mongodb://localhost/stock").then((val)=>{
    console.log("database connect successfully");
}).catch((err)=>{
    console.log("error will occur during connection of database");
});

app.listen(port,()=>{
    console.log(`app is start at port number ${port}`);
})