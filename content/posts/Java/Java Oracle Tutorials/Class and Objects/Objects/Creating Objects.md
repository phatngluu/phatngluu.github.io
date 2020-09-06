# Creating Objects

`Point originOne = new Point(23, 94);`

The statement has three parts (discussed in detail below):

1. **Declaration**: The code set in **bold** are all variable declarations that associate a variable name with an object type.
2. **Instantiation**: The `new` keyword is a Java operator that creates the object.
3. **Initialization**: The `new` operator is followed by a call to a constructor, which initializes the new object.

## **Declaration**

You can also declare a reference variable on its own line. For example:

```
Point originOne;
```

- If you declare `originOne` like this, its value will be undetermined until an object is actually created and assigned to it. 

- Simply declaring a reference variable does not create an object. For that, you need to use the `new` operator, as described in the next section. 

- You must assign an object to `originOne` before you use it in your code. Otherwise, you will get a compiler error.

## Instantiating

The `new` operator instantiates a class by allocating memory for a new object and returning a reference to that memory. The `new` operator also invokes the object constructor.

> **Note:** The phrase "instantiating a class" means the same thing as "creating an object." When you create an object, you are creating an "instance" of a class, therefore "instantiating" a class.

The `new` operator returns a reference to the object it created.

The reference returned by the `new` operator does not have to be assigned to a variable. It can also be used directly in an expression. For example:

```java
int height = new Rectangle().height;
```

## Initializing

Initialization of an object happens as follow: run the constructor corresponding with given arguments, it can be assign value for fields of object.

