"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var future_1 = require("@quenk/noni/lib/control/monad/future");
/**
 * Connection implementation for the MongoClient.
 *
 * This uses a single MongoClient and checkouts individual db references.
 */
var Connection = /** @class */ (function () {
    function Connection(client) {
        this.client = client;
    }
    Connection.prototype.open = function () {
        var _this = this;
        return future_1.fromCallback(function (cb) { return _this.client.connect(cb); })
            .map(function () { return _this; });
    };
    Connection.prototype.checkout = function () {
        return future_1.pure(this.client.db());
    };
    Connection.prototype.close = function () {
        var _this = this;
        return future_1.fromCallback(function (cb) { return _this.client.close(cb); });
    };
    return Connection;
}());
exports.Connection = Connection;
//# sourceMappingURL=connection.js.map