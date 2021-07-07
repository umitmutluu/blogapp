const router=require('express').Router();
const User=require('../model/userModel');
const createError=require('http-errors');
const bcrypt=require('bcrypt');





router.get('/list', async (req, res) => {
    const allUsers = await User.find({});
    res.json(allUsers);

});


router.post('/create',async(req,res,next)=>{
    try{
const newUser=new User(req.body);
newUser.password=await bcrypt.hash(newUser.password,10);
const val =await newUser.save();
res.json(val);
    }catch(e){
next(createError(400,'bad Request'));
    }
});



module.exports=router;