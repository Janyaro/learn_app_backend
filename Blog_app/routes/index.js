const router = require("express").Router();
const blogSchema = require("../models/blog.model");

router.get("/",async(req,res)=>{
    const allData = await blogSchema.find();
    console.log(allData);
    res.render("index",{blogs: allData});
})

module.exports = router;

