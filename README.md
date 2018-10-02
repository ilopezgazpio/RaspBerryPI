# RaspBerryPI
Project to play with a RaspBerry PI board

# Set-up
1. Get a Raspberry board (Repository tested under Model 3B)
2. Go to www.etcher.io and download the image burning software
3. Go to https://www.raspberrypi.org and download the image of Raspbian 
(Tested Operating System: RASPBIAN STRETCH LITE with Kernel 4.14, headless version with no desktop)
4. Burn Raspbian image in a SD card with at least 16GB using etcher
5. Navigate to the boot volume of the SD and create an empty file named "ssh", with no extension.
This will enable ssh acces to the board
6. Connect the board to the internet. There are several alternatives for this:

6.1 Connect through RJ45
The connection is automatic but we will need to find the IP address of the board manually. We can log in to the router and discover the IP address of the device or scan the net (watch-out) using a scanner such as nmap.

6.2 Connect through Wi-Fi
We need to create a file named "wpa_supplicant.conf" in the boot volume of the SD card, with this content:
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev update_config=1 country=ES
network = { 
ssid="NAME_SSID" 
psk="SSID_PASSWORD" 
key_mgmt=WPA-PSK 
}
```
where NAME_SSID is the Wi-Fi connection name and SSID_PASSWORD is the password to acces that network.
Update the two letter country code (i.e. ES) following https://www.iso.org/obp/ui/#search and the Wi-Fi security mode (i.e. WPA-PSK) accoding to your particular specifications.

If the Wi-Fi connections is made using hotspot functionality of Android devices, we can later on use the Hotspot-manager app to check the IP addresses of devices connected to that network.

7. Insert the SD card in the board and connect it to power through the Micro USB cable. Wait some minutes.

8. Connect to the board through ssh using "pi" as user and "raspberry" as password.
```
ssh pi@IP_ADDRESS_BOARD
```

9. You are done :) Don't forget to change the password for the pi user with the passwd command
