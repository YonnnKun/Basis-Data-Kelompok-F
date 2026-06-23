-- ==============================================================================
-- LANGKAH 1: INISIALISASI DATABASE & PEMBERSIHAN
-- ==============================================================================

DROP DATABASE IF EXISTS restoran;
CREATE DATABASE IF NOT EXISTS restoran;
USE restoran;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Detail_Pesanan;
DROP TABLE IF EXISTS Pesanan;
DROP TABLE IF EXISTS Pembayaran;
DROP TABLE IF EXISTS Reservasi;
DROP TABLE IF EXISTS Menu_Bahan;
DROP TABLE IF EXISTS Bahan_Baku;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS Meja;
DROP TABLE IF EXISTS Karyawan;
DROP TABLE IF EXISTS Pelanggan;
SET FOREIGN_KEY_CHECKS = 1;
