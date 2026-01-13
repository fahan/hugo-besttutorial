---
title: "Berbagai Cara Membuat Bootable Flashdisk"
date: 2018-09-30
categories: 
  - "informatika"
tags: 
  - "bootable-flashdisk"
  - "bootable-usb"
  - "instal-sistem-operasi"
  - "komputer"
  - "sistem-operasi"
  - "teknologi"
coverImage: "bootable-flashdisk.jpg"
slug: "cara-membuat-bootable-flashdisk"
---

## Apa itu Bootable Flashdisk ?

**Cara membuat bootable flashdisk** - Kamu ingin mengupgrade Sistem Operasi laptopmu atau kamu baru saja beli laptop baru dan ingin instal OS baru dilaptop barumu?.

Kamu ingin OS windows 10, windows 8, windows 7 atau Linux?, atau malah kamu ingin menjadikan laptopmu menjadi _dual boot / multi boot ?._ 

Yang jelas kamu pasti membutuhkan yang namanya media Instalasi entah itu menggunakan DVD ataupun Flashdisk.

Tapi apakah kamu sudah tahu apa itu Bootable Flashdisk ?.

Bagi kamu yang ingin melakukan instal sistem operasi, maka kamu wajib mengetahuinya karena pada umumnya media instalasi digunakan sekarang adalah Bootable Flashdisk.

<figure>

![](/images/bootable-flashdisk-1.jpg)

<figcaption>

makeusof.com  | Bootable Flashdisk

</figcaption>

</figure>

_Bootable_ sebenarnya fitur _booting_ dari sistem operasi yang difungsingkan agar Sistem Operasi dapat di akses. Jadi setiap media instalasi OS baik itu Flashdisk, CD/DVD atau media penyimpanan lainnya merupakan _bootable._

Dinamakan _bootable_ karena kemampuannya untuk merubah suatu media penyimpanan bisa disetting menjadi _first boot_ pada BIOS. Pengaturan seperti ini dapat dilakukan pada menu _Boot_ di BIOS.

Keuntungan menggunakan bootable flashdisk adalah simple, efektif dan efisien karena ukuran flashdisk yang mini dan berkapasitas cukup besar. Jika kamu mempunyai laptop yang tidak dilengkapi dengan DVD ROM maka bootable flashdisk adalah solusinya.

Ada banyak cara untuk bisa membuat suatu media penyimpanan menjadi _bootable,_ yang akan dijelaskan dalam tutorial ini adalah berbagai cara membuat _bootable flashdisk_. Berikut paparannya,

## Cara Membuat Bootable Flashdisk Tanpa Software

Penggunaan flashdisk sebagai media bootable merupakan pilihan yang paling tepat karena lebih efektif dan efisien apalagi bagi kamu yang memiliki mobilitas tinggi.

Untuk membuat bootable sebenarnya lebih praktis menggunakan aplikasi _creator bootable_ yang tersedia banyak di Internet.

Namun tanpa aplikasipun kamu masih tetap bisa membuat bootable flashdisk lho.

Pengin tahu caranya?

Kamu bisa simak tutorial cara membuat Bootable Flashdisk tanpa software berikut ini.

### Cara #1. Hanya Menggunakan Windows Explorer

<figure>

![](/images/copy-file.png)

<figcaption>

howtogeek.com | Copy File

</figcaption>

</figure>

Hal pertama sebelum memulai membuat bootable menyediakan alat dan bahan dalam pembuatan bootable via flashdisk ini, yaitu :

- Mantapkan niat.
- File ISO OS windows 7,8,8.1, atau windows 10.
- Flashdisk dengan kapasitas minimal 4GB dan dalam kondisi normal
- Teliti membaca tutorial ini

Saya ingatkan sebelumnya, bahwa cara ini hanya bisa digunakan untuk OS Windows saja ya tidak untuk OS Linux.

Setelah semua alat dan bahan siap langsung saja mulai eksekusi.

