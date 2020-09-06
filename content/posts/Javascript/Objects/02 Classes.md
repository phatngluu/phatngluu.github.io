In `01 Objects.md`, we declares object by object literals. As such, you can only define of an object. We're going to learn a new way of declaring related objects by grouping them into a class. 

## Declaring a class

```js
// Declaring a class
class Pet {
	constructor(animal, age, breed, sound) {
    this.animal = animal;
    this.age = age;
    this.breed = breed;
    this.sound = sound;
  }
  
  speak() {
    console.log(this.sound);
  }
}
// Creating instances of class
const money = new Pet('cho', 7, 'longxu', 'yip yip');
const mina = new Pet('cho', 4, 'longxu', 'woof woof');

money.speak();
mina.speak();
```





