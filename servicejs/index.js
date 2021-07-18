const express = require('express');
require('./database/mongdb');
const app =express();
const userRouter=require('./router/userRouter');
const postRouter=require('./router/postsRouter');
const helmet=require('helmet');
const morgan=require('morgan');

app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(helmet());
app.use(morgan("common"));



app.use('/api/users',userRouter);
app.use('/routes/post',postRouter);

app.get('/',(req,res)=>{
    res.status(200).json({message:"Welcommmeennnn aslanımmmm"});
});









const PORT=process.env.PORT||3000;

app.listen(PORT,()=>{console.log('Server listenin on '+PORT);});