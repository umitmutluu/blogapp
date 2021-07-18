const mongoose = require('mongoose');
require('dotenv').config();


mongoose.connect(process.env.MONGO_URL, {
   useNewUrlParser:true,
   useUnifiedTopology:true,
   useCreateIndex:true
}).then(() =>{
    console.log(`Mongo DB connected`);
}).catch(err=>{
    console.log(`something went wrong ${err}`);
});