const { ApplicationController } = require('./application');

class CompletionsController extends ApplicationController {

    // GET /completions
    // Return a list of all completions in the form:
    // [{ id: 1, user_id: 1, exercise_id: 1, completed_at: '...' }, 
    //  { id: 2, user_id: 2, exercise_id: 2, completed_at: '...' }, ...]
    // This endpoint will need to be used in order to render the 
    // list of completions in the frontend.
    index(req, res) {
        res.status(501).send('Not implemented');
    }

    // GET /completions/:id
    // Return a single completion in the form:
    // {
    //   id: 2,
    //   user_id: 2,
    //   exercise_id: 2,
    //   completed_at: '...'
    // }
    show(req, res) {
        res.status(501).send('Not implemented');
    }

    // POST /completions
    // Create a new completion. The request body should contain the following:
    // {
    //   user_id: 1,
    //   exercise_id: 1,
    //   completed_at: '...'
    // }
    create(req, res) {
        res.status(501).send('Not implemented');
    }

    // DELETE /completions/:id
    // Delete a completion by its ID.
    delete(req, res) {
        res.status(501).send('Not implemented');
    }
}

module.exports = { CompletionsController };