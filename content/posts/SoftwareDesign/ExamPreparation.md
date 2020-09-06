Only learned design patterns.

Five example for DS: sourcemaking, refactoing guru, tutorial points, geeks for geeks

Next week: 2,3,4 9h;16h

Observer is MVC



## Classroom exercise

Why do I use Visitor? => Because my structure is recursiv

- "Encrypted" mathematical expressions: A(B(A(4, 5), 5))
- A, B, C, D: chosen from {*, +, -, /}
- You are the class provider.
- You want to hide from the client:
  - the internal structure chosen to represent mathematical expressions.

- The client is interested in:
  - "evaluate" the expressions: i.e., to choose values from {A, B, C, D} and "evaluate" the resulting expression.
  - "print" the expression: e.g., prefix, infix
  - "search" within the expressions: e.g., "the maximum integer", "the number of 'A's", etc.

- The client determines how "evaluate, print, search" work. So, your mission is to develope a structure using design patterns to provide the client way to perfom those tasks.

#### Solution

Composite (structure), Visitor (evaluate, print) and Iterator (search)

PrintVisitor & EvaluateVisitor

Make composite visitable. The client will implement how they will visit. But, you must provide them a way to accept the visitor:

```java
// Defined by you
public String HiddenBinaryExpression (Visitor visitor) {
	...
	accept(Visitor visitor){
		return visitor.visit(this)
  }
}
// Defined by you
public interface Visitor {
	String visit(HiddenBinaryExpression visitable);
	String visit(Literal visitable);
}
// PrintHiddenExpression is defined by client
public class PrintHiddenExpression implements Visitor {
	@Override
	public  String visit(HiddenBinaryExpression visitable){
		return  visitable.operator + '(' +
    				visitable.left.accept(this) + ',' +
            visitable.right.accept(this) + ')';
	}
  @Override
  public String visit(Literal visitable) {
    return visitable.value
  }
}
// Client
structure.accept(new PrintHiddenExpression)
```

Question: Nếu muốn đổi in prefix thành infix, bạn sẽ change class nào? => Đổi class PrintHiddenExpression. Cụ thể:

We have problem: for every new problem => add new module. So, the original code must be independent and ready to add new things.

organize structure => module composite

evaluate, print => module visitor. (Add accept method to the existing class "HiddenBinaryExpression")

search => module iterator

## Review

- Adapter provides a different interface to its subject. Proxy provides the same interface. Decorator provides an enhanced interface.
- Composite: recursion => composite. no recursion
- Iterator: recursion, 
- Visitor: have an operation to do with elements of the composite
- Observer: something changed, have a nice way to inform. Keep a list of subscribers. Subscriber has access to the publisher.
- Mediator: objects communite over Mediator
- Chain: a bunch of things, have a responsible for any of object, pass the responsility until an object accept. Otherwise, responsilbility is dropped.