const { error, log } = require('console');
const fs = require('fs');

// Create a file 
// fs.open("test.txt","w",(err) =>{
//     if(err) throw err;
//     console.log('file create successfully');
// })

// write data in the file 
// fs.writeFile("test.txt","main 2 12 file main write kar rha hoon" , (err)=>{
//     if(err) throw err;
//     console.log("writing file successfully :)");
    
// })

// append data in the file
// fs.appendFile("test.txt"," \n main file main data ko append kar rha hoon " ,(err)=>{
// if(err) throw err;
// console.log("main file main data ko append kar rha hoon :)");

// })

// rename a file 
// fs.rename("test.txt" , "main.txt" , (err)=>{
//     if(err) throw err;
//     console.log('file name change successfully');
    
// })
// delete file in the system
// fs.unlink("main.txt", (err)=>{
//     if (err) throw err;
//     console.log('file delete successfully in the system');
    
// })


// fs.readFile("test.txt",(err,data)=>{
//     if(err) throw err;
//     console.log(`The file contain the given data \n ${data}`);
    
// })