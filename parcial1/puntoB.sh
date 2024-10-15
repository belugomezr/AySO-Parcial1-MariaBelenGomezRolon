

#!bin/bash


sudo fdisk /dev/sdc << EOF

n
p
1

+2.5G
n
p
2

+2.5G
n
p
3

+2.5G
n
e
4


w

EOF

echo "MIS PARTICIONES"

sudo partprobe dev/sdc
sudo fdisk -l /dev/sdc


