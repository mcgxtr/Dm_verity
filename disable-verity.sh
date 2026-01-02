#!/sbin/sh

ui_print() {
  echo "$1"
}

ui_print "Mounting partitions..."

mount /vendor 2>/dev/null
mount /system 2>/dev/null
mount /product 2>/dev/null

ui_print "Searching fstab files..."

for part in /vendor /system /product; do
  if [ -d $part/etc ]; then
    for fstab in $part/etc/fstab*; do
      if [ -f "$fstab" ]; then
        ui_print "Patching $fstab"
        sed -i 's/,verify//g' $fstab
        sed -i 's/,avb//g' $fstab
        sed -i 's/,verity//g' $fstab
      fi
    done
  fi
done

ui_print "Unmounting partitions..."

umount /vendor 2>/dev/null
umount /system 2>/dev/null
umount /product 2>/dev/null

ui_print "dm-verity disabled (if supported)."