const { ApplicationController } = require('./application');

class SubmissionsController extends ApplicationController {

    // GET /submissions
    // Return a list of all submissions in the form:
    // [{ id: 1, user_id: 1, exercise_id: 1, content: '...' }, 
    //  { id: 2, user_id: 2, exercise_id: 2, content: '...' }, ...]
    // This endpoint will need to be used in order to render the 
    // list of submissions in the frontend.
    index(req, res) {
        res.status(501).send('Not implemented');
    }

    // GET /submissions/:id
    // Return a single submission in the form:
    // {
    //   id: 2,
    //   user_id: 2,
    //   exercise_id: 2,
    //   content: '...'
    // }
    show(req, res) {
        res.status(501).send('Not implemented');
    }

    // POST /submissions
    // Create a new submission. The request body should contain the following:
    // {
    //   user_id: 1,
    //   exercise_id: 1,
    //   content: '...'
    // }
    create(req, res) {
        res.status(501).send('Not implemented');
    }

    // DELETE /submissions/:id
    // Delete a submission by its ID.
    delete(req, res) {
        res.status(501).send('Not implemented');
    }
}

module.exports = { SubmissionsController };