import { FastifyReply, FastifyRequest } from 'fastify';

const createCustomer = async (request: FastifyRequest, reply: FastifyReply) => {
    try {
        request.log.info('Create User');
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
        request.log.info('Get User By Id');
    } catch (error) {
        request.log.error(error);
        reply.code(500).send('Internal Server Error');
    }
};

const updateCustomer = async (request: FastifyRequest, reply: FastifyReply) => {
    try {
        request.log.info('Update User By Id');
    } catch (error) {
        request.log.error(error);
        reply.code(500).send('Internal Server Error');
    }
};

const deleteCustomer = async (request: FastifyRequest, reply: FastifyReply) => {
    try {
        request.log.info('Delete User By');
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
