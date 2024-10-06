const AWS = require('aws-sdk');


// OK so it turns out NoSQL is shit and I am never doing this again. 
// There are no rules and everything is going to go to hell the moment
// we encounter a single access pattern that was not previously planned for. 

// As it is often wont to do anyway. 

// Anyway, putting all of the DynamoDB logic and execution simplifies matters
// greatly. Use validations to enforce any constraints--the DB will not do so for us :(
// See the example in topics for how to write validations with this model setup. 

export class ApplicationModel {
    constructor() {
        this.docClient = new AWS.DynamoDB.DocumentClient();
    }

    find(table_name, id) {
        return this.docClient.get({
            TableName: table_name,
            Key: {
                id: id
            }
        }).promise();
    }

    put(table_name, item) { 
        validate();
        return this.docClient.put({
            TableName: table_name,
            Item: item
        }).promise();
    }

    // Run the validations, return false and first error message if they fail.
    is_valid() {
        const validations = this.validations();
        for (const [field, [validator, errorMessage]] of Object.entries(validations)) {
            if (!validator(this[field])) {
                return false, errorMessage;
            }
        }
        return true, '';
    }

    // Run the validations, throw an error if they fail.
    validate() {
        const [valid, errorMessage] = this.is_valid();
        if (!valid) {
            throw new Error(errorMessage);
        }
        return true;
    }

    valid_presence(field) {
        return this[field] !== undefined;
    }

    valid_reference(table_name, id) {
        return this.find(table_name, id).then((data) => {
            return data.Item !== undefined;
        });
    }
}
