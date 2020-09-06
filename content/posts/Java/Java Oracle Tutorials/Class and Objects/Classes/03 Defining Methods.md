# Defining Methods

More generally, method declarations have six components, in order:

1. Modifiers—such as public, private, and others you will learn about later.
2. The return type—the data type of the value returned by the method, or void if the method does not return a value.
3. The method name—the rules for field names apply to method names as well, but the convention is a little different.
4. The parameter list in parenthesis—a comma-delimited list of input parameters, preceded by their data types, enclosed by parentheses, (). If there are no parameters, you must use empty parentheses.
5. An exception list—to be discussed later.
6. The method body, enclosed between braces—the method's code, including the declaration of local variables, goes here.

## Method Signature

**Method signature—the method's name and the parameter types.**

For example: `calculateAnswer(double, int, double, double)`

## Overloading Methods

- Java can **distinguish** between methods with **different method signatures**. 

  *=> This means that methods within a class can have the same name if they have different parameter lists*

- You **cannot declare** **more than one** method with the **same name** and the **same number and type of arguments**, because the compiler cannot tell them apart.

- Compiler does **not consider return type** when differentiating methods

> Note: Overloaded methods should be used sparingly, as they can make code much less readable.

