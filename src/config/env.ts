import { config } from 'dotenv';
import { z } from 'zod';
config();

const envSchema = z.object({
    PORT: z
        .string()
        .default('5000')
        .transform((port) => parseInt(port, 10))
        .refine((port) => port > 0 && port < 65536, {
            message: 'Invalid port number. It must be between 1 and 65535.',
        }),

    NODE_ENV: z
        .enum(['development', 'staging', 'production', 'test'])
        .default('development'),
    DATABASE_URL: z.string(),
});

type Env = z.infer<typeof envSchema>;

export const ENV: Env = envSchema.parse(process.env);
