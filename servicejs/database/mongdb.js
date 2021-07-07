const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/blogapp', {
    useCreateIndex: true,
    useFindAndModify: false,
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true
}).then(() =>
 console.log('Database connected'
 )).catch((e) => { console.log(`error on ${e}`); });