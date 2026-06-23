-- ==============================================================================
-- LANGKAH 3: PROGRAM DATABASE (FUNCTION, TRIGGER, SP, & VIEW)
-- ==============================================================================
USE restoran;

-- B. TRIGGER
DELIMITER //
CREATE TRIGGER trg_auto_hitung_subtotal
BEFORE INSERT ON Detail_Pesanan
FOR EACH ROW
BEGIN
    DECLARE v_harga_menu DECIMAL(10,2);
    SELECT harga INTO v_harga_menu FROM Menu WHERE id_menu = NEW.id_menu;
    SET NEW.subtotal = NEW.jumlah_porsi * v_harga_menu;
END //
DELIMITER ;