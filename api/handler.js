const express = require("express");
const serverless = require("serverless-http");

const app = express();

app.use(express.json());

app.get('/', (req, res) => {
  res.status(200).send('<html><body><h1>Hello</h1></body></html>');
})

const { TopicsController } = require('./app/topics/topicsController');
const topics = new TopicsController();

app.get('/topics', topics.index);
app.get('/topics/:topicId', topics.show);
app.post('/topics', topics.create);
app.patch('/topics/:topicId', topics.update);
app.delete('/tppics/:topicId', topics.delete);

exports.handler = serverless(app);
