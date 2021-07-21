const mongoose=require('mongoose');
const fs =require('fs');
const path=require('path');


const PostSchema=new mongoose.Schema({
  userID:{
    type:String,
    required:true
  },
  desc:{
    type:String,
    maxlength:100
  },
  img:{
      type:Buffer,
      contentType:String,
      default:""
    },
  likes:{
      type:Array,
      default:[]
  }
},{timestamps:true})


module.exports =mongoose.model("Posts",PostSchema);