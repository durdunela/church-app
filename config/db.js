const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://localhost:27017/ChurchApp').on('open', () => {
    console.log("MongoDB Connected");
}).on('error', () => {
    console.log("Error connecting MongoDB");
});

module.exports = connection;