# Abstract Factory

### Intent

- The `new` operator considered harmful.
- Provide an interface for creating families of related or dependent objects without specifying their concrete classes.
- Map out a matrix of "platforms" [= sport centers] versus "products" [events/resources - bookings].

### How to Implement

- The job of an Abstract Factory is to define an interface for **creating a set of products**.
- **Each method** in that interface is responsible for **creating a concrete product,** and we **implement** the Abstract Factory to supply those implementations.
- In this way, **the client** is **decoupled** from the **concrete products**. 


### Comparison with Factory Method

- **Abstract Method:**
  - It needs a **big interface** because it used to **creating entire families of products**.
    - The interface has to change if new products are added.
- **Factory Method:**
  - It is **only creating one product**, so it doesn’t really need a big interface, it needs **one method.**
  - To use me, just subclass me and implement my factory method!

