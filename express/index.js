const express = require("express");

const app = express();

const port = 3000;

app.set('view engine','ejs');

app.listen(port , ()=>{
  console.log(`server is start at the port number ${port}`);  
})
app.get('/' ,(req , res)=>{
    res.send('welcome to the home page');
})
app.get('/about' , (req,res) =>{
    res.render("home" ,{
    title:"main title change kar rha hoon ejs ki help se ",
    items:['apple','banana','graph',4]
    })
})