## ⚠️ Sorumluluk Reddi

Bu yazılım **eğitim ve geliştirme amaçlı** olarak paylaşılmıştır.  
Cihazınızda oluşabilecek **bootloop, veri kaybı, sistem hasarı, garanti dışı kalma** gibi durumlardan **geliştirici hiçbir şekilde sorumlu değildir**.

Bu ZIP’i kullanmak tamamen **kullanıcının kendi sorumluluğundadır**.  
Ne yaptığını bilmeyen kullanıcıların kullanması **önerilmez**.

Devam ederek tüm sorumluluğu kabul etmiş sayılırsınız.

### Yöntem1

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

### Yöntem2

adb shell
su

mount -o rw,remount /

# fstab dosyasını düzenle
vi /vendor/etc/fstab.*

# Aşağıdaki parametreleri SİL
# verify
# avb

# Kaydet ve çık
reboot

**Control**
adb shell getprop ro.boot.verifiedbootstate
