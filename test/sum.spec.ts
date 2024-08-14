import { FastifyInstance } from 'fastify';
import { buildServer } from '../src/server';
import { addTwo } from '../src/utils/add';
import request from 'supertest';

describe('App', () => {
    let fastify: FastifyInstance;
    beforeAll(async () => {
        fastify = await buildServer();
        await fastify.ready();
    });

    afterAll(async () => {
        await fastify.close();
    });

    it('work', () => {
        const result = addTwo(4, 6);
        expect(result).toBe(10);
    });

    it('should return "Hello" on GET /', async () => {
        const response = await request(fastify.server).get('/');
        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('Hello');
    });
});
