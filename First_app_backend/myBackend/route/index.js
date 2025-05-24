const router = require("express").Router();

const Todo = require("../model/todo.model.js");
router.post("/addtodo", async (req, res) => {
    try {
        // Add proper error handling for missing body
        if (!req.body) {
            return res.status(400).json({ error: "Request body is missing" });
        }

        // Destructure with default values to prevent undefined errors
        const { title = "", description = "" } = req.body;

        // Validate inputs
        if (!title.trim() || !description.trim()) {
            return res.status(400).json({ 
                error: "Title and description are required" 
            });
        }

        const newTodo = new Todo({ title, description });
        const savedTodo = await newTodo.save();
        
        console.log("Data saved in the database:", savedTodo);
        res.status(201).json(savedTodo);
    } catch (err) {
        console.error("Error saving to database:", err);
        res.status(500).json({ error: "Failed to save todo" });
    }
});
router.get("/getData",async (req,res)=>{
    const allData = await Todo.find();
    res.json(allData);
});

router.delete('/delete/:id',async(req,res)=>{
    const id = req.params;
    const deleteData = await Todo.findByIdAndDelete(id);
    console.log("the given user is deleted :"+ deleteData)
})

router.get("/",(req,res)=>{
    res.send("Welcome to the home screen");
})
module.exports = router;