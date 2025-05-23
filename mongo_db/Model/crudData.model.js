const mongoose = require("mongoose");

const crudDataSchema = new mongoose.Schema({
    name:{
        type:String,
        required:true,
        lowercase:true
    },
    email:{
        type:String,
        required:true,
        lowercase:true
    },
    age:{
        type:Number,
        required:true
    }
});

module.exports = mongoose.model('crudData',crudDataSchema);