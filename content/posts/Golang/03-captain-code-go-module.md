+++
categories = ["golang"]
date = 2020-09-15T12:33:18Z
layout = ""
tags = ["golang"]
title = "03 - Captain Code - Go Module"

+++
Go get trong GOPATH thì cài vào GOPATH và cả binary

    go mod tidy # don dep thu vien khong dung
    go mod why # why do i need this 
    
    go mod download # download nhugn thang trong require
    go mod get ./... # kiem tra tat ca file cua ban roi download
    
    go list -m all # liet ke het package minh

* Import package, khong import file rieng le

`HandlerFunc` has signature: `func(ResponseWriter, *Request)`. So it is true if return like this:

    func GetHello() http.HandlerFunc {
    	...
        return func(w http.ResponseWriter, r *http Request) {
        ...
        }
    }