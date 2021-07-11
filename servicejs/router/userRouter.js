const router = require('express').Router();
const User = require('../model/userModel');
const createError = require('http-errors');
const bcrypt = require('bcrypt');





router.get('/list', async (req, res) => {
    const allUsers = await User.find({});
    res.json(allUsers);

});

router.get('/list/:id', async (req, res) => {

    try{
        const oneUser = await User.findById({_id:req.params.id});
        if(oneUser){
            res.json(oneUser);
        }else{
            next(createError(404,'Kullanıcı Bulunamadı'));
        }
    }catch(e){
        next(createError(400,"Bad Request..."));

    }
   
   

});
router.post('/create', async (req, res, next) => {
    try {
        const newUser = new User(req.body);
        newUser.password = await bcrypt.hash(newUser.password, 10);
        const val = await newUser.save();
        res.json(val);
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