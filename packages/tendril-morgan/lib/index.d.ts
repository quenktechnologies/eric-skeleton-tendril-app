import { MongoClientOptions } from 'mongodb';
import { Connection } from './connection';
/**
 * connector for creating Connections to a MongoDB instance.
 */
export declare const connector: (url: string, opts?: MongoClientOptions) => Connection;
