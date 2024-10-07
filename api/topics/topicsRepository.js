const { DynamoDBClient } = require("@aws-sdk/client-dynamodb");
const { DynamoDBDocumentClient } = require("@aws-sdk/lib-dynamodb");
const { GetCommand, PutCommand, ScanCommand } = require("@aws-sdk/lib-dynamodb");

const TOPICS_TABLE = process.env.TOPICS_TABLE;

const client = new DynamoDBClient();
const docClient = DynamoDBDocumentClient.from(client);

// Returns a promise that resolves to the user with the specified ID
// Returns a promise that resolves to the user with the specified ID
module.exports.findTopic = async (id) => {
    const params = {
        TableName: TOPICS_TABLE,
        Key: { id }
    };
    try {
        const data = await docClient.send(new GetCommand(params));
        return data.Item;
    } catch (err) {
        console.error("Error finding topic:", err);
        throw err;
    }
};

module.exports.createTopic = async (object) => {

    const params = {
        TableName: TOPICS_TABLE,
        Item: { topicId: 'introduction', mod1_id: '1', mod2_id: '2' }
    };
    try {
        await docClient.send(new PutCommand(params));
        return object;
    } catch (err) {
        console.error("Error creating topic:", err);
        throw err;
    }
};

module.exports.allTopics = async () => {
    const params = {
        TableName: TOPICS_TABLE
    };
    try {
        const data = await docClient.send(new ScanCommand(params));
        return data.Items;
    } catch (err) {
        console.error("Error retrieving all topics:", err);
        throw err;
    }
};