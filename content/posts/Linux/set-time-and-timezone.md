+++
categories = ["linux"]
date = 2020-10-06T11:27:10Z
layout = ""
tags = ["linux"]
title = "Set time and timezone"

+++
    sudo apt install policykit-1

    sudo apt-get install ntp

    timedatectl set-ntp false

    timedatectl set-timezone Asia/Ho_Chi_Minh

    timedatectl set-ntp false
    Or run
    sudo date -s "Tuesday, October 6, 2020 6:25:09 PM GMT+07:00"