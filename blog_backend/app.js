const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const app = express();

const port = 3000;
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(require("./routes/index"))


mongoose.connect("mongodb://localhost/blogflutter").then((val)=>{
    console.log("Database connect successfully");
}).catch((err)=>{
    console.log("error will occur in the code");
})
 

app.listen(port , ()=>{
    console.log(`App is start at port ${port}`);
})