const { ApplicationController } = require('./application');

class ContentController extends ApplicationController {

    // GET /content
    // Return a list of all content items in the form:
    // [{ id: 1, title: 'Content 1', body: 'Body of content 1' }, 
    //  { id: 2, title: 'Content 2', body: 'Body of content 2' }, ...]
    index(req, res) {
        res.status(501).send('Not implemented');
    }

    // GET /content/:id
    // Return a single content item in the form:
    // {
    //   id: 2,
    //   title: 'Content 2',
    //   body: 'Body of content 2'
    // }
    show(req, res) {
        res.status(501).send('Not implemented');
    }

    // POST /content
    // Create a new content item. The request body should contain the following:
    // {
    //   title: 'Content 2',           NOT NULL
    //   body: 'Body of content 2'     NOT NULL
    // }
    create(req, res) {
        res.status(501).send('Not implemented');
    }

    // PUT /content/:id
    // Update a content item. The request body should contain a subset of the following:
    // {
    //   title: 'Updated Content 2',
    //   body: 'Updated body of content 2'
    // }
    update(req, res) {
        res.status(501).send('Not implemented');
    }

    // DELETE /content/:id
    // Delete a content item. Require admin privileges.
    delete(req, res) {
        res.status(501).send('Not implemented');
    }
}

module.exports = ContentController;