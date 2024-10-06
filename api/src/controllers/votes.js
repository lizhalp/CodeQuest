const { ApplicationController } = require('./application');

class VotesController extends ApplicationController {

    // GET /votes
    // Return a list of all votes in the form:
    // [{ id: 1, user_id: 1, submission_id: 1, value: 1 }, 
    //  { id: 2, user_id: 2, submission_id: 2, value: -1 }, ...]
    // This endpoint will need to be used in order to render the 
    // list of votes in the frontend.
    index(req, res) {
        res.status(501).send('Not implemented');
    }

    // GET /votes/:id
    // Return a single vote in the form:
    // {
    //   id: 2,
    //   user_id: 2,
    //   submission_id: 2,
    //   value: -1
    // }
    show(req, res) {
        res.status(501).send('Not implemented');
    }

    // POST /votes
    // Create a new vote. The request body should contain the following:
    // {
    //   user_id: 1,
    //   submission_id: 1,
    //   value: 1
    // }
    create(req, res) {
        res.status(501).send('Not implemented');
    }

    // DELETE /votes/:id
    // Delete a vote by its ID.
    delete(req, res) {
        res.status(501).send('Not implemented');
    }
}

module.exports = { VotesController };