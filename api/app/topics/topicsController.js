const { BaseController } = require('../base/baseController');
const { TopicService } = require('./topicsService');

export class TopicsController extends BaseController {
    async index(req, res) {
        res.status(200).send(allTopics());
    }

    async show(req, res) {
        res.status(200).send('TODO');
    }

    async create(req, res) {
        try {
            const topic = {
                topicId: req.body.name,
                mod1_id: req.body.mod1_id,
                mod2_id: req.body.mod2_id,
            };

            await createTopic(topic);
            res.status(201).send(topic);
        } catch (err) {
            res.status(500).send('Internal Server Error');
        }
    }

    async delete(req, res) {
        res.status(200).send('TODO');
    }

    async update(req, res) {
        res.status(200).send('TODO');
    }
}