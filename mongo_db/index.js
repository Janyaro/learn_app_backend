const express = require('express');
const mongoose = require('mongoose'); 
const mymodelSchema = require("./Model/mydata.model")
const app = express();
const port = 3000;

const connectInstance =  mongoose.connect('mongodb://localhost/mydata').then(()=>{
    console.log('mongo db connect successfully');
}).catch((error) =>{
    console.log('error will occur in the code ')
}); 

app.listen(port , ()=>{
    console.log(`App is listen at port number ${port}`);
    
})
app.get('/:name/:age', async (req,res)=>{
    const {name , age} = req.params;
    const data = new mymodelSchema({name , age});
   await data.save().then(()=>{
    console.log('data save in the database successfully');
   });
})