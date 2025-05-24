const { model } = require("mongoose");
const user = require("./user_model")
const router = require("express").Router();

router.get('/',(req,res)=>{
    res.json({msg:"app is successfully access by the user"});
})


module.exports = router;