
# Sipatex Mobile Challenge

Merupakan sebuah aplikasi yang dibuat sebagai assignment apply job di sipatex.

Environment yang dibuat di aplikasi ini adalah sebagai berikut :
- aplikasi dibuat dengan menggunakan statement GetX
- untuk menyimpan data user pada device secara local menggunakan package sqflite
- untuk mengolah data login dan validasi dari hak akses login menggunakan GetStorage

Penggunaan Aplikasi :
- aplikasi dapat dijalan kan pada device mobile yang terhubung
- aplikasi dapat dibuild menjadi sebuah apk sehingga tidak perlu selalu menghubungkan ke perangkat development

untuk menjalankan aplikasi terdapat 2 metode :
> Metode 1
- git pull project
- buka project di code editor
- jalankan emulator device mobile
- pada code editor yang mendukung flutter dapat langsung menjalankan dengan click run

> Metode 2
- git pull project
- buka project di code editor
- pada tab menu, click build
- pilih flutter, lalu build apk
- pindahkan file apk ke perangkat mobile
- pada perangkat mobile buka file apk tersebut

Penggunaap pada saat Aplikasi dijalankan :
- pada screen login pengguna dapat register terlebih dahulu. username berformat email dan name email di belakang "@" minimal memiliki 8 karakter. pengguna mengisi password dan memilih role.
- kembali ke screen login, masukkan usernam dan password yang sudah di daftarkan.
- pengguna akan di arahkan ke screen dashboard.
- pada screen dashboard terdapat screen product, users, dan profile.
- pada screen product dan users role "Admin" pengguna memiliki akses tambah, ubah, dan hapus, jika Guest pengguna hanya dapat melihat data
- pada screen profile pengguna dapat melihat isi profil akun dan dapata melakukan sign out