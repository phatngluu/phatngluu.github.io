+++
categories = ["raspberry"]
date = 2020-10-03T03:45:17Z
layout = ""
tags = ["raspberry"]
title = "Make Raspberry Pi boot from USB"

+++
# Update EEPROM

1. Start up the Raspberry Pi 4 with Raspberry Pi OS from SD card.
2. To get latest EEPROM. In terminal, type:

       # Upgrade OS packages
       sudo apt-get upgrade -y
       
       # Get latest EEPROM
       sudo rpi-eeprom-update

   Output of above command:

   ![](/static/uploads/screen-shot-2020-10-03-at-10-49-20.png)

   Note: make sure current and lastest are the same.
3. Upgrade EEPROM:

       sudo rpi-eeprom-update -a

   After upgrading, reboot the Raspberry Pi 4, by typing:

       sudo reboot

# Write Raspberry Pi OS to the USB

In your computer (not on Raspberry Pi 4). Use Raspberry Pi Imager to write Raspberry Pi OS to the USB

![](/static/uploads/120754926_1686969261450541_2314459776392102187_n.png)

1. Choose OS as normal
2. Choose SD card, instead of looking for a SD card, let's choose a USB instead.
3. Hit "Write" and wait until it completed.

\[Watch video from 1:11 to 1:27 [https://www.youtube.com/watch?v=B1aRGkH3bgw](https://www.youtube.com/watch?v=B1aRGkH3bgw "https://www.youtube.com/watch?v=B1aRGkH3bgw") \]

# Boot from USB

Remove the SD card from Raspberry Pi 4.

Plug the USB in and power up the Raspberry Pi 4.

Watch the result!