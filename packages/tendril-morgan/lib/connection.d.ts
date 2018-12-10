import * as conn from '@quenk/tendril/lib/app/connection';
import { MongoClient, Db } from 'mongodb';
import { Future } from '@quenk/noni/lib/control/monad/future';
/**
 * Connection implementation for the MongoClient.
 *
 * This uses a single MongoClient and checkouts individual db references.
 */
export declare class Connection implements conn.Connection {
    client: MongoClient;
    constructor(client: MongoClient);
    open(): Future<conn.Connection>;
    checkout(): Future<Db>;
    close(): Future<void>;
}
