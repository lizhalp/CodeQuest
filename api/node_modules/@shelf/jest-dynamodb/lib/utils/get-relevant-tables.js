"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = getRelevantTables;
function getRelevantTables(dbTables, configTables) {
  const configTableNames = configTables.map(configTable => configTable.TableName);
  return dbTables.filter(dbTable => configTableNames.includes(dbTable));
}