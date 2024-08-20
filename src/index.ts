import { FastifyInstance } from 'fastify';
import { ENV } from './config/env';
import { buildServer } from './server';

async function main() {
    const fastify: FastifyInstance = await buildServer();
    try {
        await fastify.listen({ port: ENV.PORT });
        await fastify.ready();
        await fastify.swagger();
    } catch (error) {
        fastify.log.error(error);
        process.exit(1);
    }
}

main();
