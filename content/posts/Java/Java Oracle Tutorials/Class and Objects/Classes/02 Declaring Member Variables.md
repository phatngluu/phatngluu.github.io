# Declaring Member Variables

There are several kinds of variables:

- Member variables in a class—these are called fields.

- Variables in a method or block of code—these are called local variables. 
- Variables in method declarations—these are called parameters.

Field declarations are composed of three components, in order:

1. Zero or more modifiers, such as public or private.
2. The field's type.
3. The field's name.

## Access Modifiers

The first (left-most) modifier lets you control what other classes have access to a member field.

- `public` modifier—the field is accessible from all classes. 
- `private` modifier—the field is accessible only within its own class.

In the spirit of encapsulation, it is common to make fields private.

- This means that they can only be **directly accessed from the its own class**.
- This can be accessed **indirectly by adding public methods that obtain the field values for us**

