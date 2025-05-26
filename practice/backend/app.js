const express = require("express");
const mongoose = require("mongoose");
const app = express();
const cors = require("cors");
const port = 3000;
 

mongoose.connect("mongodb://localhost/user")
  .then(() => console.log('MongoDB connected successfully'))
  .catch(err => {
    console.error(' MongoDB connection error:', err);
    process.exit(1); // Crash the app if DB fails (prevents silent errors)
  });
  // Add this BEFORE app.listen()
process.on('unhandledRejection', (err) => {
  console.error('⚠️ Unhandled Rejection:', err);
});

app.use(cors({
  origin: "*", // Allow all origins (for testing)
  methods: ["GET", "POST"], // Explicitly allow methods
  //  allowedHeaders: ["Content-Type"],
}));

app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use('/',require("./router/index"))

app.listen(port,()=>{
    console.log(`server is started at port number ${port}`);
}) 
