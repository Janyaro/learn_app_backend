const express = require("express");
const mongoose = require("mongoose");
const app = express();
const port = 3000;

mongoose.connect("mongodb://localhost/blogApp",).then((val)=>{
    console.log("database connect successfully");
}).catch((err)=>{
    console.log("Error occur during connection database");
});

app.use(express.json());
app.use(express.urlencoded({extended:true}));

app.set("view engine","ejs");
app.use(require("./routes/index.js"));
app.use(require("./routes/compose.js"));
app.use(express.static("./public"));
app.listen(port,()=>{
    console.log(`app is start at the port number ${port}`);
    
})

