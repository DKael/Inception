
const https = require('https')
const express = require('express')
const fs = require('fs')
const app = express()

// serve static files from the public directory
app.use(express.static('public'))

const options = {
    key: fs.readFileSync('/etc/ssl/private/express-selfsigned.key'),
    cert: fs.readFileSync('/etc/ssl/certs/express-selfsigned.crt')
  };

const server = https.createServer(options, app);

// start the server
server.listen(3000, () => {
    console.log("https server running on port 3000")
})
