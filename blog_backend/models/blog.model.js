const mongoose = require("mongoose");

const blogSchema = new mongoose.Schema({
    title:{
     type:String,
     required:true
    },
    content:{
    type:String,
    required:true
    },
    postedAt:{
    type:String,
    default:Date.now
    }
});

module.exports = mongoose.model("Blog",blogSchema);