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

```
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

# Defer

