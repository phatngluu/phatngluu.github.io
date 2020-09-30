+++
categories = ["golang"]
date = 2020-09-30T08:12:32Z
layout = ""
tags = ["golang"]
title = "Kiến thức Go lượm lặt"

+++
`r.Form` contains all of the request arguments, for instance the query-string in the URL and the data in POST and PUT. If the data has conflicts, for example parameters that have the same name, the server will save the data into a slice with multiple values. The Go documentation states that Go will save the data from GET and POST requests in different places.

The type of `request.Form` is `url.Value`. It saves data with the format `key=value`.

        v := url.Values{}
        v.Set("name", "Ava")
        v.Add("friend", "Zoe")
        // v.Encode() == "name=Ava&friend=Jess&friend=Sarah&friend=Zoe"
        fmt.Println(v.Get("name"))
        fmt.Println(v.Get("friend"))
        fmt.Println(v["friend"])

**Tips** Requests have the ability to access form data using the `FormValue()` method. For example, you can change `r.Form["username"]` to `r.FormValue("username")`, and Go calls `r.ParseForm` automatically. Notice that it returns the first value if there are arguments with the same name, and it returns an empty string if there is no such argument.