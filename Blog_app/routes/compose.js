const router = require("express").Router();
const blogSchema = require("../models/blog.model");

router.get("/compose",(req,res)=>{
    res.render("compose");
})
router.post("/compose",async (req,res)=>{
    const {title,content} = req.body;
    const newData = await blogSchema({title,content});
    newData.save()
    .then((val)=>{
        res.render("index")
        console.log("data save in the database successfully");
    }).catch((err)=>{
        console.log("error will occur in the code")
    })
})

router.get("/blog/:id",async (req,res)=>{
    const {id} = req.params;
    const getBlog = await blogSchema.findOne({_id:id});
    res.render("blog",{blog :getBlog})
})
module.exports = router;