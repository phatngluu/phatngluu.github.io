# Functions

### Default value of function's parameter 

Default parameter values can be boolean, number, function or string. Example:

```js
function greet( name, partOfDay = 'morning' ) {
  return `Good ${partOfDay}, ${name}!`;
}
```

### Skip an argument when calling a function

When calling a function with **default parameters**, which keyword acts as a **placeholder** for the **argument you want to skip**? => `undefined`

### Arrow functions

- You can **omit the parentheses**, if there is **single argument**:

  ```js
  const square = x => {
    return x * x;
  }
  ```

- You need to **include the parentheses** when working with **multiple or no parameters**:

  ```js
  const getArea = (width, length, unit) => {
    const area = width * length;
    return `${area} ${unit}`;
  }
  ```

- You can **omit the `return` keyword**, if your **function body** is only **one line**:

  ```js
  const square = x => { x * x }
  ```

  - Further, when **using an implicit return**, you can **omit {}**:

  ```js
  const square = x => x * x;
  const multiply = (x, y) => x * y;
  const add = (a, b) => a + b;
  const subtract = (a, b) => a - b;
  ```

### Anynomous function

##### Use with event handler

```js
myButton.onclick = function() {
   alert('hello');
}
```

##### Assign an anonymous function to be the value of a variable

```js
const myGreeting = function() {
   alert('hello');
}
myButton.onclick = myGreeting;
```

