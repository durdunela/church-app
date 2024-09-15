const mongoose = require('mongoose');

const atlasUri = 'mongodb+srv://durdunela:fKDyi8HzoPaErbrS@cluster0.gvvau.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0';

const connection = mongoose.createConnection(atlasUri, { useNewUrlParser: true, useUnifiedTopology: true })
    .on('open', () => {
        console.log("MongoDB Connected");
    })
    .on('error', (err) => {
        console.error("Error connecting MongoDB:", err);
    });

module.exports = connection;
