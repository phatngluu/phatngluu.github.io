+++
categories = []
date = 2020-09-11T02:46:00Z
layout = ""
tags = []
title = "Get started with Go"

+++
### Standard library

[https://golang.org/pkg/](https://golang.org/pkg/ "https://golang.org/pkg/")

### Call code in an external package

#### Discover packages at pkg.go.dev

1. Search a package, eg. "quote"
2. Locate and click the `rsc.io/quote` package in search results
3. On the **Doc** tab, note the list of functions you can call from your code. You'll use the `Go` function
4. At the top of this page, note that package `quote` is included in the `rsc.io/quote` module.

   ![](static/uploads/screen-shot-2020-09-11-at-09-59-32.png)

#### Import and calling

    package main
    import "fmt"
    import "rsc.io/quote"
    
    func main() {
        fmt.Println(quote.Go())
    }

#### Put your own code in a module