## Callback Functions

> A callback function is a function passed into another function as an argument. The function that receives the callback function is often referred to as the "parent" function. The parent function will, at some point in the future, execute or call the callback.

#### Examples

```js
function getUserName(callback) {
  const name = prompt('What is your name?');
  callback(name);
}

function greeting(name) {
  alert('Hello, ' + name);
}

getUserName(greeting); // a reference to the greeting function is passed to the function
```

##### DOM Events

```js
btn.addEventListener('click', () => {
  // Perform some action on click inside this callback
  console.log('I was clicked!');
});
```

##### Iteration methods

```js
const capitalizedFruits = fruits.map( fruit => fruit.toUpperCase() );
const sNames = names.filter( name => {
  return name.charAt(0) === 'S';
});
fruits.forEach( fruit => console.log(fruit) );
```

