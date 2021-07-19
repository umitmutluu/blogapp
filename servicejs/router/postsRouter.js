const router = require('express').Router();
const Post = require('../model/postsModel');
const createError = require('http-errors');
const multer = require('multer');
const path = require('path');



const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'images')
    },
    filename: (req, file, cb) => {
        console.log(file)
        cb(null, Date.now() + path.extname(file.originalname))
    }
})
const upload =multer({storage:storage});



//create a post

router.post('/create',upload.single('img'), async (req, res, next) => {

    const newPost = new Post(req.body)

    try {
        const savePost = await newPost.save();
        res.status(200).json(savePost);
    } catch (e) {
        next(createError(400, `An Error 1234564554 ${e}`));
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