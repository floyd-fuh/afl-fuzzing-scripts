#This is a hackish hint file if you have a big afl-cmin job to do on an odroid and you have an external USB ext4 disc with enough space. First, put your input for afl-cmin on the external disc
#Make sure that you are not running out of disc space already:
df -h
#The same for inodes (yes, I managed to use up all inodes with AFL in the past)
df -i
#Ok, so it's best if you put everything possible on the USB disc
mkdir /mnt/external-usb
mount /dev/sda3 /mnt/external-usb #or whatever /dev your USB disc is
#Make a dir that will become /tmp as usually /tmp has usually not enough space as well
mkdir /mnt/external-usb/tmpfs-dir
umount /tmp
ln -s /mnt/tmp3/tmpfs-dir/ /tmp
#Run everything through the USB disc:
afl-cmin -i /mnt/external-usb/input/ -o /mnt/external-usb/target-cmined -- /opt/target/target -i @@ -loglevel quiet