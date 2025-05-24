const express = require("express");
const mongoose = require('mongoose');
const crudDataSchema = require("../Model/crudData.model.js");
const app = express();

mongoose.connect('mongodb://localhost/crudDatabase').then(() => {
    console.log('Database is successfully connected');
}).catch(err => {
    console.log('Database connection error:', err);
});

const port = 3000;

app.listen(port, () => {
    console.log(`App is started at port number ${port}`);
});

app.get("/:name/:email/:age", async (req, res) => {
    const { name, email, age } = req.params;
    const myData = new crudDataSchema({ name, email, age });

    try {
        await myData.save();
        console.log("Data saved successfully");
        res.status(200).send("Data saved successfully");
    } catch (error) {
        console.error('Error occurred in the database:', error);
        res.status(500).send("Error occurred while saving data");
    }
});


app.get('/read',async (req,res)=>{
    res.send('user want to read the data from database');
    // const deleteUser = await crudDataSchema.deleteMany({});
    // console.log('User will delete successfully');
    // const updateUser = await crudDataSchema.updateOne({name:"waseem"},{age:12});
    // console.log(updateUser.upsertedId);
const allData = await crudDataSchema.find();
    console.log(allData);
    
})