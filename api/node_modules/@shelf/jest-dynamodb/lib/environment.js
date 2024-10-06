"use strict";

var _jestEnvironmentNode = require("jest-environment-node");
/* eslint-disable no-console */

const debug = require('debug')('jest-dynamodb');
module.exports = class DynamoDBEnvironment extends _jestEnvironmentNode.TestEnvironment {
  constructor(config, context) {
    super(config, context);
  }
  async setup() {
    debug('Setup DynamoDB Test Environment');
    await super.setup();
  }
  async teardown() {
    debug('Teardown DynamoDB Test Environment');
    await super.teardown();
  }

  // @ts-ignore
  runScript(script) {
    // @ts-ignore
    return super.runScript(script);
  }
};