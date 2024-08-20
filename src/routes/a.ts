import { FastifyInstance, FastifyReply, FastifyRequest } from 'fastify';

export async function helloRoute(fastify: FastifyInstance) {
    fastify.get('/', async (request, reply) => {
        reply.send('Hello');
    });

    fastify.get(
        '/test',
        {
            schema: {
                tags: ['Common'],
                response: {
                    200: {
                        type: 'object',
                        properties: {
                            status: { type: 'string' },
                            c: { type: 'number' },
                        },
                    },
                },
            },
        },
        async (request: FastifyRequest, reply: FastifyReply) => {
            const a = 5;
            const b = 10;
            const c = a + b;

            reply.send({ status: 'okay', c });
        }
    );
}
