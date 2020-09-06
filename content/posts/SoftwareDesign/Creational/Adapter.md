```java
// Client is familiar with this interface
class Duck {
  public void quack(){
    sout("Quacking...");
  }
  public void fly(){
    sout("Flying...");
  }
}
// Client code
Duck duck = new Duck();
duck.quack();
duck.fly();
```

When you introduces new interface, it differs from the old one:

```java
class Turkey {
	public void gobble(){
    sout("Gobbling...");
  }
  public void fly(){
    sout("Flying with Turkey style...");
  }
}
```

Client does not familiar with the new interface. We need an adapter:

```java
class TurkeyAdapter extends Duck {
  private Turkey turkey;
  
  TurkeyAdapter(Turkey turkey){
    this.turkey = turkey;
  }
  
	@Override
  public void quack(){
    this.turkey.gobble();
  }
  
  @Override
  public void fly(){
    this.turkey.fly();
  }
}
```

![Scheme of Adapter](https://sourcemaking.com/files/v2/content/patterns/Adapter_1.png)

