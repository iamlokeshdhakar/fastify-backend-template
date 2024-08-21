import { FastifyInstance, FastifyReply, FastifyRequest } from 'fastify';
import customerRoutes from './customer/customerRoutes';

export default async function clientRoute(fastify: FastifyInstance) {
    fastify.get('/', async (request: FastifyRequest, reply: FastifyReply) => {
        reply.send('Hello from client');
    });

    fastify.register(customerRoutes, { prefix: '/customer' });
}
