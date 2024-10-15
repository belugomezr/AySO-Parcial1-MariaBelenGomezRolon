
lsblk


#!/bin/bash

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
p
4

+2.5G

w

EOF

sudo partprobe /dev/sdc

echo "mis particiones"


sudo fdisk -l /dev/sdc

sudo mkfs.ext2 /dev/sdc1
sudo mkfs.ext3 /dev/sdc2
sudo mkfs.ext4 /dev/sdc3
sudo mkfs.ext4 /dev/sdc4




