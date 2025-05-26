const router = require("express").Router();
const User = require("../models/usermodel");
 
router.post("/add", async (req, res) => {
  const { name, email, age } = req.body;
  
  // Validate input
        if (!req.body) {
            return res.status(400).json({ error: "Request body is missing" });
        }

  try {
    const newUser = new User({ name, email ,age });
   const saveUser =  await newUser.save(); 
   console.log("New user is saved in the database"+saveUser);
    res.status(201).json({ message: "User added successfully" });
  } catch (err) {
    console.error(" DB Save Error:", err);
    res.status(500).json({ error: "Failed to save user" });
  }
});
router.get("/", async (req, res) => {
  console.log('get all data route call');
  try {
    const allData = await User.find();
    res.status(200).json(allData);
  } catch (err) {
    console.error("Error fetching users:", err);
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = router;