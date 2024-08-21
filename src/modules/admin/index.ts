import { FastifyInstance, FastifyReply, FastifyRequest } from 'fastify';
import customerRoutes from './customer/customerRoutes';

export default async function adminRoute(fastify: FastifyInstance) {
    fastify.get('/', async (request: FastifyRequest, reply: FastifyReply) => {
        reply.send('Hello from Admin');
    });

    fastify.register(customerRoutes, { prefix: '/customer' });
}
