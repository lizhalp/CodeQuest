/*
    For business logic/validations and whatnot. 

    These objects should stay as plain as possible so 
    that they can be easily tested. Also, we want small
    controllers and small repositories. Dump the extra
    shit in a service, test it.

    Might not seem really necessary for the parts that are
    basic crud operations
*/
class TopicsService {
    findTopicById(id) {}
    createTopic(topicData) {}
    updateTopic(topicData) {}
    allTopics() {}
    deleteTopic(topicData) {}
}