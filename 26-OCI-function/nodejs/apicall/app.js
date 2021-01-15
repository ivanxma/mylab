const express = require('express')
const api_helper = require('./API_helper')
const app = express()
const port = 3010

app.get('/', (req, res) => res.send('Welcome to Make REST API Calls In Express!'))
app.get('/getAPIResponse', (req, res) => {
   api_helper.make_API_call('https://oespno4hzgltngu2dvjdwvd5ia.apigateway.us-ashburn-1.oci.customer-oci.com/v2/getuser')
    .then(response => {
        res.json(response)
    })
    .catch(error => {
        res.send(error)
    })
})

app.listen(port, () => console.log(`App listening on port ${port}!`))