1. Tancapkan Flashdisk yang akan dijadikan Bootable, pastikan kapasitasnya lebih dari 4 GB dan berfungsi dengan baik
2. Format Flashdisk dengan tipe _File System_ NTFS, dengan cara klik kanan pada Drive USB yang akan di format.
3. Tunggu sampai proses format selesai.
4. Ekstrak file ISO yang akan jadi OS bootable, kamu bisa menggunakan aplikasi winrar (jika pas instalnya kamu aktiftkan pilihan ISO) atau juga bisa menggunakan aplikasi Virtual Clone Drive
5. Tempatkan file ekstrak ISOnya di flashdisk yang sudah diformat.
6. Tunggu sampai proses ekstrak selesai, setelah itu bootable flashsik sudah bisa digunakan.

Cukup mudah kan ?, tidak memerlukan aplikasi pembuat bootable flashdisk. Namun tidak semua laptop bisa menggunakan cara ini, karena kadang memerlukan konversi tipe hasdisk dari MBR ke tipe GPT atau sebaliknya.

Secara umum cara ini bisa dipakai diberbagai merek laptop yang ada saat ini.

### Cara #2. Hanya Menggunakan CMD _(Command Prompt)_

<figure>

![cara membuat bootable flashdisk dengan cmd](/images/bootable-usb-pendrive-by-cmd.jpg)

<figcaption>

deskdecode.com | Bootable Flashdisk

</figcaption>

</figure>

Cara ke #2 ini hampir sama dengan cara yang pertama, alat dan bahannya pun sama letak perbedaanya hanya di penggunaan CMD _(command prompt)._ Berikut ini langkah detailnya.

1. Tancapkan flashdisk yang akan digunakan.
2. Buka aplikasi Diskpart dengan menekan tombol Windows + R, lalu ketik diskpart terus enter.
3. Aplikasi _command promp_ Diskpart akan terbuka, lihat daftar disk penyimpanan dengan memasukkan perintah _"list disk"_.
4. Semua disk penyimpanan yang tampil namanya disk 1, disk 2 dan seterusnya, jadi untuk mengetahui flashdikmu cukup lihat ukuran kapasitasnya.
5.  Kemudian pilih disk flashdisk kamu, setiap komputer berbeda-beda, cukup ketikkan perintah "disk 3" jika disk 3 adalah flashdiskmu.
6. Lakukan format dengan memasukkan perintah "clean", pastikan proses format berhasil sampai muncul pesan _"succeded in cleaning the disk"_.
7. Buatlah partisi utama untuk flashdiskmu dengan memasukan perintah _"create partition primary"._
8. Aktifkan partisi tersebut dengan perintah _"active"._ 
9. Rubah tipe _file system_ menjadi FAT32 dengan memasukkan perintah _"format fs=fat32 label=_(nama flasdiskmu) _quick"_ lalu enter.
10. Jika berhasil maka akan keluar pesan _"succesfully formatted the volume"._ lalu tutup aplikasi diskpart.
11. Ekstrak semua isi File ISO ke flashdisk.
12. Jika proses ekstrak selesai dengan sukses maka bootable flashdisk siap digunakan untuk menginstal windows dan icon flashdisk berubah menjadi icon installer windows. 

Kamu bisa menentukan sendiri mau pakai cara 1 atau 2, kedua-duanya dapat dilakukan dengan mudah tanpa memerlukan software tambahan. 

## Cara Membuat Bootable Flashdisk Menggunakan Rufus

<figure>

![cara membuat bootable flashdisk dengan rufus](/images/rufus-logo.png)

<figcaption>

bootableusb.net | Rufus

</figcaption>

</figure>

Cara lain dalam membuat  bootable flashdisk adalah dengan menggunakan software tambahan contohnya Rufus.

Rufus merupakan salah satu software pembuat bootable flashdisk yang dianggap terbaik. Ukuran yang dimiliki tergolong ringan, mudah digunakan, dan portabel. Jadi tidak harus melakukan instalasi rufus terlebih dulu.

Berikut cara membuat bootable flashdisk menggunakan rufus :

