import { Future, pure } from '@quenk/noni/lib/control/monad/future';
import { ok } from '@quenk/tendril/lib/app/api/http';
import { Request, ActionM } from '@quenk/tendril/lib/app/api';

/**
 * index sends a 200 status with example body text.
 */
export const index = (_: Request): Future<ActionM<undefined>> =>
    pure(ok('It works!'));
