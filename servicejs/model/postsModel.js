const mongoose=require('mongoose');

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
      type:String,
      default:""
  },
  likes:{
      type:Array,
      default:[]
  }
},{timestamps:true})


module.exports =mongoose.model("Posts",PostSchema);