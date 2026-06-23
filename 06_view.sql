-- ==============================================================================
-- LANGKAH 3: PROGRAM DATABASE (FUNCTION, TRIGGER, SP, & VIEW)
-- ==============================================================================
USE restoran;

-- D. VIEW SISTEM LAPORAN
-- VIEW 1: Laporan Pendapatan Harian Restoran
CREATE VIEW View_Pendapatan_Harian AS
SELECT 
    tanggal_pemesanan AS tanggal_transaksi, 
    COUNT(DISTINCT id_pesanan) AS jumlah_transaksi,
    SUM(total_bayar) AS total_pendapatan
FROM Pesanan
GROUP BY tanggal_pemesanan;

-- MENAMPILKAN DATA DARI PROGRAM VIEW --
SELECT * FROM View_Pendapatan_Harian;


-- VIEW 2: Cetak Struk Transaksi Detail Lengkap Pelanggan
CREATE VIEW View_Struk_Pesanan AS
SELECT 
    pes.id_pesanan, p.nama_pelanggan, m.nama_menu, dp.jumlah_porsi,
    m.harga AS harga_satuan, dp.subtotal AS subtotal
FROM Pesanan pes
JOIN Pelanggan p ON pes.id_pelanggan = p.id_pelanggan
JOIN Detail_Pesanan dp ON pes.id_pesanan = dp.id_pesanan
JOIN Menu m ON dp.id_menu = m.id_menu;

-- MENAMPILKAN DATA DARI PROGRAM VIEW ---
SELECT * FROM View_Struk_Pesanan;