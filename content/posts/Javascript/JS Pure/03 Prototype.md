# Prototype

- **Prototypes** are the **mechanism** by which **JavaScript objects inherit features from one another**. 
- Objective:
  - To **understand** **object prototypes**
  - **how prototype chains work**
  - **how to add new methods** onto the **prototype**.

## Definition of prototype

Objects can have a **`prototype` object** – a template object that inherits methods anh properties from.

- A prototype may have its own prototype:

  ![img](https://mdn.mozillademos.org/files/13891/MDN-Graphics-person-person-object-2.png)























```js
function Human(firstName, lastName) {
	this.firstName = firstName,
	this.lastName = lastName,
	this.fullName = function() {
		return this.firstName + " " + this.lastName;
	}
}
```

![Image for post](https://miro.medium.com/max/1612/1*5qHhF8HTzZD2xdx3p-RLIQ.png)

`Constructor property` points to constructor of `Human`.

**The prototype object of the constructor function is shared among all the objects created using the constructor function.**

#### Prototype Object

We can attach properties and methods to the prototype object.

```js
Human.prototype.name = "Ashwin";
Human.prototype["age"] = 26;
```

When we try to access a property of an object, the JavaScript engine first tries to find the property on the object, if the property is present on the object it outputs its value. But, if the property is not present on the object then it tries to find the property on the prototype object or *dunder proto* of the object. If the property is found the value is returned else JavaScript engine tries to find the property on the *dunder proto* of the object. This chain continues until the *dunder proto* property is `null`. In these cases, the output will be `undefined`.

