    const mongoose = require('mongoose');

    const mymodelSchema = mongoose.Schema({
        name:{
            type:String,
            required:true,
            lowercase:true
        },
        age:{
            type:Number,
            required:true,
        },
    })
    module.exports  = mongoose.model('myModel',mymodelSchema);