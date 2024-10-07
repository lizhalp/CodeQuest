const express = require("express");
const serverless = require("serverless-http");

const app = express();

app.use(express.json());

app.get('/', (req, res) => {
  res.status(200).send('<html><body><h1>Hello</h1></body></html>');
})

const { topicsIndex, topicsShow, topicsCreate, topicsUpdate, topicsDelete } = require('./topics/topicsController');
app.get('/topics', topicsIndex);
app.get('/topics/:topicId', topicsShow);
app.post('/topics', topicsCreate);
app.patch('/topics/:topicId', topicsUpdate);
app.delete('/tppics/:topicId', topicsDelete);

exports.handler = serverless(app);
