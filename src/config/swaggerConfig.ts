import { SwaggerOptions } from '@fastify/swagger';
import { FastifySwaggerUiOptions } from '@fastify/swagger-ui';

export const swaggerOptions: SwaggerOptions = {
    openapi: {
        openapi: '3.0.0',
        info: {
            title: 'Fastify Backend API',
            description: 'API documentation for Fastify Backend',
            version: '0.1.0',
        },
        tags: [
            { name: 'User', description: 'User related end-points' },
            { name: 'Admin', description: 'Admin related end-points' },
            {
                name: 'Employees',
                description: 'Employees related end-points',
            },
            {
                name: 'Notification',
                description: 'Notification related end-points',
            },

            {
                name: 'Organization',
                description: 'Organization related end-points',
            },

            {
                name: 'Role',
                description: 'Role related end-points',
            },
            {
                name: 'Permission',
                description: 'Permission related end-points',
            },
            {
                name: 'Setting',
                description: 'Setting related end-points',
            },
            {
                name: 'Common',
                description: 'Common related end-points',
            },
        ],
        servers: [
            {
                url: 'http://localhost:5000',
                description: 'Development server',
            },
            {
                url: 'http://localhost:5000',
                description: 'Staging server',
            },
            {
                url: 'http://localhost:5000',
                description: 'Production server',
            },
        ],

        components: {
            securitySchemes: {
                apiKey: {
                    type: 'apiKey',
                    name: 'apiKey',
                    in: 'header',
                },
            },
        },
        externalDocs: {
            url: 'https://swagger.io',
            description: 'Find more info here',
        },
    },
};

export const swaggerUiOptions: FastifySwaggerUiOptions = {
    routePrefix: '/api-docs',
    uiConfig: {
        docExpansion: 'none',
        deepLinking: false,
    },
    uiHooks: {
        onRequest: function (request, reply, next) {
            next();
        },
        preHandler: function (request, reply, next) {
            next();
        },
    },
    staticCSP: true,
    transformStaticCSP: (header) => header,
    transformSpecificationClone: true,
};
