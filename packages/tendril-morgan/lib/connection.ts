import * as conn from '@quenk/tendril/lib/app/connection';
import { MongoClient, Db } from 'mongodb';
import { Future, pure, fromCallback } from '@quenk/noni/lib/control/monad/future';

/**
 * Connection implementation for the MongoClient.
 *
 * This uses a single MongoClient and checkouts individual db references.
 */
export class Connection implements conn.Connection {

    constructor(public client: MongoClient) { }

    open(): Future<conn.Connection> {

        return fromCallback(cb => this.client.connect(cb))
            .map(() => <conn.Connection>this);

    }

    checkout(): Future<Db> {

        return pure(this.client.db());

    }

    close(): Future<void> {

        return fromCallback(cb => this.client.close(cb));

    }

}
