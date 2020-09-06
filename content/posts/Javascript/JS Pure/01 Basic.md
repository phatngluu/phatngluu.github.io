# Basic

#### Syntax

##### `var` & `let`

use `let` as much as possible in your code, rather than `var`. There is no reason to use `var`, unless you need to support old versions of Internet Explorer with your code.

##### Dynamic typing

JavaScript is a "dynamically typed language", which means that, unlike some other languages, you don't need to specify what data type a variable will contain (numbers, strings, arrays, etc).

```js
let myNumber = '500'; // oops, this is still a string
typeof myNumber;
myNumber = 500; // much better — now this is a number
typeof myNumber;
```

#####  [Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number) 

```js
let myNumber = '74';
myNumber + 3;
```

You end up with the result '743', not 77, because `myNumber` is actually defined as a string.

To sum: `Number(myNumber) + 3;`

##### Exponent

`** or Math.pow()`

##### Random

```js
const dieRoll = Math.floor( Math.random() * 6 ) + 1;
```

##### Comparison

`===`, `!==`: strict equality, test the equality of their datatypes, then values.

`==`, `!=`: test whether the values are the same but not whether the values' datatypes are the same.

The equality `==` and strict equality `===` operators for objects work exactly the same.

#### String

##### Slice

`slice(x, y)` : x start, y numbers of characters, when y is omitted -> take to the end of string

##### Template literals

```js
output = `I like the song "${ song }". I gave it a score of ${ score/highestScore * 100 }%.`;
```

Template literals respect the line breaks in the source code, so newline characters are no longer needed. This would achieve the same result:

```js
output = `I like the song "${ song }".
I gave it a score of ${ score/highestScore * 100 }%.`;
```

##### Upper-/lowercase

 `input = input.slice(0,1).toUpperCase() + input.slice(1).toLowerCase();`

##### Convert to String

```
`${value}`
```

