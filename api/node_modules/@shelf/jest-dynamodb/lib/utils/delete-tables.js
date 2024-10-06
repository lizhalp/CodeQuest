"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = deleteTables;
function deleteTables(dynamoDB, tableNames) {
  return Promise.all(tableNames.map(tableName => dynamoDB.deleteTable({
    TableName: tableName
  })));
}