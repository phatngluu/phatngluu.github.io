+++
categories = ["golang"]
date = 2020-09-13T05:21:38Z
layout = ""
tags = ["golang"]
title = "[Basic - 05] For, If-else, Switch and Defer"

+++
# For

## Structure

The basic `for` loop has three components separated by semicolons:

* the init statement: executed **before the first iteration**
* the condition expression: evaluated **before every iteration**
* the post statement: executed at the **end of every iteration**

## Attention

* The init statement will often be a short variable declaration, and the variables declared there are **visible only in the scope of the `for` statement**.
* The loop will **stop iterating once** **condition** `false`.
* The **init and post statements are optional**.

  ```go
  sum := 1
  for ; sum < 1000; {
  	sum += sum
  }
  // It's like a while loop!
  ```
* Infinite loop:

  ```go
  for {
  	// do stuff
  }
  ```

# If

## If with a short statement

Like for, the if statement can start with a short statement to execute before the condition.

Variables declared by the statement are only **in scope until the end of the if**, and are **also available inside any of the else blocks**.
```go
func pow(x, n, lim float64) float64 {
    if v := math.Pow(x, n); v < lim {
        return v
    } else {
        fmt.Printf("%g >= %g\n", v, lim)
    }
    // can't use v here, though
    return lim
}
```
# Switch

A `switch` statement is a shorter way to write a sequence of `if - else` statements. It runs the first case whose value is equal to the condition expression.

## Attention

Go **only runs the selected case**, **not all the cases** that follow. The `break` statement is provided automatically in Go.

Go's switch cases **need not be constants**, and the values involved **need not be integers**.

Switch cases evaluate cases from **top to bottom**, **stopping** when a **case** **succeeds**.

## Switch with no condition

Switch without a condition is the same as `switch true`.

This construct can be a clean way to write long if-then-else chains.
```go
t := time.Now()
switch {
case t.Hour() < 12:
    fmt.Println("Good morning!")
case t.Hour() < 17:
    fmt.Println("Good afternoon.")
default:
    fmt.Println("Good evening.")
}
```
# Defer
A defer statement defers the execution of a function until the surrounding function returns.

The deferred call's arguments are evaluated immediately, but the function call is not executed until the surrounding function returns.
## Stacking defers
Deferred function calls are pushed onto a stack. When a function returns, its deferred calls are executed in last-in-first-out order