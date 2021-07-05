const exp = require('constants');
const express=require('express');
const app=express();


app.use(express.json());
app.use(express.urlencoded({urlencoded:true}));



app.listen