
lsblk

loop0    7:0    0 38.8M  1 loop /snap/snapd/21759
loop1    7:1    0 63.9M  1 loop /snap/core20/2318
loop2    7:2    0   87M  1 loop /snap/lxd/29351
loop3    7:3    0   64M  1 loop /snap/core20/2379
sda      8:0    0   40G  0 disk
└─sda1   8:1    0   40G  0 part /
sdb      8:16   0   10M  0 disk
sdc      8:32   0   10G  0 disk
├─sdc1   8:33   0  2.5G  0 part
├─sdc2   8:34   0  2.5G  0 part
├─sdc3   8:35   0  2.5G  0 part
└─sdc4   8:36   0  2.5G  0 part
sdd      8:48   0    2G  0 disk


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
sudo mkfs.ext /dev/sdc4

sudo mkdir -p /mnt/disco/{sdc1,sdc2,sdc3,sdc4}

df -h

sudo mount /dev/sdc1 /mnt/disco/sdc1
sudo mount /dev/sdc2 /mnt/disco/sdc2
sudo mount /dev/sdc3 /mnt/disco/sdc3
sudo mount /dev/sdc4 /mnt/disco/sdc4


df -h
