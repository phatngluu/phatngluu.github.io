# Passing Information to a Method or a Constructor

*Parameters* refers to the list of variables in a method declaration. *Arguments* are the actual values that are passed in when the method is invoked. When you invoke a method, the arguments used must match the declaration's parameters in type and order.

## Parameter Types

You can use any data type for a parameter of a method or a constructor. This includes primitive data types, such as doubles, floats, and integers,... and reference data types, such as objects and arrays.

**Note:** If you want to **pass a method** **into a method**, then use a [lambda expression](https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html) or a [method reference](https://docs.oracle.com/javase/tutorial/java/javaOO/methodreferences.html). 

## Arbitrary Number of Arguments 

When you **don't know how many of a particular type of argument will be passed** to the method, you should use **Varargs**. It allows you to **pass an arbitrary number of values (have the same type)** to a method. 

*Varargs*  allows you to pass an arbitrary number of values to a method. 

This is a shortcut to creating an array manually: you add `...` **after the type of the** **last parameter**, then a **space**, and the parameter **name**. The method can then be called with any number of that parameter, including none. Example:

```java
public void myMethod(String... strings){
    // method body
}
```

In above example, you could call it as any of the following:

```java
myMethod(); // Likely useless, but possible
myMethod("one", "two", "three");
myMethod("solo");
myMethod(new String[]{"a", "b", "c"});
```

**Important Note:** The argument(s) passed in this way is always an array - even if there's just one. Make sure you treat it that way in the method body.

**Important Note 2:** The argument that gets the `...` must be the last in the method signature. So, `myMethod(int i, String... strings)` is okay, but `myMethod(String... strings, int i)` is not okay.

## Parameter Names

```java
public class Circle {
    private int x, y, radius;
    public void setOrigin(int x, int y) {
        ...
    }
}
```

A parameter can have the same name as one of the class's fields. If this is the case, the parameter is said to *shadow* the field. 

So using the simple names `x` or `y` within the body of the method refers to the parameter, *not* to the field. To access the field, you must use a qualified name (using `this` keyword).

## Passing Primitive Data Type Arguments

Primitive arguments, such as an `int` or a `double`, are passed into methods *by value*. This means that any changes to the values of the parameters exist only within the scope of the method. When the method returns, the parameters are gone and any changes to them are lost.

## Passing Reference Data Type Arguments

Reference data type parameters, such as objects, are also passed into methods *by value*. This means that when the method returns, the passed-in reference still references the same object as before. *However*, the values of the object's fields *can*be changed in the method, if they have the proper access level.

