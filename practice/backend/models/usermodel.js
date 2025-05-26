const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true

    },
    age: {
        type: Number,
        required: true,
        default:0

    }

});

module.exports = mongoose.model("User", userSchema);