#### Javascript Objects

Unlike Java, in Javascript, you can create an object without create its class.

##### Example on object declaration

Object's fields can be: array, int, string, function (like method in java).

Below is object declaration, **note that it's not class declaration**:

```js
const person = {
  name : {
    first: 'Bob',
    last: 'Smith'
  },
  age: 32,
  gender: 'male',
  interests: ['music', 'skiing'],
  bio: function() {
    alert(this.name.first + ' ' + this.name.last + ' is ' + this.age + ' years old. He likes ' + this.interests[0] + ' and ' + this.interests[1] + '.');
  },
  greeting: function() {
    alert('Hi! I\'m ' + this.name[0] + '.');
  }
};
```

##### Accessing object's members

Accessing with Dot notation:

```javascript
person.age = 30;
person.name.first = "Mickey";
person.greeting
```

Accessing with Bracket notation:

```javascript
person['age'] = 30;
person['name']['first'] = "Mickey";
```

Keyword `this` 

Inside `bio` function, we call the object's field `age` by `this.age` .

##### Constructor

Back to above example, every time you want to create an object, you have to hardcode again with corresponding data. 

Constructor enables you to passing data for it, then it does the job for you - creating object:

```js
function Person(first, last, age, gender, interests) {
  this.name = {
     first : first,
     last : last
  };
  this.age = age;
  this.gender = gender;
  this.interests = interests;
  this.bio = function() {
    alert(this.name.first + ' ' + this.name.last + ' is ' + this.age + ' years old. He likes ' + this.interests[0] + ' and ' + this.interests[1] + '.');
  };
  this.greeting = function() {
    alert('Hi! I\'m ' + this.name.first + '.');
  };
}
```

Call:

```js
let person1 = new Person('Bob', 'Smith', 32, 'male', ['music', 'skiing']);
```

##### Other ways to create object

```js
1. let person = {}; // empty object
2. let person = new Object(); // empty object
3. let person2 = Object.create(person1); // using person1 as the prototype of the person2
```

##### `document` is an object

```js
document.createElement('div')
```

For each webpage loaded, an instance of `Document` is created, called `document`. 

https://developer.mozilla.org/en-US/docs/Web/API/Document

##### Delete a property from an object

`delete human.firstName; // return true`

***‘delete’*** operator returns true if the delete was successful. It also return true if the property to delete was non-existent or the property could not be deleted

##### Looping through object's properties

```js
const student = {
	name: 'Jess',
	grades: [80, 85, 90, 95]
}
for (let key in student) {
	console.log(`${key} : ${student[key]}`);
}
```

##### Object.keys()

The `Object.keys()` method returns an **array** containing the property names (or keys) of an object. 

```js
const person = {
  name: 'Reggie',
  role: 'Software developer',
  skills: ['JavaScript', 'HTML', 'CSS'],
  isTeacher: true
};
const personProps = Object.keys(person); 
console.log(personProps);
> ["name", "role", "skills", "isTeacher"]
```

##### Object.values()

The `Object.values()` method returns an array of a given object's property **values**, in the same order as provided by a `for...in` loop.

```js
const personVals = Object.values(person); 
> [
>   "Reggie",
>   "Software developer",
>   ["JavaScript","HTML","CSS"],
>   true
> ]
```

##### `this` keyword

The value of `this` is evaluated during the run-time, depending on the context.

Calling without an object: `this == undefined`

Arrow functions are special: they don’t have their “own” `this`. If we reference `this` from such a function, it’s taken from the outer “normal” function.