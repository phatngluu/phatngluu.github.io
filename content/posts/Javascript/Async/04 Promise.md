### What is a Promise?

Formal:

> Promise is the eventual value or result of an async operation.

Informal:

> It's like a pager (The Coffee House). It informs user whenever the "async action" was resolved or rejected.

### How does promise work?

##### Promise states

Pending, Resolved and Rejected.

##### Working with promises

- **Create a promise instance** using the Promise() constructor
- **Define what** should **happen** when the promise is **fulfilled** or **rejected**.
- **Consume the value** of a **fulfilled** promise, or **provide** a rejection **reason** for a **rejected** promise.

##### Syntax

```js
let promise = new Promise( (resolve, reject) => {
  // do (async) work
  // if (success)
  // 		resolve(success_data/success_msg)
  // else reject(error_message)
});
promise.then( (success_data/success_msg) => processSuccess())
       .catch( err => console.log(err) )
```

##### Example Promise

```js
let p = new Promise((resolve, reject) => {
	let a = 1 + 1 // simple work
  if (a == 2) {
    resolve('Success') // passing data or message
  } else {
    reject('Failed') // passing error message 
  }
})

p.then( (msg) => {
  console.log('From then. Message: ' + msg)
}).catch( (msg) => {
  console.log('From catch. Message: ' + msg)
})
```

### `Promise.all()`

Which of the following best describes `Promise.all()`?

> Promise.all joins multiple individual promises into a single returned Promise when all of the promises resolve.

`Promise.all()` rejects the entire promise if any of the promises passed to it fail.

> True. Promise.all is an "all or nothing" operation. Either all of the promises passed to it succeed or none of them do.

##### Example

```js
const recordVideoOne = new Promise((resolve, reject) => {
  resolve('Video 1 Recorded')
})

const recordVideoTwo = new Promise((resolve, reject) => {
  resolve('Video 2 Recorded')
})

const recordVideoThree = new Promise((resolve, reject) => {
  resolve('Video 3 Recorded')
})

Promise.all([
  recordVideoOne,
  recordVideoTwo,
  recordVideoThree
]).then(messages => {
  console.log(messages)
})
```

The code above combines three promises into one promise as soon as all of them are completed. It will rejected as soon as a promise was rejected. Only then can `then()` or `catch()` is called.

### `Promise.race()`

The **`Promise.race()`** method returns a promise that fulfills or rejects as soon as one of the promises in an iterable fulfills or rejects, with the value or reason from that promise.

### Quiz

Which method returns a promise object that is resolved with a given value?

> `resolve()`

Complete the code by writing the method that gets the resolved value out of the promise returned by `dataPromise`.
```js
 dataPromise
  .then( data => console.log(data) )
```

A promise represents:

> the eventual completion of an asynchronous operation

Promises let you handle errors (or rejected promises) with a method called: 

> `catch()`

Which method gets called once a promise is fully settled, regardless of whether the promise is fulfilled or rejected?

> `finally()`

What does the `fetch()` method return?

> fetch() returns a Promise that resolves to a Promise object

What mandatory argument does the `fetch()` method take?

> The path to the resource to fetch

Complete the code by using the method that fetches resources across the network, and the method that parses a `Response` stream to JSON.

```js
fetch('api.cooldogs.com')
	.then( res => res.json() )
	.then( json => console.log(json) )
```

