# Factory Method

Here we’ve got several concrete classes being instantiated, and the decision of which to instantiate is made at runtime depending on some set of conditions.

Factory Method allows the class to delegate instantiation to subclasses. 

The goal of any factory is to protect customers from the details of creating copies of classes or class hierarchy.

The `new` operator considered harmful.

![img](https://ucarecdn.com/0bd448e0-f5c7-44bf-bf0e-7af4bbaf52c7/)

1. **Creator** declares an **abstract or virtual method** of creating a product: **factoryMethod()**. The return type of this method matches the product interface. Example: Table Factory
2. **ConcreteCreator** **implements** a **factory method** that returns ConcreteProduct. It is a concrete version of above factory. Example: Table Store
3. The **Product** declares the interface, which is common to all objects that can be produced by the creator and its subclasses.
4. **ConcreteProduct** determines the specific type of products. Samples: Office Table, Kitchen Table



## Code

### Table - Product

```
abstract class Table {
    private String name;
 
    Table(String name) {
        this.name = name;
    }
 
    String getName() {
        return name;
    }
 
    void attachLegs() {
        System.out.println("Attaching Legs");
    }
 
    void attachTableTop() {
        System.out.println("Attaching tabletop");
    }
}
```

### TableOffice/TableKitchen - Concrete Product

```
class TableOffice extends Table {
    TableOffice(String name) {
        super(name);
    }
}
 
class TableKitchen extends Table {
    TableKitchen(String name) {
        super(name);
    }
}
```

### TableFactory - Creator

```
abstract class TableFactory {
 
    abstract Table createTable(String type);
 
    Table orderTable(String type) throws InterruptedException {
        Table table = createTable(type);
        if (table == null) {
            System.out.println("Sorry, we are not able to create this kind of table\n");
            return null;
        }
        System.out.println("Making a " + table.getName());
        table.attachLegs();
        table.attachTableTop();
        Thread.sleep(1500L);
        System.out.println("Done a " + table.getName() + "\n");
        return table;
    }
}
```

### TableStore - ConcreteCreator

```
 class TableStore extends TableFactory {
    @Override
    Table createTable(String type) {
        if (type.equals("office")) {
            return new TableOffice("Office Table");
        } else if (type.equals("kitchen")) {
            return new TableKitchen("Kitchen Table");
        } else return null;
    }
}
```

### Client

```
class TestDrive {
    public static void main(String[] args) throws InterruptedException {
        TableStore tableStore = new TableStore();
 
        Table strangeTable = tableStore.orderTable("Mysterious table");
 
        Table officeTable = tableStore.orderTable("office");
        Table kitchenTable = tableStore.orderTable("kitchen");
 
    }
}
```

