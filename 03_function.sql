-- ==============================================================================
-- LANGKAH 3: PROGRAM DATABASE (FUNCTION, TRIGGER, SP, & VIEW)
-- ==============================================================================
USE restoran;

-- A. FUNCTION
DELIMITER //
CREATE FUNCTION KlasifikasiHargaMenu(p_harga DECIMAL(10,2)) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE v_tier VARCHAR(20);
    IF p_harga >= 45000 THEN SET v_tier = 'Premium Tier';
    ELSEIF p_harga >= 25000 THEN SET v_tier = 'Standard Tier';
    ELSE SET v_tier = 'Budget Friendly';
    END IF;
    RETURN v_tier;
END //
DELIMITER ;

