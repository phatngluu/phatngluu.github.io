# Visitor - Day 12

The Visitor pattern helps **adding the new behavior** into a separate class called *visitor*, **instead** of trying to **integrate** it into **existing classes** (change the existing classes). 

The new behavior acts as a method of *visitor*, takes the original object as an argument. The original object must "allow" *visitor* to access its data. 

The behavior can be executed over objects of different classes, the visitor class may define a set of methods, each of which could take arguments of different types, like this:

```
class ExportVisitor implements Visitor is
    method doForCity(City c) { ... }
    method doForIndustry(Industry f) { ... }
    method doForSightSeeing(SightSeeing ss) { ... }
    // ...
```

Using "Double Dispatch" techniques. Since the objects know their own classes, they’ll be able to pick a proper method on the visitor less awkwardly. They “accept” a visitor and tell it what visiting method should be executed.

```
// City
class City is
    method accept(Visitor v) is
        v.doForCity(this)
    // ...

// Industry
class Industry is
    method accept(Visitor v) is
        v.doForIndustry(this)
    // ...
```

In client code:

```
// Client code
foreach (Node node in graph)
    node.accept(exportVisitor)
```

## Structure

![Structure of the Visitor design pattern](https://refactoring.guru/images/patterns/diagrams/visitor/structure-en-indexed.png)

1. The **Visitor** interface declares a set of visiting methods that can take concrete elements of an object structure as arguments. These methods may have the same names if the program is written in a language that supports overloading, but the type of their parameters must be different.
2. Each **Concrete Visitor** implements several versions of the same behaviors, tailored for different concrete element classes.
3. The **Element** interface declares a method for “accepting” visitors. This method should have one parameter declared with the type of the visitor interface.
4. Each **Concrete Element** must implement the acceptance method. The purpose of this method is to redirect the call to the proper visitor’s method corresponding to the current element class. Be aware that even if a base element class implements this method, all subclasses must still override this method in their own classes and call the appropriate method on the visitor object.
5. The **Client** usually represents a collection or some other complex object (for example, a [Composite](https://refactoring.guru/design-patterns/composite) tree). Usually, clients aren’t aware of all the concrete element classes because they work with objects from that collection via some abstract interface.

### Pseudocode

![Structure of the Visitor pattern example](https://refactoring.guru/images/patterns/diagrams/visitor/example.png)

```pseudocode
interface Shape is
    method move(x, y)
    method draw()
    method accept(v: Visitor)

class Dot implements Shape is
    // ...
    method accept(v: Visitor) is
        v.visitDot(this)

class Circle implements Shape is
    // ...
    method accept(v: Visitor) is
        v.visitCircle(this)

class Rectangle implements Shape is
    // ...
    method accept(v: Visitor) is
        v.visitRectangle(this)

class CompoundShape implements Shape is
    // ...
    method accept(v: Visitor) is
        v.visitCompoundShape(this)

interface Visitor is
    method visitDot(d: Dot)
    method visitCircle(c: Circle)
    method visitRectangle(r: Rectangle)
    method visitCompoundShape(cs: CompoundShape)

class XMLExportVisitor implements Visitor is
    method visitDot(d: Dot) is
        // Export the dot's ID and center coordinates.

    method visitCircle(c: Circle) is
        // Export the circle's ID, center coordinates and
        // radius.

    method visitRectangle(r: Rectangle) is
        // Export the rectangle's ID, left-top coordinates,
        // width and height.

    method visitCompoundShape(cs: CompoundShape) is
        // Export the shape's ID as well as the list of its
        // children's IDs.

class Application is
    field allShapes: array of Shapes

    method export() is
        exportVisitor = new XMLExportVisitor()

        foreach (shape in allShapes) do
            shape.accept(exportVisitor)
```

Applicability:

**when you need to perform an operation on all elements of a complex object structure (for example, an object tree).**

CompoundShape.accept(): means that: "Hey visitor, come here and visit me"

```
accept(Visitor visitor){
	visitor.visit(this)
}
```

## SingleBadmintonTournamentVisitor

```
visit(SingpleBadmintonTournament visitable){
	// visitable can be: composite or a leaf
	// increase level
	left.accept(this)
	right.accept(this)
	// decrease level
}
```

# Exercise 2 - Visit with Level

`SingleBadmintonTournament_Visitor` is  a concrete class of `Visitor` contains an attribute `level : Integer`. In particular:

```
class SingleBadmintonTournament_Visitor
	int level
  method visit(SingleBadmintonTournament tournament){
    // print tournament with current level
    
    // increase level when visit it children
    this.level++
    
    // visit the children
    visitable.left.accept(this) // "this" is current visitor, accepted by tournament
    visitable.right.accept(this)
    
    // decrease level when end visitting children
    this.level--
  }
```

**Note**: We pass parent's visitor for the children => Parent's visitor = children's visitor.

![image-20200611120141624](Visitor.assets/image-20200611120141624.png)

