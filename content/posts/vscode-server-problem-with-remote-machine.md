+++
categories = ["vscodeserver"]
date = 2020-10-13T09:14:07Z
layout = ""
tags = ["vscodeserver"]
title = "VSCode Server problem with remote machine"

+++
# **VSCode Server problem**

* JDK Path: 
  * VSCode/Settings/User: Search for Java: Home
  * VSCode/Settings/Remote \[...\]: Search for Java: Home
  * Place inside settings.json as:

        {
            ...
            "java.home": "/usr/lib/jvm/java-11-openjdk-armhf",
            ...
        }
* Install Lombok Extension (if Language Server logs contains unable to extract/unzip Lombok.jar)