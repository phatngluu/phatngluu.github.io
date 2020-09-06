# Initializing Fields

- Initialization can be put on one line: `public static int capacity = 10;`
- **If initialization requires some logic** (for example, error handling or a `for` loop to fill a complex array), simple assignment is inadequate. 
  - **Instance variables** can be initialized in constructors, where error handling or other logic can be used. 
  - For **class variables**, the Java programming language includes *static initialization blocks*.

## Static Initialization Blocks

A *static initialization block* is a normal block of code enclosed in braces, `{ }`, and preceded by the `static` keyword. Here is an example:

```
static {
    // whatever code is needed for initialization goes here
}
```

There is an **alternative to static blocks** — you can write a **private static method**:

```
class Whatever {
    public static varType myVar = initializeClassVariable();
        
    private static varType initializeClassVariable() {

        // initialization code goes here
    }
}
```

>  The advantage of private static methods is that they can be reused later if you need to reinitialize the class variable.

## Non-static Initialization Blocks

is for **initializing Instance Members**. Initializer blocks for instance variables look just like static initializer blocks, but without the `static` keyword:

```
{
    // whatever code is needed for initialization goes here
}
```

```
class Whatever {
    private varType myVar = initializeInstanceVariable();
        
    protected final varType initializeInstanceVariable() {

        // initialization code goes here
    }
}
```

**The method is final because calling non-final methods during instance initialization can cause problems.**

