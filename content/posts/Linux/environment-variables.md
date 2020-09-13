+++
categories = ["linux"]
date = 2020-09-12T09:30:27Z
layout = ""
tags = ["linux"]
title = "Environment variables"

+++
# Environment variables

## Export and unset

    export NAME=VALUE # Set
    unset NAME # Unset

## Persisting env vars for current user

When an environment variable is set from the shell using the export command, its existence ends when the user’s sessions ends. 

To make an environment persistent for a user’s environment, we export the variable from the user’s profile script.

1. Open the current user’s profile into a text editor

       vi ~/.bash_profile
2. Add the export command for every environment variable you want to persist.

       export JAVA_HOME=/opt/openjdk11
3. Immediately apply all changes to bash_profile, use the source command.

       source ~/.bash_profile

## Persisting env vars for all users

[https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-set-environment-variables-in-linux/](https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-set-environment-variables-in-linux/ "https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-set-environment-variables-in-linux/")