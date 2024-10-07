const Joi = require('joi');
const { createTopic, allTopics } = require('./topicsRepository');

module.exports.topicsIndex = async (req, res) => {
    res.status(200).send(allTopics());
};

module.exports.topicsShow = async (req, res) => {
    res.status(200).send('TODO');
};

module.exports.topicsCreate = async (req, res) => {
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
};

module.exports.topicsDelete = async (req, res) => {
    res.status(200).send('TODO');
};

module.exports.topicsUpdate = async (req, res) => {
    res.status(200).send('TODO');
};
