```js
const https = require('https');

const username = "chalkers";
const url = `https://teamtreehouse.com/${username}.json`;

// Connect to API URL
const request = https.get(url, response => {

    // Emits when 'data' of response comes.
    // Data comes block by block, so the below callback function will be called several times.
    // We concatenate all blocks into one
    response.on('data', data => {
        console.log(data); // Print the buffer
        console.log(data.toString()); // Print buffer as string
    });

    // Emits when the response has fully finished.
    response.on('end', () => {
        console.log('Response ended.');
    });

});
```



```js
console.log(process.argv); // List process argument value
process.argv.slice(2); // List process argv from 3rd position
```

##### Documentation

- [https.get](https://nodejs.org/api/https.html#https_https_get_options_callback)
- [Stream Events - "error"](http://nodejs.org/api/stream.html#stream_event_error)
- [try...catch](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/try...catch)

