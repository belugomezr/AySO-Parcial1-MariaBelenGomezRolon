lsblk 

#!/bin/bash

sudo fdisk /dev/sdc << EOF

n
p
1

+2G
n
p
2

+2G
n
p
3

+2G
n
e
4

w

EOF


echo "Particiones"



sudo fdisk -l /dev/sdc


