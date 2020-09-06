Read detail at: https://cs-fundamentals.com/java-programming/java-annotations.php



## Built-in Java Annotations

| Annotation Name                               | Applicable To                                       | Use                                                          | Included in            |
| --------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------ | ---------------------- |
| Java Annotations Applied to Java code         |                                                     |                                                              |                        |
| @Override                                     | Member Methods                                      | Checks that this method overrides a method from its superclass | `java.lang`            |
| @Deprecated                                   | All annotable items                                 | Marks item as deprecated                                     | `java.lang`            |
| @SuppressWarnings                             | All annotable items except packages and annotations | Suppress warning of given type                               | `java.lang`            |
| Java Annotations Applied to Other Annotations |                                                     |                                                              |                        |
| @Retention                                    | Annotations                                         | Specifies how long this annotation is retained - whether in code only, compiled into the class, or available at run time through reflection. | `java.lang.annotation` |
| @Documented                                   | Annotations                                         | Specifies that this annotation should be included in the documentation of annotated items | `java.lang.annotation` |
| @Target                                       | Annotations                                         | Specifies the items to which this annotation can be applied  | `java.lang.annotation` |
| @Inherited                                    | Annotations                                         | Specifies that this annotation, when applied to a class, is automatically inherited by its subclasses. | `java.lang.annotation` |

## Purpose of annotation

> One of the main reasons for adding annotations to the Java platform is to **enable development and runtime tools** to **have a common infrastructure** in order to **reduce the effort required for development and deployment**. By having a common infrastructure metadata structure can be standardized, thus a tool could **use the metadata information in form of annotations** to **generate additional source code**, or to **provide additional information for debugging**, or other purposes.

## Annotation usage I encountered

When use Lombok, Hibernate, Spring... They will, somehow, generate the code in run time/compile time/build time (I dont know exactly). 

For example with Lombok, cited in https://www.toptal.com/java/write-fat-free-java-code-project-lombok:

> Lombok acts as an annotation processor that “adds” code to your classes at compile time. [Annotation processing](http://hannesdorfmann.com/annotation-processing/annotationprocessing101) is a feature added to the Java compiler at version 5. The idea is that users can put annotation processors (written by oneself, or via third-party dependencies, like Lombok) into the build classpath. Then, as the compile process is going on, whenever the compiler finds an annotation it sort of asks: “Hey, anybody in the classpath interested in this @Annotation?.” For those processors raising their hands, the compiler then transfers control to them along with compile context for them to, well… process.

## Example of using annotation

HDAnnotations

```java
package com.hde.app.annotations;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import com.hde.app.db.object.ChangeHistory;

@Retention(RetentionPolicy.RUNTIME)
public @interface HDAnnotations {
	/**
	 * Accept load previous State in interceptor
	 **/
	public boolean loadPreviousState() default false;
	
	/**
	 * Check export header file by attribute name or language 
	 */
	public boolean exportHeaderLanguage() default true;
	
	/**
	 * Check change and save history.
	 * 
	 * This feature only enable when loadPreviousState = true
	 * and must set changeObject class 
	 * 
	 * Ex: save history of Account : history(saveHistory=true, changObject=AccountChangeHistory.class)
	 */
	public History history() default @History ;
	
	@interface History{
		public boolean saveHistory() default false;
		public Class<? extends ChangeHistory> changeObject() default ChangeHistory.class;
	}
}
```

Usage:

```java
...
@HDAnnotations(loadPreviousState=true, history=@History(saveHistory=true, changeObject=AccountChangeHistory.class))
...
```

