import { FastifyInstance, FastifyReply, FastifyRequest } from 'fastify';

export default async function customerRoutes(
    fastify: FastifyInstance
): Promise<void> {
    fastify.post(
        '/',
        {
            schema: {
                body: {
                    type: 'object',
                    properties: {
                        displayName: {
                            type: 'string',
                        },
                        email: {
                            type: 'string',
                        },
                        firebaseAuthId: {
                            type: 'string',
                        },
                        phoneNumber: {
                            type: 'string',
                        },
                    },
                },
            },
        },
        async (request: FastifyRequest, reply: FastifyReply) => {
            reply.send(request.body);
        }
    );
}
