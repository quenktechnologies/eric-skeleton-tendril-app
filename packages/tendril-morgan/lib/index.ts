import { MongoClient, MongoClientOptions } from 'mongodb';
import { Connection } from './connection';

/**
 * connector for creating Connections to a MongoDB instance.
 */
export const connector = (url: string, opts: MongoClientOptions={})
    : Connection => new Connection(new MongoClient(url, opts));
