// Define the API Gateway endpoints
const apiGatewayEndpoints = {
    webserverSetup: '<API-Gateway-Endpoint-WebserverSetup>',
    systemBackup: '<API-Gateway-Endpoint-SystemBackup>',
    systemLogs: '<API-Gateway-Endpoint-SystemLogs>',
    webserverLogs: '<API-Gateway-Endpoint-WebserverLogs>',
};

// Function to redirect to the corresponding API endpoint
function redirectTo(endpointKey) {
    const endpoint = apiGatewayEndpoints[endpointKey];
    if (endpoint) {
        window.location.href = endpoint;
    } else {
        console.error(`Invalid endpoint key: ${endpointKey}`);
    }
}
