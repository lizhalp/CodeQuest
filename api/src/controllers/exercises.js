const { ApplicationController } = require('./application');

class ExercisesController extends ApplicationController {

    // GET /exercises
    // Return a list of all exercises in the form:
    // [{ id: 1, name: 'Exercise 1', description: '...' }, 
    //  { id: 2, name: 'Exercise 2', description: '...' }, ...]
    // This endpoint will need to be used in order to render the 
    // list of exercises in the frontend.
    index(req, res) {
        res.status(501).send('Not implemented');
    }

    // GET /exercises/:id
    // Return a single exercise in the form:
    // {
    //   id: 2,
    //   name: 'Exercise 2',
    //   description: '...'
    // }
    show(req, res) {
        res.status(501).send('Not implemented');
    }

    // POST /exercises
    // Create a new exercise. The request body should contain the following:
    // {
    //   name: 'Exercise 1',
    //   description: '...'
    // }
    create(req, res) {
        res.status(501).send('Not implemented');
    }

    // DELETE /exercises/:id
    // Delete an exercise by its ID.
    delete(req, res) {
        res.status(501).send('Not implemented');
    }
}

module.exports = { ExercisesController };