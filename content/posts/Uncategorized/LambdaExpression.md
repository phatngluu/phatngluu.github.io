The interface must have exact one method to use lambda function.

```java
public interface IDecision {
    boolean decide(ZumbaClass c);
}
```

The method that call the lambda function must take the interface as perameter.

```java
public class Person {
    ...
    public Person setLogic(IDecision decision) {
        ...
    }
}
```

## Usage

```java
ZumbaClass class102 = new ZumbaClass("Class 102");
Player p1 = new Player("Player 1");
// define the lambda function
p1.setLogic((c) -> {
if (!c.equals(class101)) return true;
return (c.getState() == 0);
});
```

