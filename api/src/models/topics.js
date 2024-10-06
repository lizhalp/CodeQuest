import { ApplicationModel } from './application.js';

class Topics extends ApplicationModel {
    constructor(id, prerequisite_topic_id, name, mod1_id, mod2_id, mod3_ids) {
        this.id = id;
        this.prereq_id = prerequisite_topic_id;
        this.name = name;
        this.mod1_id = mod1_id;
        this.mod2_id = mod2_id;
        this.mod3_ids = mod3_ids;
        super();
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

    validations() {
        return {
            id: [
                (id) => id >= 0, 
                'ID must be a positive integer'
            ],
            prereq_id: [
                (prereq_id) => valid_refernce('topics', prereq_id),
                'Prerequisite topic not found. Did you create it first?'
            ],
            name: [
                (name) => name.length > 0 && name.length <= 64,
                'Name must be between 1 and 64 characters'
            ],
            mod1_id: [
                (mod1_id) => valid_refernce('content', mod1_id),
                'Module 1 content not found. Did you create it first?'
            ],
            mod2_id: [
                (mod2_id) => valid_refernce('content', mod2_id),
                'Module 2 content not found. Did you create it first?'
            ],
            mod3_ids: [
                (mod3_ids) => mod3_ids.forEach((id) => valid_refernce('content', id)),
                'One of the module 3 content IDs was not found. Did you create it first?'
            ]
        };
    }
}

export { Topics };