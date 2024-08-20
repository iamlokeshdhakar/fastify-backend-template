import { FastifyError, FastifyReply, FastifyRequest } from 'fastify';
import { ENV } from '../config/env';

export function handleError(
    error: FastifyError,
    request: FastifyRequest,
    reply: FastifyReply
) {
    const statusCode = error.statusCode || 500;
    const errorMessage =
        ENV.NODE_ENV === 'production' ? 'Internal Server Error' : error.message;

    request.log.error({
        url: request.raw.url,
        params: request.params,
        body: request.body,
        error: errorMessage,
    });

    reply.status(statusCode).send({
        success: false,
        statusCode,
        message: errorMessage,
    });
}
