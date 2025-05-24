const router = require('express').Router();

const { default: mongoose } = require('mongoose');
const Todo = require("../models/todo.model.js")


router.post("/add/todo",(req,res)=>{
    const {todo} = req.body;
    console.log(todo);
    const todoData = new Todo({todo});
    todoData.save().then((val)=>{
        res.redirect("/");
    }).catch((err)=>{
        console.log("error will occur in the code check it");
    })
})
router.post("/delete/todo/:id", async (req, res) => {
  try {
    await Todo.findByIdAndDelete(req.params.id);
    res.redirect("/"); // Redirect to home after deletion
  } catch (err) {
    res.status(500).send("Error deleting todo");
  }
});

module.exports = router