const mongoose = require('mongoose');


mongoose.connect("mongodb+srv://admin:112224448Aa--@cluster0.hg85r.mongodb.net/myFirstDatabase?retryWrites=true", {
   useNewUrlParser:true,
   useUnifiedTopology:true,
   useCreateIndex:true
}).then(() =>{
    console.log(`Mongo DB connected`);
}).catch(err=>{
    console.log(`something went wrong ${err}`);
});