### Getter & Setter

```js
class Pet {
  constructor(animal, age, breed) {
    this.animal = animal;
    this.age = age;
    this.breed = breed;
  }

  get owner(){
    return this._owner;
  }
  set owner(owner) {
    this._owner = owner;
  }
  
} 

const ernie = new Pet('dog', 1, 'pug');
ernie.owner = "Ashley"; // setter
ernie.owner; // getter
console.log(ernie); // object
```

**Console:**

> `Pet { animal: 'dog', age: 1, breed: 'pug', _owner: 'Ash' }  `

**NOTE:**

- Calling getter by its name without parentheses.

  ```js
  ernie.owner;
  ```

- Calling setter by its name without parentheses.

  ```js
  ernie.owner = "Ashley";
  ```

- Setter and getter have the same name!!! But it works difference as shown above.

- The real property that contains value is _owner. See in Console.

- When declaring a getter or setter methods in an object. They are not attached to the object – not object's properties.

### Backing property convention

As convention, place an underscore before property name  which is used by getter/setter. Call that property is `backing property`.

```js
  get owner(){
    return this._owner;
  }
  set owner(owner) {
    this._owner = owner;
  }
```

