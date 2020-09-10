+++
categories = ["golang"]
layout = ""
tags = ["golang"]
title = "GOPATH Explained"

+++
See details at: [https://flaviocopes.com/go-gopath/](https://flaviocopes.com/go-gopath/ "https://flaviocopes.com/go-gopath/")

> _Go programmers typically keep all their Go code in a single workspace._
>
> _A workspace contains many version control repositories (managed by Git, for example)._
>
> _Each repository contains one or more packages._

Libraries installed using `go get` will be put in `$GOPATH/src`

Commands installed using `go get` will be put in `$GOPATH/bin`