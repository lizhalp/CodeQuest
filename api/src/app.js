import path from 'path';
import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import compression from 'compression';
import { getCurrentInvoke } from '@codegenie/serverless-express';
import { TopicsController } from './controllers/topics.js';

const app = express();
const router = express.Router();

router.use(compression());
router.use(cors());
router.use(bodyParser.json());
router.use(bodyParser.urlencoded({ extended: true }));

// Bind controller methods to routes here:
const topics = new TopicsController();

router.get('/topics', topics.index);
router.get('/topics/:id', topics.show);
router.post('/topics', topics.create);
router.put('/topics/:id', topics.update);
router.delete('/topics/:id', topics.delete);

// The serverless-express library creates a server and listens on a Unix
// Domain Socket for you, so you can remove the usual call to app.listen.
// app.listen(3000)
app.use('/', router);