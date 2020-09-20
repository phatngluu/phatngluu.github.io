+++
categories = ["golang"]
date = 2020-09-17T04:22:52Z
layout = ""
tags = ["golang"]
title = "Go Cheatsheets"

+++
# Variables

* Variable declaration:

      var foo int
      var foo int = 42
      foo := 23

  **Note**: `foo := 23` is short-form declaration, which can be valid in block scope.
* Can't redeclare variables, but can **shadow** them:

      package main
      ...
      var foo int = 1
      
      func main() {
      	var foo int = 2
          fmt.Println(foo)
      }
      # Output: 2
* All variables must be used, if not then the compiler will throw an error.
* Visibility:

      package main
      ...
      var myVar int # package scope
      var MyVar int # export globally
      func main(){
      	var myvar int # block scope
      }

Type conversion:

    var i int = 3
    var f float32 = float32(i) # convert int to float32
    var s string = strconv.Itoa(i) # convert int to string

## Primitives

See details: [https://golang.org/pkg/builtin/](https://golang.org/pkg/builtin/ "https://golang.org/pkg/builtin/")

### Integer

* `int int8 int16 int32 int64`
* `uint uint8 uint16 uint32 uint64 uintptr`
* Can't mix types (`uint16 + uint32` is invalid)
* `byte` is alias for `uint8`.  `rune` is alias for `int32` , represents a Unicode.
* `int, uint, uintptr`: 32 bits wide on 32-bit systems and 64 bits wide on 64-bit systems.

### Decimal

    float32: [-3.4E38, -1.18E-38] U [1.18E-38, 3.4E38]
    float64: [-1.8E308, -2.23E-308] U [2.23E-308, 1.8E308]
    n := 3.14
    n = 13.7e72
    n = 2.1E-14

### Complex

    var n complex64 = 1 + 2i
    // var n complex64 = complex(1,2)
    real(n) // return real part (float32)
    imag(n) // return imagine part (float32)
    // float64 for complex128

### String

* Cannot reassign an element of a string

      s := "This is a string"
      s[2] = "u"
* Concatenate:

      var s string = "This is "
      s = s + "a string"
* Byte slices

      s := "This is a string"
      b = []byte(s)

  # Constants

      const a int = 8
      var b int = 8
      a + b // success
      var c int8 = 9
      a + c // mismatched types error
      const d = 42 // inferred type: int
      d + c // d will be replaced by 42 as below
      42 + c // inferred type int8

  ## Iota
  * iota is a counter, it increases whenever we specify a new enumeric constant:

        const (
        	a = iota // 0
            b = iota // 1
            c = iota // 2
        )
  * iota is inferred:

        const (
        	a = iota // 0
            b		 // 1
            c		 // 2
        )
  * iota resets in a new const block:

        const (
        	a = iota // 0
            b		 // 1
        )
        const (
        	c = iota // 0
        )
  * Formular with iota is also inferred:

        const (
        	a = iota + 5 // 0 + 5
            b		 // 1 + 5
            c		 // 2 + 5
        )
  * Ignore values of iota:

        const (
        	_ = iota	// 0
            a			// 1
            _			// 2
            c			// 3
        )

    # Arrays and Slices

    ## Arrays
    * Declarations:

          grades := [3]int{97, 85, 93}
          grades2 := [...]int{97, 85, 93}
          var grades3 [3]int = [3]int{97, 85, 93}
    * Copy an array:
      * New array is created (no pointer used):

            a := [...]int{1,2,3}
            b := a // create new from a and assign to b
      * Using pointer, no new array is created:

            a := [...]int{1,2,3}
            b := &a // a,b points to the same array

    ## Slices
    * Declarations:

          grades := []int{1,2,3}