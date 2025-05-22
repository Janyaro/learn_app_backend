const express = require('express');

const app = express();

const port = 3000;

app.get('/:route',(req,res)=>{
    let {route} = req.params;
    res.send(`welcome back to the ${route} page`);
})

app.get('/',(req,res) => {
    const {query_para, second} = req.query;
    console.log(query_para , second);
    
    res.send(`The query parameter will be ${query_para} && ${second}`);
})







app.listen(port , ()=>{
    console.log(`port is start at the port number ${port}`);
})
