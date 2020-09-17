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