Adb/Fastboot Moda al cihazı

adb devices
adb reboot bootloader

# A/B olmayan (tek slot) cihazlar için
fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img

# A/B (slotlu) cihazlar için
fastboot --disable-verity --disable-verification flash vbmeta_a vbmeta.img
fastboot --disable-verity --disable-verification flash vbmeta_b vbmeta.img

fastboot reboot

# Kontrol (cihaz açıldıktan sonra)
adb shell getprop ro.boot.verifiedbootstate# Dm_verity
Dm verity disabler

**Beklenen çıktı:**
orange veya yellow → dm-verity kapalı
green → dm-verity açık
