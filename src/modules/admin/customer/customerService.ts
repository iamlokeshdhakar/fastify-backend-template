import prisma from '../../../config/prisma';

interface CreateCustomerProps {
    displayName: string;
    email: string;
    firebaseAuthId: string;
    lastLogin: Date;
    phoneNumber: string;
}

const createCustomer = async ({
    displayName,
    email,
    firebaseAuthId,
    lastLogin,
    phoneNumber,
}: CreateCustomerProps) => {
    const createCustomer = await prisma.customer.create({
        data: {
            displayName,
            email,
            firebaseAuthId,
            lastLogin,
            phoneNumber,
        },
    });
    return createCustomer;
};

const getCustomer = async ({ id }: { id: string }) => {
    const getCustomer = await prisma.customer.findFirst({
        where: {
            id,
        },
    });
    return getCustomer;
};

const updateCustomer = async ({ id }: { id: string }) => {
    const updateCustomer = await prisma.customer.update({
        where: {
            id,
        },
        data: {
            displayName: 'New Data',
        },
    });
    return updateCustomer;
};
const deleteCustomer = async ({ id }: { id: string }) => {
    const deleteCustomer = await prisma.customer.delete({
        where: {
            id,
        },
    });

    return deleteCustomer;
};

export const customerService = {
    createCustomer,
    getCustomer,
    updateCustomer,
    deleteCustomer,
};
