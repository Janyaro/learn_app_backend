const router = require("express").Router();
const Blog = require("../models/blog.model");
router.get("/all", async (req, res) => {
  try {
    console.log("GET /all endpoint hit"); // Debug log
    const allData = await Blog.find();
    res.status(200).json(allData);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});



router.post("/addData", async (req, res) => {
  try {
    const { title, content } = req.body;
    const newData = await Blog({ title, content });
    const savedData = await newData.save();

    console.log("Data saved successfully");
    res.status(201).json(savedData); // ✅ Send back the created blog post
  } catch (err) {
    console.error("Error saving data:", err);
    res.status(500).json({ error: err.message }); // ✅ Proper error response
  }
});



module.exports = router;