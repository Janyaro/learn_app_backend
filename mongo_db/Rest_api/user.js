const router = require('express').Router();
const express = require('express');
const User = require('./user_model.js');

router.get("/all",async (req,res)=>{
    const allData = await User.find();
    res.send({user:allData}); 
    console.log(allData);
})
 // save data into the mongodb
router.post('/add/user' ,async (req,res)=>{
    const {name,age,profession} = req.body;
   const newUser = await User({name,age,profession});
   newUser.save().then((val)=>{
   console.log("data save successfully")
   }).catch((err)=>{
console.log("data can't be save in the database")
   })
})

// delete the specific data into mongoDB

router.get("/delete/:id", async (req,res)=>{
    const {id} = req.params;
    const deleteUser= await User.deleteOne({_id:id}).then((val)=>{
        console.log("user delete successfully into the database");
    }).catch((err)=>{
        console.log('Error will occur in deleting the object')
    })
    console.log(deleteUser.name)
})

 // search specific user data 

router.get("/user/:name", async (req, res) => {
  const { name } = req.params;

  try {
    const searchUser = await User.findOne({ name });

    if (!searchUser) {
      return res.status(404).send("User not found");
    }

    console.log("The user is:", searchUser.name);
    res.status(200).json(searchUser); // Send the actual user data
  } catch (err) {
    console.error("Error occurred while finding user:", err);
    res.status(500).send("Internal Server Error");
  }
});

module.exports = router;
 
module.exports = router;