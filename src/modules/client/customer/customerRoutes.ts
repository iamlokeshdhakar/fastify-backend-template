import { FastifyInstance, FastifyReply, FastifyRequest } from 'fastify';

export default async function customerRoutes(
    fastify: FastifyInstance
): Promise<void> {
    fastify.get('/', async (request: FastifyRequest, reply: FastifyReply) => {
        reply.send('Hello from customer');
    });
}
