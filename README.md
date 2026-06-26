# Basis-Data-Kelompok-F
Project Basis Data Kelompok F

# Deskripsi Project
Project ini merancang dan mengimplementasikan basis data relasional untuk Sistem Manajemen Restoran menggunakan MySQL. Sistem mencakup pengelolaan data pelanggan, karyawan, menu, pesanan, pembayaran, reservasi meja, ulasan pelanggan, hingga manajemen bahan baku secara terintegrasi.

Basis data dirancang melalui proses normalisasi bertahap dari bentuk tidak normal (UNF) hingga Bentuk Normal Ketiga (3NF), menghasilkan 11 tabel relasional yang efisien dan bebas dari redundansi data. Otomasi proses bisnis dilakukan melalui objek SQL berupa Stored Procedure, Trigger, View, dan Function.

## ANGGOTA KELOMPOK :

```text
Galih Tri Prasetyo 		        (K1D024028) 
Dionisius Anthoni Pratama   	(K1D024031)
Rahma Aulia Fatma		        (K1D024032)
Aditya Febrio Setiawan	     	(K1D024036) 
Arroja Aliya Fadhilah   	  	(K1D024037)

```
## Cara Menjalakan Script
1. Buka MySQL Workbench dan buat koneksi ke server MySQL.

2. Buat database baru:

3. Jalankan script DDL (buat struktur tabel):
   Jalankan seluruh perintah CREATE TABLE sesuai urutan berikut agar Foreign Key dapat terdefinisi dengan benar:
    - Pelanggan
    - Karyawan
    - Meja
    - Menu
    - Pembayaran
    - Reservasi
    - Pesanan
    - Detail_Pesanan
    - Review
    - Bahan_Baku
    - Menu_Bahan
      
  4. Jalankan script objek SQL (Stored Procedure, Trigger, View, Function):
      Pastikan Trigger trg_auto_hitung_subtotal sudah aktif sebelum memasukkan data Detail_Pesanan.

  5. Jalankan script DML (isi data):
     - Pelanggan → Karyawan → Meja → Menu → Pembayaran
     - Bahan_Baku → Menu_Bahan → Reservasi
     - Pesanan → Detail_Pesanan (Trigger otomatis menghitung subtotal)
     - Review
     - Eksekusi CALL HitungTotalPesanan('PSxx') untuk setiap pesanan
       
  6. Verifikasi dengan menjalankan query pengujian:

  #Note
  - Nilai subtotal pada Detail_Pesanan dan total_bayar pada Pesanan diisi 0 saat INSERT — keduanya akan diperbarui otomatis oleh Trigger dan Stored Procedure.
  - Metode pembayaran yang valid: Tunai, QRIS, Kartu, Transfer.
  - Shift karyawan yang valid: Pagi, Siang, Sore.
  - Rating review harus antara 1 sampai 5.

# ERD
![alt text](https://github.com/YonnnKun/Basis-Data-Kelompok-F/blob/main/ERD%20Manajemen%20Restoran.drawio.png?raw=true)

# Sturuktur Folder
Basis-Data-Kelompok-F/
├── 01_inisialisasi.sql
├── 02_ddl.sql
├── 03_function.sql
├── 04_trigger.sql
├── 05_procedure.sql
├── 06_view.sql
├── 07_dml.sql
├── 08_query.sql
├── ERD Manajemen Restoran
├── ERD_BASDAT_drawio_5.png
├── LAPORAN TUGAS PROJECT Basis Data FINAL.docx
├── Normalisasi Data.xlsx
├── Video Demo Query MySQL
└── README.md






