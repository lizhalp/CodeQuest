const { ApplicationController } = require('./application');

class UsersController extends ApplicationController {

    // GET /users
    // Return a list of all users in the form:
    // [{ id: 1, name: 'user1', email: 'user1@example.com' }, 
    //  { id: 2, name: 'user2', email: 'user2@example.com' }, ...]
    index(req, res) {
        res.status(501).send('Not implemented');
    }

    // GET /users/:id
    // Return a single user in the form:
    // {
    //   id: 2,
    //   name: 'user2',
    //   email: 'user2@example.com'
    // }
    show(req, res) {
        res.status(501).send('Not implemented');
    }

    // POST /users
    // Create a new user. The request body should contain the following:
    // {
    //   name: 'user2',           NOT NULL
    //   email: 'user2@example.com', NOT NULL
    //   password: 'password123'  NOT NULL
    // }
    create(req, res) {
        res.status(501).send('Not implemented');
    }

    // PUT /users/:id
    // Update a user. The request body should contain a subset of the following:
    // {
    //   name: 'user2',
    //   email: 'user2@example.com',
    //   password: 'newpassword123'
    // }
    update(req, res) {
        res.status(501).send('Not implemented');
    }

    // DELETE /users/:id
    // Delete a user. Require admin privileges.
    delete(req, res) {
        res.status(501).send('Not implemented');
    }
}

module.exports = UsersController;