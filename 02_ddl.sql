-- ==============================================================================
-- LANGKAH 2: PEMBUATAN STRUKTUR TABEL (DDL)
-- ==============================================================================
USE restoran;

-- 1. Tabel Pelanggan
CREATE TABLE Pelanggan (
    id_pelanggan VARCHAR(10) PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    no_telp VARCHAR(15),
    alamat TEXT
);

-- 2. Tabel Karyawan
CREATE TABLE Karyawan (
    id_karyawan VARCHAR(10) PRIMARY KEY,
    nama_karyawan VARCHAR(100) NOT NULL,
    jabatan VARCHAR(50) NOT NULL,
    shift VARCHAR(20), 
    nomor_telepon VARCHAR(15)
);

-- 3. Tabel Meja
CREATE TABLE Meja (
    nomor_meja VARCHAR(10) PRIMARY KEY,
    kapasitas INT NOT NULL CHECK (kapasitas > 0)
);

-- 4. Tabel Menu
CREATE TABLE Menu (
    id_menu VARCHAR(10) PRIMARY KEY,
    nama_menu VARCHAR(100) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL CHECK (harga >= 0)
);

-- 5. Tabel Pembayaran
CREATE TABLE Pembayaran (
    id_bayar VARCHAR(10) PRIMARY KEY,
    metode_pembayaran VARCHAR(30) NOT NULL,
    status_bayar VARCHAR(20) NOT NULL
);

-- 6. Tabel Reservasi 
CREATE TABLE Reservasi (
    id_reservasi VARCHAR(10) PRIMARY KEY,
    id_pelanggan VARCHAR(10),
    nomor_meja VARCHAR(10),
    tanggal_reservasi DATE NOT NULL,
    jumlah_tamu INT NOT NULL CHECK (jumlah_tamu > 0),
    status_reservasi VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (nomor_meja) REFERENCES Meja(nomor_meja)
);

-- 7. Tabel Pesanan
CREATE TABLE Pesanan (
    id_pesanan VARCHAR(10) PRIMARY KEY,
    id_pelanggan VARCHAR(10),
    id_reservasi VARCHAR(10),
    id_karyawan VARCHAR(10),
    id_bayar VARCHAR(10),
    nomor_meja VARCHAR(10),
    tanggal_pemesanan DATE NOT NULL, 
    total_bayar DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (id_karyawan) REFERENCES Karyawan(id_karyawan),
    FOREIGN KEY (id_reservasi) REFERENCES Reservasi(id_reservasi),
    FOREIGN KEY (nomor_meja) REFERENCES Meja(nomor_meja) ON DELETE SET NULL, 
    FOREIGN KEY (id_bayar) REFERENCES Pembayaran(id_bayar)
);

-- 8. Tabel Detail Pesanan
CREATE TABLE Detail_Pesanan (
    id_detail_pesanan VARCHAR(10) PRIMARY KEY,
    id_pesanan VARCHAR(10),
    id_menu VARCHAR(10),
    jumlah_porsi INT NOT NULL CHECK (jumlah_porsi >= 1),
    subtotal DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    catatan_khusus TEXT,
    FOREIGN KEY (id_pesanan) REFERENCES Pesanan(id_pesanan) ON DELETE CASCADE,
    FOREIGN KEY (id_menu) REFERENCES Menu(id_menu)
);

-- 9. Tabel Review
CREATE TABLE Review (
    id_review VARCHAR(10) PRIMARY KEY,
    id_pesanan VARCHAR(10),
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    komentar TEXT,
    FOREIGN KEY (id_pesanan) REFERENCES Pesanan(id_pesanan) ON DELETE CASCADE
);

-- 10. Tabel Bahan Baku
CREATE TABLE Bahan_Baku (
    id_bahan VARCHAR(10) PRIMARY KEY,
    nama_bahan VARCHAR(100) NOT NULL
);

-- 11. Tabel Menu Bahan (Many-to-Many)
CREATE TABLE Menu_Bahan (
    id_menu VARCHAR(10),
    id_bahan VARCHAR(10),
    PRIMARY KEY (id_menu, id_bahan),
    FOREIGN KEY (id_menu) REFERENCES Menu(id_menu) ON DELETE CASCADE,
    FOREIGN KEY (id_bahan) REFERENCES Bahan_Baku(id_bahan) ON DELETE CASCADE
);