# Classes and Objects

## Nested Classes

**Terminology:** Nested classes are divided into two categories: static and non-static. 

-  `static` nested classes that are declared are called *static nested classes*. 
- Non-static nested classes are called *inner classes*.

- Non-static nested classes (inner classes) have access to other members of the enclosing class, even if they are declared private. 
- Static nested classes do not have access to other members of the enclosing class.
- As a member of the `OuterClass`, a nested class can be declared `private`, `public`, `protected`, or *package private*. (Recall that outer classes can only be declared `public` or *package private*.)

### Why Use Nested Classes?

Compelling reasons for using nested classes include the following:

- **It is a way of logically grouping classes that are only used in one place**: If a class is useful to only one other class, then it is logical to embed it in that class and keep the two together. Nesting such "helper classes" makes their package more streamlined.
- **It increases encapsulation**: Consider two top-level classes, A and B, where B needs access to members of A that would otherwise be declared `private`. By hiding class B within class A, A's members can be declared private and B can access them. In addition, B itself can be hidden from the outside world.
- **It can lead to more readable and maintainable code**: Nesting small classes within top-level classes places the code closer to where it is used.

### Static Nested Classes

A static nested class is **associated with its outer class**. 

A static nested class **cannot refer directly to instance variables or methods defined in its enclosing class:** **it can use them only through an object reference**.

Static nested classes are accessed using the enclosing class name:

`OuterClass.StaticNestedClass`

For example, to create an object for the static nested class, use this syntax:

`OuterClass.StaticNestedClass nestedObject = new OuterClass.StaticNestedClass();`

### Inner Classes
```java
class OuterClass {
    ...
    class InnerClass {
        ...
    }
}
```
- Also, because an inner class is associated with an instance, **inner class cannot define any static members** itself.
- An instance of `InnerClass` can **exist only within** an instance of `OuterClass` and has **direct access** to the **methods** and **fields** of its **enclosing instance**.

- To instantiate an inner class, you must first instantiate the outer class. Then, create the inner object within the outer object with this syntax:

  `OuterClass.InnerClass innerObject = outerObject.new InnerClass();`

- There are two special kinds of inner classes: [local classes](https://docs.oracle.com/javase/tutorial/java/javaOO/localclasses.html) and [anonymous classes](https://docs.oracle.com/javase/tutorial/java/javaOO/anonymousclasses.html).
- Shadowing: `x` in `FirstLevel` shadows `x` in `ShadowTest`.
  ```java
  public class ShadowTest {
    public int x = 0;
    class FirstLevel {
      public int x = 1;
      void methodInFirstLevel(int x) {
        System.out.println("x = " + x);
        System.out.println("this.x = " + this.x);
        System.out.println("ShadowTest.this.x = " + ShadowTest.this.x);
      }
    }
    public static void main(String... args) {
      ShadowTest st = new ShadowTest();
      ShadowTest.FirstLevel fl = st.new FirstLevel();
      fl.methodInFirstLevel(23);
    }
  }
  ```
  
- You can use the access specifiers `private`, `public`, and `protected` to restrict access to inner classes.

#### Local Classes

Local classes are classes that are defined in a *block*, which is a group of zero or more statements between balanced braces. You **typically find local classes defined in the body of a method**.

##### Declaring Local Classes

For example, you can define a local class in a method body, a `for` loop, or an `if` clause.

##### Accessing Members of an Enclosing Class

A local class **can access** local variables and parameters of the enclosing block that are **final or *effectively final***. (A variable or parameter whose value is **never changed after it is initialized** is effectively final)

When a local class accesses a local variable or parameter of the enclosing block, it *captures* that variable or parameter.

##### Local Classes Are Similar To Inner Classes

- Local classes are similar to inner classes because they cannot define or declare any static members. 

- Local classes in static methods can only refer to static members of the enclosing class.

- Local classes are non-static because they have access to instance members of the enclosing block. Consequently, they cannot contain most kinds of static declarations.

- You cannot declare an interface inside a block; interfaces are inherently static. For example, the following code excerpt does not compile because the interface `HelloThere` is defined inside the body of the method `greetInEnglish`:
  ```java
      public void greetInEnglish() {
          interface HelloThere {
             public void greet();
          }
          class EnglishHelloThere implements HelloThere {
              public void greet() {
                  System.out.println("Hello " + name);
              }
          }
          HelloThere myGreeting = new EnglishHelloThere();
          myGreeting.greet();
      }
  ```

- You cannot declare static initializers or member interfaces in a local class. The following code excerpt does not compile because the method`EnglishGoodbye.sayGoodbye` is declared `static`.

  ```java
      public void sayGoodbyeInEnglish() {
          class EnglishGoodbye {
              public static void sayGoodbye() {
                  System.out.println("Bye bye");
              }
          }
          EnglishGoodbye.sayGoodbye();
      }
  ```

- A local class can have static members provided that they are constant variables. The following code excerpt compiles because the static member `EnglishGoodbye.farewell` is a constant variable:

  ```java
      public void sayGoodbyeInEnglish() {
          class EnglishGoodbye {
              public static final String farewell = "Bye bye";
              public void sayGoodbye() {
                  System.out.println(farewell);
              }
          }
          EnglishGoodbye myEnglishGoodbye = new EnglishGoodbye();
          myEnglishGoodbye.sayGoodbye();
      }
  ```

#### Anonymous Classes





















