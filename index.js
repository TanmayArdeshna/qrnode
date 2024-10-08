const express = require("express");
const app = express();
const prisma = require('./prisma/client');
const bodyParser = require('body-parser');
const cors = require('cors');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// Middleware
app.use(bodyParser.json());
app.use(cors({ origin: '*' })); // Allow all origins for testing purposes

const tokenProvider = { secret: 'your-secret-key' }; // Replace with your actual secret

// Simple logger implementation
const AppLogger = {
    error: (code, message, fullPath, namespace, className, methodName, error) => {
        console.error(`Error Code: ${code}, Message: ${message}, Path: ${fullPath}, Namespace: ${namespace}, Class: ${className}, Method: ${methodName}, Error: ${error}`);
    }
};

// Utility functions
const getIp = (req) => req.ip;
const getHeader = (req, headerName) => req.headers[headerName.toLowerCase()];

// Register API
app.post('/api/UserOperation/Register', async (req, res) => {
    try {
        const { username, password } = req.body;
        const hashedPassword = bcrypt.hashSync(password, 10);
        const user = await prisma.user.create({
            data: {
                username,
                password: hashedPassword
            }
        });

        res.json({
            IsResponse: true,
            ResponseStatus: 'User Registered',
            ErrorCode: null,
            ErrorMsg: null,
            SubErrorCode: null
        });
    } catch (error) {
        AppLogger.error('ECC_6', 'Error message', 'index.js', 'UserOperation', 'Register', 'POST', error);
        res.status(500).json({
            IsResponse: false,
            ResponseStatus: 'Error',
            ErrorCode: 'ECC_6',
            ErrorMsg: 'Internal Server Error',
            SubErrorCode: 'ECC_6'
        });
    }
});

// Login API
app.post('/api/UserOperation/VerifyCredential', async (req, res) => {
    try {
        const { username, password } = req.body;
        const user = await prisma.user.findUnique({
            where: { username }
        });

        if (!user || !bcrypt.compareSync(password, user.password)) {
            // Failure response with a detailed error message
            return res.status(401).json({
                token: "",
                userid: -1,
                isresponse: false,
                responsestatus: "FAIL",
                errorcode: "UR",
                suberrorcode: 60,
                errormsg: "User credentials do not match. If you attempt to log in with invalid credentials much more, your account will be suspended. Please ensure that you enter the correct information to avoid any inconvenience."
            });
        }

        // Generate a new token for the user
        const token = jwt.sign({ userId: user.id }, tokenProvider.secret, { expiresIn: '1d' });

        // Set token in the response header as x-authorization
        res.setHeader('x-authorization', token);

        // Success response
        return res.json({
            token: token,
            userid: user.id,
            isresponse: true,
            responsestatus: "SUCCESS",
            errorcode: "UR",
            suberrorcode: 200,
            errormsg: "success"
        });
    } catch (error) {
        // Log the error and send an internal server error response
        AppLogger.error('ECC_5', 'Error message', 'index.js', 'UserOperation', 'VerifyCredential', 'POST', error);
        return res.status(500).json({
            token: "",
            userid: -1,
            isresponse: false,
            responsestatus: "FAIL",
            errorcode: "ECC_5",
            suberrorcode: 500,
            errormsg: "Internal Server Error"
        });
    }
});

// Start the server and check the Prisma client connection
const startApp = async () => {
    try {
        // Test the database connection
        const result = await prisma.$queryRaw`SELECT 1`;
        console.log('Connection successful:', result);

        // Start the Express server
        
    } catch (error) {
        console.error('Error starting the app:', error);
    }
};

startApp();

const port = 3000;
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
    });
