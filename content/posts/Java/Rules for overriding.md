# Rules for overriding

Original from: https://www.geeksforgeeks.org/overriding-in-java/

**Rules:**

- Arguments must the same, and return types must be compatible.
- The method can't be less accessible

**Cannot override:**

- Final methods
- Private methods
- Constructor

## Arguments must the same, and return types must be compatible.

Whatever the superclass takes as an argument, the subclass overriding the method must use that same argument. And whatever the superclass declares as a return type, the overriding method must declare either the same type, or a subclass type.

<img src="Rules%20for%20overriding.assets/image-20200708213931246.png" alt="image-20200708213931246" style="zoom:33%;" />

## The method can't be less accessible

The [access modifier](https://www.geeksforgeeks.org/access-modifiers-java/) for an overriding method can allow more, but not less, access than the overridden method. For example, a protected instance method in the super-class can be made public, but not private, in the subclass. Doing so, will generate compile-time error.

<img src="Rules%20for%20overriding.assets/image-20200708213853305.png" alt="image-20200708213853305" style="zoom: 33%;" />



## Final methods can not be overridden

```java
// A Java program to demonstrate that 
// final methods cannot be overridden 

class Parent { 
	// Can't be overridden 
	final void show() {} 
} 

class Child extends Parent { 
	// This would produce error 
	void show() {} 
} 
```

## Static methods can not be overridden(Method Overriding vs Method Hiding)

When you define a static method with same signature as a static method in base class, it is known as [method hiding](https://www.geeksforgeeks.org/can-we-overload-or-override-static-methods-in-java/).

The following table summarizes what happens when you define a method with the same signature as a method in a super-class.

|                          |   SUPERCLASS INSTANCE METHOD   |    SUPERCLASS STATIC METHOD    |
| :----------------------: | :----------------------------: | :----------------------------: |
| SUBCLASS INSTANCE METHOD |           Overrides            | Generates a compile-time error |
|  SUBCLASS STATIC METHOD  | Generates a compile-time error |    Hides superclass method     |

## 

## The overriding method must have same return type (or subtype)

From Java 5.0 onwards it is possible to have different return type for a overriding method in child class, but child’s return type should be sub-type of parent’s return type. This phenomena is known as covariant return type.

## Invoking overridden method from sub-class

## 

We can not override constructor as parent and child class can never have constructor with same name(Constructor name must always be same as Class name).

# Rules for overloading a method

## The return types can be different

You’re free to change the return types in overloaded methods, as long as the argument lists are different.

## You can’t change ONLY the return type

If only the return type is different, it’s not a valid overload—the compiler will assume you’re trying to override the method. And even that won’t be legal unless the return type is a subtype of the return type declared in the superclass. To overload a method, you MUST change the argument list, although you can change the return type to anything.

## You can vary the access levels in any direction



