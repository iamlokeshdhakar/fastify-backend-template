const logger = {
    development: {
        transport: {
            target: 'pino-pretty',
            options: {
                ignore: 'hostname',
            },
        },
    },
    staging: {
        timestamp: () => `,"time":"${new Date().toLocaleString('en-IN')}"`,
    },
    production: {
        timestamp: () => `,"time":"${new Date().toLocaleString('en-IN')}"`,
    },
    test: false,
};

export default logger;
