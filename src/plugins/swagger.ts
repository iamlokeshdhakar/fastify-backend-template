import { FastifyInstance } from 'fastify';
import swagger from '@fastify/swagger';
import swaggerUI from '@fastify/swagger-ui';
import { swaggerOptions, swaggerUiOptions } from '../config/swaggerConfig';

export async function registerSwagger(fastify: FastifyInstance) {
    try {
        await fastify.register(swagger, swaggerOptions);
        await fastify.register(swaggerUI, swaggerUiOptions);
    } catch (err) {
        fastify.log.error(`Error registering Swagger: ${err}`);
        throw err;
    }
}
