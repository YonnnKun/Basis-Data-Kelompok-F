-- ==============================================================================
-- LANGKAH 3: PROGRAM DATABASE (FUNCTION, TRIGGER, SP, & VIEW)
-- ==============================================================================
USE restoran;

-- C. STORED PROCEDURE
DELIMITER //
CREATE PROCEDURE HitungTotalPesanan(IN p_id_pesanan VARCHAR(10))
BEGIN
    DECLARE v_total_keseluruhan DECIMAL(10,2);
    SELECT SUM(subtotal) INTO v_total_keseluruhan FROM Detail_Pesanan WHERE id_pesanan = p_id_pesanan;
    UPDATE Pesanan SET total_bayar = IFNULL(v_total_keseluruhan, 0) WHERE id_pesanan = p_id_pesanan;
END //
DELIMITER ;