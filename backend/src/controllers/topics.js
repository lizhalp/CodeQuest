const ApplicationController = require('./application');

class TopicsController extends ApplicationController {

    // GET /topics
    // Return a list of all topics in the form:
    // [{ id: 1, prerequisite_topic_id: NULL, name: 'topic1' }, 
    //  { id: 2, name: 'topic2' }, ...]
    // This endpoint will need to be used in order to render the 
    // graph of topics with prerequisite relationships, etc, in the frontend.
    index(req, res) {
        res.status(501).send('Not implemented');
    }

    // GET /topics/:id
    // Return a single topic in the form:
    // {
    //   id: 2,
    //   prerequisite_topic_id: 1,
    //   name: 'topic2',
    //   mod1_content_id: { id: 1, name: 'content1' },
    //   mod2_content_id: { id: 2, name: 'content2' },
    //   mod3_content_ids: [
    //      { id: 3, name: 'content3' }, 
    //      { id: 4, name: 'content4' }
    //   ]
    // }
    show(req, res) {
        res.status(501).send('Not implemented');
    }

    // POST /topics
    // Create a new topic. The request body should contain the following:
    // {
    //   prerequisite_topic_id: 1, DEFAULT=1
    //   name: 'topic2',           NOT NULL
    //   mod1_content_id: 1,       NOT NULLABLE
    //   mod2_content_id: 2,       NOT NULLABLE
    //   mod3_content_ids: [3, 4]  NULLABLE
    // }
    create(req, res) {
        res.status(501).send('Not implemented');
    }

    // PUT /topics/:id
    // Update a topic. The request body should contain a subset of the following:
    // {
    //   prerequisite_topic_id: 1,
    //   name: 'topic2',
    //   mod1_content_id: 1,
    //   mod2_content_id: 2,
    //   mod3_content_ids: [3, 4]
    // }
    update(req, res) {
        res.status(501).send('Not implemented');
    }
}