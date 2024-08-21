/* eslint-disable no-console */
import { PrismaClient, Tenant } from '@prisma/client';

const prisma = new PrismaClient();

/**
 * Default tenant data for initialization
 * @type {Prisma.TenantCreateArgs['data']}
 */
const defaultTenantData = {
    active: true,
    name: 'Default tenant',
    defaultTenant: true,
};

/**
 * Ensures that a default tenant exists in the database.
 * Creates a default tenant if none is found.
 */
async function createDefaultTenantIfNotExists() {
    try {
        const existingTenants: Tenant[] = await prisma.tenant.findMany({
            where: {
                defaultTenant: true,
            },
        });

        if (existingTenants.length > 0) {
            console.log('Default tenant already exists. No action required.');
            return;
        }

        console.log(
            'Default tenant not found. Creating a new default tenant...'
        );
        await prisma.tenant.create({
            data: defaultTenantData,
        });
        console.log('Default tenant created successfully.');
    } catch (error) {
        console.error('Failed to initialize default tenant:', error);
    } finally {
        console.log('Disconnecting from the database...');
        await prisma.$disconnect();
    }
}

createDefaultTenantIfNotExists();
