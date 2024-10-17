const { TopicsService } = require('../app/topics/topicsService.js');

test('Retrieving all topics', () => {
    const topicsService = new TopicsService();
    expect(topicsService.allTopics()).toBe('TODO');
});

test('Finding a topic by ID', () => {
    const topicsService = new TopicsService();
    expect(topicsService.findTopicById('TODO')).toBe('TODO'); 
});

test('Creating a topic when parameters are invalid', () => {
    const topicsService = new TopicsService();
    const topicData = {};
    expect(topicsService.createTopic(topicData)).toThrow();
});

test('Creating a topic when parameters are valid', () => {
    const topicsService = new TopicsService();
    const topicData = {};
    expect(topicsService.createTopic(topicData)).toBe(topicData);
});

test('Updating a topic when parameters are invalid', () => {
    const topicsService = new TopicsService();
    const topicData = {};
    expect(topicsService.updateTopic(topicData)).toThrow();
});

test('Updating a topic when parameters are valid', () => {
    const topicsService = new TopicsService();
    const topicData = {};
    expect(topicsService.updateTopic(topicData)).toBe(topicData);
});