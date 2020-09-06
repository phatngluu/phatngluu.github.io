> Being able to get other work done in the meantime is the basis of of async programming.

Full text: https://teamtreehouse.com/library/asynchronous-programming-with-javascript/what-is-asynchronous-programming/the-javascript-call-stack

## What is the Call Stack, and Why Does it Matter?

- JavaScript runtime (or host) environments like the browser and Node have a built-in interpreter that executes JavaScript code. It's called the **JavaScript engine.** 

- The engine has a **mechanism**, called the **call stack**, for **keeping track of the order of function calls** and **where it is in a program** at any given moment.
- The call stack itself can process only one function call at a time (it's single-threaded). Consider the following image:

![](https://image-proxy-cdn.teamtreehouse.com/fde65afcab7f93266872e79f564121a1e8e1eb81/687474703a2f2f74726565686f7573652d636f64652d73616d706c65732e73332e616d617a6f6e6177732e636f6d2f6173796e632d6a732d676966732f6a6176617363726970742d63616c6c2d737461636b2e676966)

- Anytime a function gets called, it gets **pushed** onto the call stack, and any functions called within the original function are pushed higher up onto the call stack. When a function is done executing, it gets **popped** off the top of the call stack, and the next function in the stack gets processed.

- When the call stack finishes executing the last task and there's nothing left to execute, the program finishes, leaving the call stack empty.

## Web APIs

- Whenever the JavaScript environment encounters code that needs to run and execute at a later time, like a `setTimeout()` callback or a network request, that code is handed off to a **special Web API** that **processes the async operation**. 

- Meanwhile, the call stack moves on to other tasks then revisits the async task when it's ready to be dealt with.

- It's important to note that **the asynchronous behavior of JavaScript does not come from the JavaScript engine itself**. Asynchronicity actually comes from the runtime environment. Runtime environments *(like web browsers and Node)* provide APIs that let JavaScript run tasks asynchronously.

- For example, async development in the browser (which is the focus of this course) happens in a number of places using Web APIs like `setTimeout()`, XMLHttpRequest (XHR), Fetch API, and the DOM event API.

![The Call Stack](https://image-proxy-cdn.teamtreehouse.com/e56eabe86b7dd78147a4cd3849be1e51612ded11/687474703a2f2f74726565686f7573652d636f64652d73616d706c65732e73332e616d617a6f6e6177732e636f6d2f6173796e632d6a732d676966732f63616c6c2d737461636b2d7765622d617069732d322e706e67)

## The Callback Queue and Event Loop

The **web APIs** **add** each async **task** to the **callback queue** where they wait to be pushed onto the call stack and executed one at a time. 

Consider:

```js
function func3() {
  console.log('Students!');
}

function func2() {
  console.log('Treehouse');
}

function func1() {
  console.log('Hi');
  setTimeout(func2, 1000)
  func3();
}

func1();

// Hi
// Students!
// Treehouse
```

The image below demonstrates how the `setTimeout` callback function (`func2`) gets handed to off a web API, followed by the callback queue, then executed on the call stack.

![callback queue](https://image-proxy-cdn.teamtreehouse.com/177dcd34c8ba18090a29fca13ce3f1edf810ed86/687474703a2f2f74726565686f7573652d636f64652d73616d706c65732e73332e616d617a6f6e6177732e636f6d2f6173796e632d6a732d676966732f63616c6c6261636b2d71756575652e676966)

## The Event Loop

The event loop has one important job: **monitor the call stack and callback queue**. When **call stack is empty**, the **event loop takes the first task from the callback queue** and **pushes** it onto the **call stack**, and **runs it**.



Example how they works together.

http://latentflip.com/loupe/?code=JC5vbignYnV0dG9uJywgJ2NsaWNrJywgZnVuY3Rpb24gb25DbGljaygpIHsKICAgIHNldFRpbWVvdXQoZnVuY3Rpb24gdGltZXIoKSB7CiAgICAgICAgY29uc29sZS5sb2coJ1lvdSBjbGlja2VkIHRoZSBidXR0b24hJyk7ICAgIAogICAgfSwgMjAwMCk7Cn0pOwoKY29uc29sZS5sb2coIkhpISIpOwoKc2V0VGltZW91dChmdW5jdGlvbiB0aW1lb3V0KCkgewogICAgY29uc29sZS5sb2coIkNsaWNrIHRoZSBidXR0b24hIik7Cn0sIDUwMDApOwoKY29uc29sZS5sb2coIldlbGNvbWUgdG8gbG91cGUuIik7!!!PGJ1dHRvbj5DbGljayBtZSE8L2J1dHRvbj4%3D