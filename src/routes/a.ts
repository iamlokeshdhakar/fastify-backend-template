import { FastifyInstance } from 'fastify';

export async function helloRoute(fastify: FastifyInstance) {
    fastify.get('/', async (request, reply) => {
        reply.send('Hello');
    });
}
