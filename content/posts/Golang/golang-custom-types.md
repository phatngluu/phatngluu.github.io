+++
categories = ["golang"]
date = 2020-09-23T15:21:44Z
layout = ""
tags = ["golang"]
title = "What things you can do with \"type\" keyword?"

+++
What things you can do with Go keyword `type`? AFAIK, there are:

1. Define a custom type (from primitive types):

       type MyFloat float64
       
       // Initialization
       var myFloat MyFloat = MyFloat(3.14243444)
2. Define a struct:

       type Vertex struct {
       	X int
           Y int
       }
       
       // Initialization
       var myVertex Vertex = Vertex{3,4}
3. Define an interface (["Interfaces" cheatsheet](https://phatngluu.github.io/posts/golang/go-cheatsheets/#interfaces)):

       type Abser interface {
       	Abs() float64
       }
4. Define a function as a type

       type Middleware func(http.HandlerFunc) http.HandlerFunc
5. What else? Please email `lnp279@gmail.com` to update.