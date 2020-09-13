+++
categories = ["golang"]
date = 2020-09-13T03:55:37Z
layout = ""
tags = ["golang"]
title = "[Basic - 05] Packages, variables and functions"

+++
# Functions

    func add(x int, y int) int {
        return x + y
    }
    # Can be shortened
    func add(x, y int) int {
        return x + y
    }
    # Function can return multiple values
    func swap(x, y string) (string, string) {
        return y, x
    }

Naked return statement:

    # Return values are named x,y
    func split(sum int) (x, y int) {
        x = sum * 4 / 9
        y = sum - x
        return # Naked return statement
    }

Naked return statements should be used only in short functions, as with the example shown here. They can harm readability in longer functions.

# Variables

The var statement declares a **list of variables**, the **type is last**.

A var statement can be at **package or function level**.

    package main
    
    import "fmt"
    
    var c, python, java bool
    
    func main() {
    	var i int
    	fmt.Println(i, c, python, java)
    }

## Variables with initializers

If an **initializer** is **present**, the **type** can be **omitted**; the variable will **take the type of the initializer**.

    package main
    
    import "fmt"
    
    var i, j int = 1, 2
    
    func main() {
    	var c, python, java = true, false, "no!"
    	fmt.Println(i, j, c, python, java)
    }

## Short variable declarations

Inside a function, the `:=` short assignment statement can be used in place of a `var` declaration with implicit type.

**Outside a function, the `:=`construct is not available.**

## Basic types

    bool
    
    string
    
    int  int8  int16  int32  int64
    uint uint8 uint16 uint32 uint64 uintptr
    
    byte // alias for uint8
    
    rune // alias for int32
         // represents a Unicode code point
    
    float32 float64
    
    complex64 complex128

## Zero values

Variables declared without an explicit initial value are given their _zero value_.

The zero value is:

* `0` for numeric types,
* `false` for the boolean type, and
* `""` (the empty string) for strings.

## Type conversions

The expression `T(v)` converts the value `v` to the type `T`.  
  
Some numeric conversions:

    var i int = 42
    var f float64 = float64(i)
    var u uint = uint(f)

Or, put more simply:

    i := 42
    f := float64(i)
    u := uint(f)

**Go assignment between items of different type requires an explicit conversion.**

## Type inference

When declaring a variable without specifying an explicit type (either by using the `:=` syntax or `var =`expression syntax), **the variable's type is inferred from the value on the right hand side**.

    var i int
    j := i // j is inferred as an int

But when the right hand side contains an untyped numeric constant, the new variable may be an `int`, `float64`, or `complex128` depending on the precision of the constant:

    i := 42           // int
    f := 3.142        // float64
    g := 0.867 + 0.5i // complex128

## Constants

Constants are declared like variables, but with the `const` keyword.

    const Truth = true
    const World = "世界"
    const Pi = 3.14