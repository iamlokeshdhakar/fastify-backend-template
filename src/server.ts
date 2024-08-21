import Fastify, { FastifyInstance } from 'fastify';
import logger from './config/logger';
import { ENV } from './config/env';
import { handleError } from './utils/errorHandler';
import { registerSwagger } from './plugins/swagger';
import adminRoute from './modules/admin';
import clientRoute from './modules/client';

export async function buildServer() {
    const fastify: FastifyInstance = Fastify({
        logger: logger[ENV.NODE_ENV] ?? true,
    });

    fastify.setErrorHandler(handleError);

    // Register Plugins
    await registerSwagger(fastify);

    // Register Route
    fastify.register(adminRoute, { prefix: '/api/admin' });
    fastify.register(clientRoute, { prefix: '/api/client' });

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
