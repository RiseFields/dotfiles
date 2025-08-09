#!/bin/bash
function default_interface {
    ip route | awk '/^default via/ {print $5; exit}'
}
iface="${iface:-$(default_interface)}"
# echo "$iface"

INTERVAL="0.2"  # update interval in seconds
R1=`cat /sys/class/net/$iface/statistics/rx_bytes`
T1=`cat /sys/class/net/$iface/statistics/tx_bytes`
sleep $INTERVAL
R2=`cat /sys/class/net/$iface/statistics/rx_bytes`
T2=`cat /sys/class/net/$iface/statistics/tx_bytes`
TBPS=`expr $T2 - $T1`
RBPS=`expr $R2 - $R1`
TKBPS=$(($TBPS / 1024 *5))
RKBPS=$(($RBPS / 1024 *5))

text="$RKBPS/$TKBPS kB/s"
echo "$text"
