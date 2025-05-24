const express = require("express");
const mongoose = require("mongoose");
const userSchema = require("../Rest_api/user_model");
const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(require("./index.js"))
// app.use(require("./user.js"))
app.use(require("./user.js"))

mongoose.connect("mongodb://localhost/api_database").then((val)=>{
    console.log('database connect successfully');
}).catch((err)=>{
    console.log('error will occur in the code');
})


// app.get('/save',async (req,res)=>{
//     const data = [
        
//   {
//     "name": "Wasim Akram",
//     "age": 25,
//     "profession": "Flutter Developer"
//   },
//   {
//     "name": "Sara Khan",
//     "age": 30,
//     "profession": "UI/UX Designer"
//   },
//   {
//     "name": "Ali Raza",
//     "age": 28,
//     "profession": "Backend Developer"
//   },
//   {
//     "name": "Fatima Zahra",
//     "age": 24,
//     "profession": "Mobile App Tester"
//   },
//   {
//     "name": "Ahmed Hussain",
//     "age": 32,
//     "profession": "Project Manager"
//   }
// ];
// const allData = await userSchema.insertMany(data);
// console.log(allData);
// res.send("data is saved in the database successfully ")

// })

app.listen(port,()=>{
    console.log(`app is start at the port number ${port}`);
    
})  
