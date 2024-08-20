/* eslint-disable @typescript-eslint/no-require-imports */
const autocannon = require('autocannon');

const url = 'http://localhost:5000/';
const connections = 10;
const duration = 10;

function runLoadTest() {
    const instance = autocannon({
        url,
        connections,
        duration,
        title: 'Autocannon Test',
        renderProgressBar: true,
        renderResultsTable: true,
        renderLatencyTable: true,
        renderStatusCodes: true,
    });

    autocannon.track(instance, { renderProgressBar: true });

    instance.on('done', (result) => {
        console.log('Autocannon test completed:');
        console.log(result);
    });

    instance.on('error', (err) => {
        console.error('Error during the load test:', err);
    });

    process.on('SIGINT', () => {
        instance.stop();
    });
}

runLoadTest();
