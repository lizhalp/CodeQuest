const { ApplicationController } = require('./application');

class LanguagesController extends ApplicationController {

    // GET /languages
    // Return a list of all languages in the form:
    // [{ id: 1, name: 'JavaScript', version: 'ES6' }, 
    //  { id: 2, name: 'Python', version: '3.8' }, ...]
    // This endpoint will need to be used in order to render the 
    // list of languages in the frontend.
    index(req, res) {
        res.status(501).send('Not implemented');
    }

    // GET /languages/:id
    // Return a single language in the form:
    // {
    //   id: 2,
    //   name: 'Python',
    //   version: '3.8'
    // }
    show(req, res) {
        res.status(501).send('Not implemented');
    }

    // POST /languages
    // Create a new language. The request body should contain the following:
    // {
    //   name: 'JavaScript',
    //   version: 'ES6'
    // }
    create(req, res) {
        res.status(501).send('Not implemented');
    }

    // DELETE /languages/:id
    // Delete a language by its ID.
    delete(req, res) {
        res.status(501).send('Not implemented');
    }
}

module.exports = { LanguagesController };