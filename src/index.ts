import { FastifyInstance } from 'fastify';
import { ENV } from './config/envConfig';
import { buildServer } from './server';

async function main() {
    const fastify: FastifyInstance = await buildServer();
    try {
        await fastify.listen({ port: ENV.PORT });
    } catch (error) {
        fastify.log.error('Error in server listening: ', error);
        process.exit(1);
    }
}

main();
