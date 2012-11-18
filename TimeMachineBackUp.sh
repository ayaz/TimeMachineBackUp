#!/bin/bash
# Add the following cron entry:
# Run at 0200 hours. 
# 0 2 * * *     $HOME/TimeMachineBackUp.sh

## AirPort Interface (should be either en0 or en1)
AirPortInterface="en0"

## The SSID of Access Point X
HotSpotX="BC"

## Password for Access Point X. Leave empty if there is none.
HotSpotXPass=""

## The SSID of Access Point Y
HotSpotY="LPC"

## Password for Access Point Y. Leave empty if there is none.
HotSpotYPass=""


## Power off and on AirPort 
#/usr/sbin/networksetup -setairportpower $AirPortInterface off 
#/usr/sbin/networksetup -setairportpower $AirtPortInterface on 

## Command to change AirPort WiFi network
echo "Changing AirPort to $HotSpotX network ..."
/usr/sbin/networksetup -setairportnetwork $AirPortInterface "$HotSpotX" $HotSpotXPass

## Wait for ten seconds to make sure AirPort has connected to the other network.
sleep 10

## Run TimeMachine backup. 
echo "Running TimeMachine Backup-Now. This may take awhile ..."
## This command is equivalent to choosing "Back Up Now" from the Time Machine
## menu extra.
/usr/bin/tmutil startbackup --block


## Change AirPort to use HotSpotY.
echo "Changing AirPort to $HotSpotY network ..."
/usr/sbin/networksetup -setairportnetwork $AirPortInterface "$HotSpotY" $HotSpotYPass

echo "Have fun. :)"
