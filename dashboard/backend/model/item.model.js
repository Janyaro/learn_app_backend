const mongoose = require("mongoose");

const itemSchema = new mongoose.Schema({
    productTitle:{
        type:String,
        required:true
    },
    productdescription:{
        type:String,
        required:true
    },
    stock:{
        type:Number,
        default:0
    },
})

module.exports = mongoose.model("Stock",itemSchema);