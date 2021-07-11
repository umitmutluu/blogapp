const mongoose =require('mongoose');
const Schema=mongoose.Schema;
const createError=require('http-errors');


const userSchema= new Schema({
    name:{
        type:String,
        required:true,
        minlength:3,
        trim:true,
        maxlength:30
    },
    username:{
        type: String,
        required: true,
        unique: true,
        trim: true,
        minlength: 3,
        maxlength: 30,
        lowercase: true
    },
    email: {
        type: String,
        required: true,
        trim: true,
        lowercase: true,
        unique: true

    },
    password: {
        type: String,
        required: true,
        trim: true
    }
},{collection:'Users',timestamps:true});

const User=mongoose.model('User',userSchema);
module.exports=User;