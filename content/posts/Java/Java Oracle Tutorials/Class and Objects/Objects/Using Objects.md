# Using Objects

You may need to use the value of one of its fields, change one of its fields, or call one of its methods to perform an action.

### Referencing an Object's Fields

Recall that the new operator returns a reference to an object. So you could use the value returned from new to access a new object's fields:

`int height = new Rectangle().height;`

This statement creates a new Rectangle object and immediately gets its height. In essence, the statement calculates the default height of a Rectangle. 

Note that after this statement has been executed, the program no longer has a reference to the created Rectangle, because the program never stored the reference anywhere. The object is unreferenced, and its resources are free to be recycled by the Java Virtual Machine.

### Calling an Object's Methods

Không có gì lạ.

### The Garbage Collector

Some object-oriented languages require that you keep track of all the objects you create and that you explicitly destroy them when they are no longer needed. Managing memory explicitly is tedious and error-prone. The Java platform allows you to create as many objects as you want (limited, of course, by what your system can handle), and you don't have to worry about destroying them. The Java runtime environment deletes objects when it determines that they are no longer being used. This process is called *garbage collection*.

An object is **eligible** for **garbage collection** when there are **no more references to that object**. References that are held in a variable are usually dropped when the variable goes out of scope. Or, you can explicitly drop an object reference by setting the variable to the special value `null`. Remember that a program can have multiple references to the same object; all references to an object must be dropped before the object is eligible for garbage collection.

The Java runtime environment has a garbage collector that periodically frees the memory used by objects that are no longer referenced. The garbage collector does its job automatically when it determines that the time is right.