- Siapkan Flashdisk dan software Rufus, jika kamu belum mempunyainya bisa [download Aplikasi Rufus](https://rufus.akeo.ie/) dulu, Gratis.
- Tancapkan flashdisk yang akan dijadikan bootable flashdisk
- Pastikan flashdisk dalam kondisi kosong atau tidak terdapat file yang penting
- Buka aplikasi Rufus menggunakan hak akses administrator dengan cara klik kanan pada aplikasi rufus lalu _**run as administrator**_
- Jika aplikasi Rufus sudah terbuka maka pilih flashdisk yang akan dijadikan bootable di kolom _Device._
- Pilih NTFS pada kolom _file system,_ dan biarkan kolom lainnya default saja, detailnya bisa dilihat digambar
- Kemudian pada kolom _create a bootable disk using_ pilih ISO Image dan masukkan file ISO OSnya melalui gambar DVD disampingnya.
- Ketika file ISO sudah dimasukkan Rufus akan melakukan _scanning file ISO,_ apakah mampu dijadikan bootable.
- Jika keluar Status **Ready,** maka proses pembuatan bootable siap dieksekusi, jadi langsung tekan tombol **start.**
- Pada proses ini flashdisk akan otomatis di Format dan file OS akan otomatis dikopikan ke flashdisk yang memakan waktu sampai 30 menit, tergantung dari kecepatan flashdisknya.
- Jika sudah selesai indikator bar warna hijau akan terisi penuh dan status menjadi READY yang artinya bootable flashdisk siap dipakai. 

Cukup simpelkan, sebenarnya konsep dasarnya sama dengan cara membuat bootable flashdisk tanpa software.

Letak perbedaanya Rufus memiliki fitur memilih format GPT atau MBR hardisk yang akan diinstal jadi lebih fleksibel.

## Cara Membuat Bootable Flashdisk di Linux

<figure>

![cara membuat bootable flashdisk dengan unetbootin linux](/images/como-instalar-o-ubuntu-por-pendrive.jpg)

<figcaption>

diolinux.com | Unetbootin

</figcaption>

</figure>

Tidak semua orang menggunakan sistem operasi windows ada juga yang menggunakan sistem operasi Linux. Mungkin bagi kamu pengguna Linux akan mengalami sedikit kesulitan dalam membuat bootable flashdisk di Linux.

Membuat Bootable Flashdisk di linux sebenarnya cukuplah mudah. Bagi  pengguna windows caranya sudah ditunjukan diatas.

Namun, aplikasi windows tidak bisa berjalan di Linux pastinya hal ini akan sangat menyulitkan bagi kamu yang akan membuat Bootable Flashdisk di Linux.

Untuk itu, kamu bisa membaca tutorial berikut ini tentang “Cara Membuat Boostable Flashdisk di Linux”.

Untuk membuat bootable flashdisk di linux kamu bisa menggunakan salah satu aplikasi yang kompatibel dengan SIstem Operasi Linux yaitu unetbootin.

UnetBootin juga tersedia untuk sistem operasi Windows dan juga Mac. 

Langkah pertama kamu bisa mendowload unetbootin melalui link [download unetbootin,](http://tusfiles.net/0r6pli0n79bn) kamu juga bisa menggunakan PPA dari Linux ubuntu yaitu dengan perintah berikut,

```
sudo add-apt-repository ppa:gezakovacs/ppa
sudo apt-get update
sudo apt-get install unetbootin
```

- Buka aplikasi UnetBootin Jika berhasil dipasang.
- Pilih File ISO pada _Disk Image_.
- Pilih USB Drive sebagai _type_ media instalasi.
- Tekan tombol OK untuk langusng memula proses pembuatan bootable flashdisk.
- Kurang lebih proses akan berjalan selama 5 menit
- Tunggu prosesnya sampai selesai kurang lebih sekitar 5 menit.
- Jika berhasil maka akan ditujukan dengan _Instalation Complete._
- Hal ini menunjukkan bootable flashdisk suadh jadi dan siap untuk digunakan untuk instalasi OS.

Bagaimana menurut kamu?  Mudah kan.

* * *

Kamu bisa mencoba semua metode yang sudah dipaparkan diatas untuk membuat bootable flashdisk, entah itu untuk [menginstal windows 10](https://34.126.127.69/tutorial-cara-instal-windows-10/) atau versi windows lainnya bahkan Linux.

Supaya menambah wawasan dan keahlianmu dalam bidang IT.

Jika ada yang mau ditanyakan terkait cara membuat bootable flashdisk, bisa kamu sampaikan melalui kolom komentar.

_Good luck and see you on next article. . . ._
