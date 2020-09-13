+++
categories = ["golang"]
date = 2020-09-13T03:13:32Z
layout = ""
tags = ["golang"]
title = "[Basic - 03] Install your Go application on your machine"

+++
Locate to your package, then use this command to discover the Go install path, where the `go` command will install the current package.

    $ go list -f '{{.Target}}'
    /root/codekeeper/go/bin/hello

Add the Go install directory to your system's shell path. By doing this way, you'll be able to run your program's executable without specifying where the executable is.

    export PATH=$PATH:/root/codekeeper/go/bin/hello

Run the `go install` command to compile and install the package.

    $ go install

Run your application by simply typing its name.

       $ hello
       map[Darrin:Hail, Darrin! Well met! Gladys:Great to see you, Gladys! Samantha:Hail, Samantha! Well met!]