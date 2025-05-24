const express = require("express");
const mongoose = require("mongoose");
const app = express()
const port = 3000;


//middlewares
app.use(express.json());
app.use(express.urlencoded({extended:true}))
app.set("view engine","ejs");
 
app.use(require("./routes/todo"))
app.use(require("./routes/index"));
mongoose.connect("mongodb://localhost/todo_app").then((val)=>{
    console.log('database connect successfully');
}).catch((err)=>{
    console.log("error will occur in the code ");
    
});

app.listen(port , ()=>{
    console.log(`app is start at the port number ${port}`)
})