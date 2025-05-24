const router = require("express").Router();
const Todo = require("../models/todo.model.js")
router.get("/",async (req,res)=>{
    const allData = await Todo.find();
    res.render("index.ejs" , {todo:allData})
})

module.exports = router;