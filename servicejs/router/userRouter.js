const router = require('express').Router();
const User = require('../model/userModel');
const createError = require('http-errors');





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
         await User.findById({_id:req.params.id}).then((result) => {g
            res.json(result)            
        }).catch((err) => {
            res.status(503).json({message:err});
        });;
    
    }catch(e){
        next(createError(400,"Bad Request..."+e));

    }
   
   

});
router.post('/create', async (req, res, next) => {
    try {
        const newUser = new User({
            name:req.body.name,
            username:req.body.username,
            email:req.body.email,
            password:req.body.password,
        });
        const val = await newUser.save();
        res.status(200).json(val);
        console.log(req.body);
    } catch (e) {
        next(createError(400, 'bad Request'));
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




module.exports = router;