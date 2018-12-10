"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var mongodb_1 = require("mongodb");
var connection_1 = require("./connection");
/**
 * connector for creating Connections to a MongoDB instance.
 */
exports.connector = function (url, opts) {
    if (opts === void 0) { opts = {}; }
    return new connection_1.Connection(new mongodb_1.MongoClient(url, opts));
};
//# sourceMappingURL=index.js.map