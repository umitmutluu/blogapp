const express = require('express');
require('./database/mongdb');
const app =express();
const userRouter=require('./router/userRouter');

app.use(express.json());
app.use(express.urlencoded({extended:true}));


app.use('/api/users',userRouter);











const PORT=process.env.PORT||3000;

app.listen(PORT,()=>{console.log('Server listenin on '+PORT);});