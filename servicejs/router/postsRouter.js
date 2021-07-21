const router = require('express').Router();
const PostModel = require('../model/postsModel');
const createError = require('http-errors');
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



//create a post

router.post('/create',upload.single('img'), async (req, res, next) => {

try{
    const postval=new PostModel(req.body);
postval.save().then((result) => {
    res.status(200).json(result);
}).catch((err) => {
    res.status(503).json(err);
});

console.log(req.body);
} catch (e) {
next(createError(400, 'bad Request'));
}


});


router.put('/update/:id', async (req, res, next) => {
    try {
        const deletedPost = await Post.findById(req.params.id);
        if (deletedPost.userID === req.body.userID) {
            res.json(`${req.params.id} id'li kullanıcı güncel ${silinecekUser.name}`);
            await deletedPost.updateOne();
        } else {
            res.status(403).json(`you can update only your post`);
        }

    } catch (e) {
        next(createError(500, `Error occured ${e}`));
    }
});


router.delete('/delete/:id', async (req, res, next) => {
    try {
        const deletedPost = await Post.findById(req.params.id);
        if (deletedPost.userID === req.body.userID) {
            res.json(`${req.params.id} id'li kullanıcı silindi ${silinecekUser.name} isim li kişi silindi`);
            await deletedPost.deleteOne();
        } else {
            res.status(403).json(`you can delete only your post`);
        }

    } catch (e) {
        next(createError(500, `Error occured ${e}`));
    }
});







module.exports = router;