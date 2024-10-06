const AWS = require('aws-sdk');


// OK so it turns out NoSQL is shit and I am never doing this again. 
// There are no rules and everything is going to go to hell the moment
// we encounter a single access pattern that was not previously planned for. 

// As it is often wont to do anyway. 

// Anyway, putting all of the DynamoDB logic and execution simplifies matters
// greatly. 
class ApplicationModel {
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
        return this.docClient.put({
            TableName: table_name,
            Item: item
        }).promise();
    }
}