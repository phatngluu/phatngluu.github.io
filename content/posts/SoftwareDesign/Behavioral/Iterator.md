# Iterator - Day 11



Problem Description:

Traverse a structure/tree with:

- Depth First
- Breadth First
- Inorder
- Postorder

Solution: use **Iterator** pattern

What is iterator?

Iterator helps us traverse a complex structure easiser in specific traverse rule.



```java
tournament : Tournament
// get iterator
iterator = tournament.getIterator("depthfirst") 

// client code - it does not change
// because it is independent on which kind of iterator (depth first or breadth first)
while (iterator.hasNext()){
	currentTournament = iterator.next()
}
```



Tournament With Iterator Class

```
public Iterator getIterator(String type){
	Iterator = null
	switch (type){
		case : {
			Iterator = new DepthFirstIterator(Tournament)
			return iter
		}
		case ....
	}
}
public class DepthFirstIterator(Tournament) extends {
	@Override
	method next(){
		...
	}
	@Override
	method hasNext(){
		...
	}
}
```

Iterator:

Advantages

Usage: 

- when need to traverse to a complex structure (not a simple collection)

- when need to decide where to go in a branch

Class `ConcreteIterator`:

```
public class DFSIterator implements Iterator<IterableCollection> {
	private list;
	
	public DFSIterator(IterableCollection root) {
    list = initia lize new list
    put root to list
  }
  
  @Override
  public boolean hasNext() {
    return !list.isEmpty()
  }

  @Override
  public IterableCollection getNext() {
  	var item = list.getNext()
  	
  	if (item is not a leaf) {
  		put its children to the list
  	}
  	return item;
  }
}
```

Class `ConcreteCollection`:

```
public class ConcreteCollection extends IterableCollection {
		@Override
		public Iterator<Collection> createIterator(String type){
			if (type == "dfs") return new DFSIterator(this);
		}
}
```

Client code:

```
IterableCollection collection = ...
Iterator iterator = collection.createIterator("dfs");
while (iterator.hasNext()){
	current_item = iterator.next()
	// do something with current item
}
```

