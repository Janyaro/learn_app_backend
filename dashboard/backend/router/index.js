const router = require("express").Router();
const Item= require("../model/item.model");
router.get('/',(req,res)=>{
    res.send("welcome to the home page");
})


router.post("/add",async (req,res)=>{
  try{
    const {productTitle , productdescription ,stock} = req.body;
    if(productTitle == null && productdescription == null && stock == null){
      res.json("please enter all field properly");
      
    } 
    const newData = new Item({
      productTitle,productdescription,stock
    });
    const saveData = await newData.save()
    console.log("data save in the database successfully");
    res.json({msg:"data save in the database successfully"});
  }catch(e){
console.log(`error will occur in the code ${e}`);
  }
})

router.get("/all",async(req,res)=>{
    const allData = await Item.find();
console.log(allData);
res.json(allData)
})

router.delete("/delete/:id",async(req,res)=>{
  const {id} = req.params;
  const deleteData = await Item.findByIdAndDelete(id)
  console.log(`the given data is delete successfully ${deleteData}`);
  res.json({msg:`The given id ${id} data delete successfully`});
})
module.exports = router;
