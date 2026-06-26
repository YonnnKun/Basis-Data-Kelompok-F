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

#ERD
Daftar Entitas,    Primary Key,            Foreign Key,                                              atribut
- Pelanggan        id_pelanggan                 -                                                    nama_pelanggan, email, nomor_telepon, alamat                
- Karyawan         id_karyawan                  -                                                    nama_karyawan, jabatan, shift, nomor_telepon
- Meja             nomor_meja                   -                                                    kapasitas
- Menu             id_menu                      -                                                    nama_menu, harga
- Pembayaran       id_bayar                     -                                                    metode_pembayaran, status_bayar
- Reservasi        id_reservasi            (nomor_meja, id_pelanggan)                                tanggal_reservasi, jumlah_tamu, status_reservasi
- Pesanan          id_pesanan              (id_pelanggan, nomor_meja, id_karyawan, id_bayar)         total_bayar, tanggal_pemesanan
- Detail_Pesanan   id_detail_pesanan       (id_pesanan, id_menu)                                     id_menujumlah_porsi, subtotal, catatan_khusus
- Review           id_review               (id_pelanggan, id_menu)                                   rating (1–5), komentar
- Bahan_Baku       id_bahan                     -                                                    nama_bahan
- Menu_Bahan       (id_menu, id_bahan)     (id_menu, id_bahan)

Kardinaliat Relasi
Pelanggan → Pesanan      (1 : M)
Pelanggan → Reservasi    (1 : M)
Pelanggan → Review       (1 : M)
Karyawan → Pesanan       (1 : M)
Meja → Reservasi         (1 : M)
Meja → Pesanan           (1 : M)
Pembayaran → Pesanan     (1 : M)
Pesanan → Detail_Pesanan (1 : M)
Menu → Detail_Pesanan    (1 : M)
Menu → Review            (1 : M)
Menu ↔ Bahan_Baku        (M : N) 

# Sturuktur Folder
Basis-Data-Kelompok-F/
│
├── 01_inisialisasi.sql          # Inisialisasi: buat database & pengaturan awal
├── 02_ddl.sql                   # DDL: CREATE TABLE 11 tabel (PK, FK, constraint)
├── 03_function.sql              # Function: KategoriPelanggan
├── 04_trigger.sql               # Trigger: trg_auto_hitung_subtotal
├── 05_procedure.sql             # Stored Procedure: HitungTotalPesanan
├── 06_view.sql                  # View: laporan pendapatan harian & cetak struk
├── 07_dml.sql                   # DML: INSERT seluruh data (pelanggan s/d review)
├── 08_query.sql                 # Query pengujian: SELECT, JOIN, subquery, CTE, agregasi
│
├── ERD Manajemen Restoran       # File ERD (draw.io / gambar)
├── ERD_BASDAT_drawio_5.png      # Export ERD dalam format PNG
├── LAPORAN TUGAS PROJECT...     # Laporan lengkap (.docx)
├── Normalisasi Data.xlsx        # Tabel normalisasi UNF → 1NF → 2NF → 3NF
├── Video Demo Query My...       # Video demonstrasi eksekusi query di MySQL
│
└── README.md                    # Dokumentasi project ini






