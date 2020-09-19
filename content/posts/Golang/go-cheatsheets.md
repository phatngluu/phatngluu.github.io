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
* Type conversion:

      var i int = 3
      var f float32 = float32(i) # convert int to float32
      var s string = strconv.Itoa(i) # convert int to string

  ## Primitives

  See details: [https://golang.org/pkg/builtin/](https://golang.org/pkg/builtin/ "https://golang.org/pkg/builtin/")

      int  int8  int16  int32  int64
      uint uint8 uint16 uint32 uint64 uintptr
      // int, uint, uintptr: 32 bits wide on 32-bit systems and 64 bits wide on 64-bit systems.
      
      byte // alias for uint8
      rune // alias for int32, represents a Unicode code point
      
      float32: [-3.4E38, -1.18E-38] U [1.18E-38, 3.4E38]
      float64: [-1.8E308, -2.23E-308] U [2.23E-308, 1.8E308]


* Float point declaration

      n := 3.14
      n = 13.7e72
      n = 2.1E-14
* Complex number:

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