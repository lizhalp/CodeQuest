const ApplicationModel = require('./application');

class Topics extends ApplicationModel {
    constructor(id, prerequisite_topic_id, name, mod1_id, mod2_id, mod3_ids) {
        this.id = id;
        this.prerequisite_topic_id = prerequisite_topic_id;
        this.name = name;
        this.mod1_id = mod1_id;
        this.mod2_id = mod2_id;
        this.mod3_ids = mod3_ids;
    }
    
    async index() {
        return undefined;
    }

    async show(id) {
        return find('topics', id);
    }

    async create(topic) {
        return undefined;
    }

    async update(id, topic) {
        return undefined;
    }
}

module.exports = Topics;