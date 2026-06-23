-- ==============================================================================
-- LANGKAH 5: SINTAKS MENAMPILKAN SEMUA HASIL TABEL & PROGRAM DATABASE
-- ==============================================================================
USE restoran;

-- --- MENAMPILKAN DATA DARI SEMUA 11 TABEL MASTER & TRANSAKSI ---

SELECT * FROM Pelanggan;
SELECT * FROM Karyawan;
SELECT * FROM Meja;
SELECT * FROM Menu;
SELECT * FROM Pembayaran;
SELECT * FROM Reservasi;
SELECT * FROM Pesanan;
SELECT * FROM Detail_Pesanan;
SELECT * FROM Review;
SELECT * FROM Bahan_Baku;
SELECT * FROM Menu_Bahan;

-- --- MENAMPILKAN HASIL PENGUJIAN 10 QUERY SISTEM ---

-- [KELOMPOK A: 3 QUERY SEDERHANA]
-- 1. Menampilkan menu beserta kelas tiering harganya menggunakan FUNCTION
SELECT id_menu, nama_menu, harga, KlasifikasiHargaMenu(harga) AS tier_harga 
FROM Menu;

-- 2. Menampilkan daftar meja yang memiliki kapasitas 3 orang atau lebih
SELECT nomor_meja, kapasitas FROM Meja 
WHERE kapasitas >= 3;

-- 3. Tampilkan Karyawan & Jabatan
SELECT nama_karyawan, jabatan FROM Karyawan;


-- [KELOMPOK B: 4 QUERY JOIN MINIMAL 3 TABEL]
-- 4. JOIN 3 Tabel: Pesanan, Pelanggan, dan Karyawan 
SELECT pes.id_pesanan, pes.tanggal_pemesanan, p.nama_pelanggan, k.nama_karyawan 
FROM Pesanan pes
JOIN Pelanggan p ON pes.id_pelanggan = p.id_pelanggan
JOIN Karyawan k ON pes.id_karyawan = k.id_karyawan;

-- 5. JOIN 3 Tabel: Detail Pesanan, Pesanan, dan Menu 
SELECT dp.id_detail_pesanan, pes.tanggal_pemesanan, m.nama_menu, dp.jumlah_porsi, dp.subtotal
FROM Detail_Pesanan dp
JOIN Pesanan pes ON dp.id_pesanan = pes.id_pesanan
JOIN Menu m ON dp.id_menu = m.id_menu;

-- 6. JOIN 3 Tabel: Menu, Menu_Bahan, dan Bahan_Baku
SELECT m.nama_menu, bb.nama_bahan
FROM Menu m
JOIN Menu_Bahan mb ON m.id_menu = mb.id_menu
JOIN Bahan_Baku bb ON mb.id_bahan = bb.id_bahan;

-- 7. JOIN 3 Tabel: Review, Pesanan, dan Pelanggan
SELECT r.id_review, p.nama_pelanggan, pes.id_pesanan, r.rating, r.komentar
FROM Review r
JOIN Pesanan pes ON r.id_pesanan = pes.id_pesanan
JOIN Pelanggan p ON pes.id_pelanggan = p.id_pelanggan;


-- [KELOMPOK C: 2 QUERY SUBQUERY / CTE]
-- 8. Subquery (Derived Table): Menampilkan data pelanggan dengan nilai belanja > Rp 50.000
SELECT p.nama_pelanggan, p.no_telp, trx_besar.total_bayar
FROM Pelanggan p
JOIN (
    SELECT id_pelanggan, total_bayar 
    FROM Pesanan 
    WHERE total_bayar > 50000
) AS trx_besar ON p.id_pelanggan = trx_besar.id_pelanggan;

-- 9. CTE (Common Table Expression): Memfilter menu makanan yang memiliki rating ulasan rata-rata > 3.0
WITH RataRataRating AS (
    SELECT dp.id_menu, AVG(r.rating) AS avg_rating 
    FROM Review r
    JOIN Pesanan pes ON r.id_pesanan = pes.id_pesanan
    JOIN Detail_Pesanan dp ON pes.id_pesanan = dp.id_pesanan
    GROUP BY dp.id_menu
)
SELECT m.nama_menu, r.avg_rating
FROM Menu m
JOIN RataRataRating r ON m.id_menu = r.id_menu
WHERE r.avg_rating > 3.0;


-- [KELOMPOK D: 1 QUERY FUNGSI AGREGAT + GROUP BY + HAVING]
-- 10. GROUP BY & HAVING: Mencari menu yang total porsi terjual secara akumulatif > 3 porsi
SELECT m.id_menu, m.nama_menu, SUM(dp.jumlah_porsi) AS total_porsi_terjual
FROM Detail_Pesanan dp
JOIN Menu m ON dp.id_menu = m.id_menu
GROUP BY m.id_menu, m.nama_menu
HAVING SUM(dp.jumlah_porsi) > 3;