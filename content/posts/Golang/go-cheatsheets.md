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

      int8:  [-2^7, 2^7 - 1]
      int16: [-2^15, 2^15 - 1]
      int32: [-2^31, 2^31 - 1]
      int64: [-2^63, 2^63 - 1]
      
      uint8: [0, 2^16 - 1]
      uint16: [0, 2^32 - 1]
      uint32: [0, 2^64 - 1]
      
      float32: [-3.4E38, -1.18E-38] U [1.18E-38, 3.4E38]
      float64: [-1.8E308, -2.23E-308] U [2.23E-308, 1.8E308]

  ### Float point declaration

      n := 3.14
      n = 13.7e72
      n = 2.1E-14

  ### String
  * Cannot reassign an element of a string

        s := "This is a string"
        s[2] = "u"
  * Concatenate:

        var s string = "This is "
        s = s + "a string"