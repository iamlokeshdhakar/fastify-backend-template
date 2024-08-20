import Fastify, { FastifyInstance } from 'fastify';
import logger from './config/logger';
import { ENV } from './config/env';
import { handleError } from './utils/errorHandler';
import { helloRoute } from './routes/a';
import { registerSwagger } from './plugins/swagger';

export async function buildServer() {
    const fastify: FastifyInstance = Fastify({
        logger: logger[ENV.NODE_ENV] ?? true,
    });

    fastify.setErrorHandler(handleError);

    // Register Fastify Plugins
    await registerSwagger(fastify);

    // Register Route
    helloRoute(fastify);

    // Graceful shutdown
    const shutdown = async (signal: string) => {
        fastify.log.info(`Received signal to terminate: ${signal}`);
        try {
            await fastify.close();
            fastify.log.info('Server closed gracefully');
        } catch (err) {
            fastify.log.error('Error during server shutdown:', err);
        } finally {
            setTimeout(() => process.exit(0), 1000);
        }
    };

    process.on('SIGINT', () => shutdown('SIGINT'));
    process.on('SIGTERM', () => shutdown('SIGTERM'));

    return fastify;
}
