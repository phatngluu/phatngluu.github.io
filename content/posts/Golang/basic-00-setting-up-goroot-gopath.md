+++
categories = ["golang"]
date = 2020-09-11T02:39:14Z
layout = ""
tags = ["golang"]
title = "[Basic - 00] Setting up GOROOT, GOPATH"

+++
Open `~/.bashrc` file with `vim` to edit:

    vim ~/.bashrc

Add following lines

    export GOROOT=/usr/local/go
    export PATH=$PATH:$GOROOT/bin
    
    # Wherever, up to you
    export GOPATH=/root/codekeeper/go
    export PATH=$PATH:$GOPATH/bin