import { FastifyReply, FastifyRequest } from 'fastify';
import { customerService } from './customerService';

const createCustomer = async (request: FastifyRequest, reply: FastifyReply) => {
    try {
        const customer = await customerService.createCustomer();
        reply.send({ message: 'Hello from handler', customer });
    } catch (error) {
        request.log.error(error);
        reply.code(500).send('Internal Server Error');
    }
};

const getCustomerById = async (
    request: FastifyRequest,
    reply: FastifyReply
) => {
    try {
        reply.send('Hello from handler');
    } catch (error) {
        request.log.error(error);
        reply.code(500).send('Internal Server Error');
    }
};

const updateCustomer = async (request: FastifyRequest, reply: FastifyReply) => {
    try {
        reply.send('Hello from handler');
    } catch (error) {
        request.log.error(error);
        reply.code(500).send('Internal Server Error');
    }
};

const deleteCustomer = async (request: FastifyRequest, reply: FastifyReply) => {
    try {
        reply.send('Hello from handler');
    } catch (error) {
        request.log.error(error);
        reply.code(500).send('Internal Server Error');
    }
};

export const customerController = {
    createCustomer,
    getCustomerById,
    updateCustomer,
    deleteCustomer,
};
