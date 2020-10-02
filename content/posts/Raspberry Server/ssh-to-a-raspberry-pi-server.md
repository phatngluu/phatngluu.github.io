+++
categories = ["raspberry", "server"]
date = 2020-10-02T07:50:43Z
layout = ""
tags = ["raspberry", "server"]
title = "SSH to a Raspberry Pi Server"

+++
# SSH to a Raspberry Pi Server

* Install SSH server and run it on Raspberry Pi Server (`openssh server`, port 22)
* SSH to a Raspberry Pi using `ngrok` . First, make sure to install ngrok on the device. Next, start a TCP tunnel on the device by listening on any port you choose:

      $ ngrok tcp 22
* You started a session with SSH to Rasp. And run the above command. When you log out, the `ngrok` process will be terminated. To keep `ngrok` running, use the `nohup` command (`nohup` is only available on Linux & macOS):

      nohup ngrok tcp 22