import { PrismaClient } from '@prisma/client';

// Use a global variable in the Node.js environment to store the PrismaClient instance
const globalForPrisma = global as unknown as { prisma?: PrismaClient };

// Initialize PrismaClient with error handling
let prisma: PrismaClient;

try {
    prisma =
        globalForPrisma.prisma ||
        new PrismaClient({
            log:
                process.env.NODE_ENV === 'production'
                    ? ['error']
                    : ['query', 'info', 'warn', 'error'],
            errorFormat: 'pretty',
        });

    if (process.env.NODE_ENV !== 'production') {
        globalForPrisma.prisma = prisma;
    }

    // Handle graceful shutdown
    process.on('beforeExit', async () => {
        await prisma.$disconnect();
    });
} catch (error) {
    // eslint-disable-next-line no-console
    console.error('Failed to initialize PrismaClient', error);
    throw error;
}

export default prisma;
