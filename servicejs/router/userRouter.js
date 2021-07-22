const router = require('express').Router();
const User = require('../model/userModel');
const createError = require('http-errors');
const jwt =require('jsonwebtoken');
require('dotenv').config();
const multer = require('multer');
const path = require('path');
const fs =require('fs');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
      cb(null, 'images')
  },
  filename: (req, file, cb) => {
      console.log(file)
      cb(null, Date.now() + path.extname(file.originalname))
  }
});
const filefilter=(req,file,cb)=>{
  if (file.mimetype==='image/png'|| file.mimetype==='image/jpg'||file.mimetype==='image.jpeg'){
      cb(null,true);
  }else{
      cb(null,false);
  }
}
const upload =multer({storage:storage,fileFilter:filefilter});



//CHECK AUTHORİZATİON BEARER SİDE !!!!!!!!!!!!!!!!!!!!!!!!
//auth function
function authenticate (req,res,next){
  const authHeader =req.headers['Authorization']
  const token = authHeader&&authHeader.split(' ')[1]

  jwt.verify(token,process.env.SECRET_TOKEN,(err,user)=>{
    if(err) return res.status(401)
    req.user=user
    next()
  })
}

router.get('/list', async (req, res,next) => {

    try{
        await User.find({}).then((result) => {
            res.status(200).json(result);
        }).catch((err) => {
            res.json(err);
        });
    }catch(e){
next(createError(400,"BadBoy Request"));
    }

     

});

router.get('/list/:id', async (req, res,next) => {

    try{
         await User.findById({_id:req.params.id}).then((result) => {
            res.json(result)            
        }).catch((err) => {
            res.status(503).json({message:err});
        });;
    
    }catch(e){
        next(createError(400,"Bad Request..."+e));

    }
   
   

});

router.get('/listauth', authenticate,async (req, res,next) => {

  try{
      await User.find({}).then((result) => {
          res.status(200).json(result);
      }).catch((err) => {
          res.json(err);
      });
  }catch(e){
next(createError(400,"BadBoy Request"));
  }

   

});


router.post('/create',upload.single('picture'), async (req, res, next) => {
    try {
        const newUser = new User(req.body);
         await newUser.save().then((result) => {
             res.status(200).json(result);
         }).catch((err) => {
             res.status(503).json(err);
         });
      
        console.log(req.body);
    } catch (e) {
        next(createError(400, 'bad Request'));
    }
});



router.post('/login',async (req,res,next)=>{
    try{
        const user=await User.findOne({username:req.body.username});

if(user.password===req.body.password){

  const accessToken= jwt.sign(user.username,process.env.SECRET_TOKEN);
  res.status(200).json({user,accessToken});

  }else{
    res.status(404).send('Not Found 404');
}
    }catch(e){
next(createError(400,"Bir hata oluştu"+e));
    }

});





router.delete('/list/:id',async(req,res,next)=>{
    try{
const silinecekUser= await User.findByIdAndDelete({_id:req.params.id});
if(silinecekUser){
    res.json(`${req.params.id} id'li kullanıcı yani bu ${silinecekUser.name} isim li kişi silindi`);
    silinecekUser.delete();
}else{
    next(createError(404,'Kullanıcı bulunamadı'));
}
    }catch(e){
next(createError(400,'kullanıcı kaydedilrken hata oluştu'+e));
    }
});

router.put("/follow/:id", async (req, res) => {
    if (req.body.userID !== req.params.id) {
      try {
        const user = await User.findById(req.params.id);
        const currentUser = await User.findById(req.body.userID);
        if (!user.followers.includes(req.body.userID)) {
          await user.updateOne({ $push: { followers: req.body.userID } });
          await currentUser.updateOne({ $push: { following: req.params.id } });
          res.status(200).json("user has been followed");
        } else {
          res.status(403).json("you allready follow this user");
        }
      } catch (err) {
        res.status(500).json(err);
      }
    } else {
      res.status(403).json("you cant follow yourself");
    }
  });
  
  //unfollow a user
  
  router.put("/unfollow/:id", async (req, res) => {
      if (req.body.userID !== req.params.id) {
        try {
          const user = await User.findById(req.params.id);
          const currentUser = await User.findById(req.body.userID);
          if (user.followers.includes(req.body.userID)) {
            await user.updateOne({ $pull: { followers: req.body.userID } });
            await currentUser.updateOne({ $pull: { following: req.params.id } });
            res.status(200).json("user has been unfollowed");
          } else {
            res.status(403).json("you dont follow this user");
          }
        } catch (err) {
          res.status(500).json(err);
        }
      } else {
        res.status(403).json("you cant unfollow yourself");
      }
    });



module.exports = router;