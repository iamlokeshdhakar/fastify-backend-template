import { FastifyInstance } from 'fastify';
import { buildServer } from '../server';
import request from 'supertest';
import addTwo from '../utils/add';

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
        const response = await request(fastify.server).get('/api/admin');
        expect(response.text).toBe('Hello from Admin');
    });
});
