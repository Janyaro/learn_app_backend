const mongoose = require("mongoose");
const { route } = require("../route");

const todoSchema = new mongoose.Schema(
    {
        title:{
            type:String,
            required:true
        },
        description:{
            type:String,
            require:true
        }
    }
)

module.exports = mongoose.model("FlutterTodo",todoSchema);

