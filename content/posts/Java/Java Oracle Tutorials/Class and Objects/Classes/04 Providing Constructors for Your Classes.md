# Providing Constructors for Your Classes

- Constructor declarations look like method declarations—except that they use the **name of the class and have no return type.**

- Constructor is called by the `new` operator: `Bicycle myBike = new Bicycle(30, 0, 8);`
  - `new Bicycle(30, 0, 8)` creates space in memory for the object and initializes its fields.

- 

## Note

- You **cannot write two constructors that have the same number and type of arguments** for the same class.

- You don't have to provide any constructors for your class.
  - All classes have at least one constructor. If a class does not explicitly declare any, the Java compiler automatically provides a no-argument constructor, called the *default constructor*. This default constructor calls the class parent's no-argument constructor, or the `Object` constructor if the class has no other parent. If the parent has no constructor (`Object` does have one), the compiler will reject the program.

- You **can use access modifiers in a constructor's declaration** to control which other classes can call the constructor.
  - If another class **cannot call a MyClass constructor**, it **cannot directly create MyClass objects**.

