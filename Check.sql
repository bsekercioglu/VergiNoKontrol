/*
Tablo üzerindeki Vergi numaralarının doğruluğunu kontrol eder.
Kullanımı:
Select * from TabloAdi Where FN_VKNO_DOGRUMU(vergino)=1

Vergi Kimlik numarası doğru olan kayıtları listeler.

*/
CREATE FUNCTION [dbo].[FN_VKNO_DOGRUMU](@VKNO VARCHAR(10))
RETURNS BIT
BEGIN
DECLARE
@V_LAST_DIGIT SMALLINT,
@V_1 SMALLINT,
@V_2 SMALLINT,
@V_3 SMALLINT,
@V_4 SMALLINT,
@V_5 SMALLINT,
@V_6 SMALLINT,
@V_7 SMALLINT,
@V_8 SMALLINT,
@V_9 SMALLINT,
@V_11 SMALLINT,
@V_22 SMALLINT,
@V_33 SMALLINT,
@V_44 SMALLINT,
@V_55 SMALLINT,
@V_66 SMALLINT,
@V_77 SMALLINT,
@V_88 SMALLINT,
@V_99 SMALLINT,
@TOPLAM SMALLINT,
@R Bit
--


SET @V_1 = (CAST(SUBSTRING(@VKNO,1,1) AS SMALLINT) + 9) % 10
SET @V_2 = (CAST(SUBSTRING(@VKNO,2,1) AS SMALLINT) + 8) % 10
SET @V_3 = (CAST(SUBSTRING(@VKNO,3,1) AS SMALLINT) + 7) % 10
SET @V_4 = (CAST(SUBSTRING(@VKNO,4,1) AS SMALLINT) + 6) % 10
SET @V_5 = (CAST(SUBSTRING(@VKNO,5,1) AS SMALLINT) + 5) % 10
SET @V_6 = (CAST(SUBSTRING(@VKNO,6,1) AS SMALLINT) + 4) % 10
SET @V_7 = (CAST(SUBSTRING(@VKNO,7,1) AS SMALLINT) + 3) % 10
SET @V_8 = (CAST(SUBSTRING(@VKNO,8,1) AS SMALLINT) + 2) % 10
SET @V_9 = (CAST(SUBSTRING(@VKNO,9,1) AS SMALLINT) + 1) % 10
SET @V_LAST_DIGIT = CAST(SUBSTRING(@VKNO,10,1) AS SMALLINT)
--
SET @V_11 = (@V_1 * 512) % 9
SET @V_22 = (@V_2 * 256) % 9
SET @V_33 = (@V_3 * 128) % 9
SET @V_44 = (@V_4 * 64) % 9
SET @V_55 = (@V_5 * 32) % 9
SET @V_66 = (@V_6 * 16) % 9
SET @V_77 = (@V_7 * 8) % 9
SET @V_88 = (@V_8 * 4) % 9
SET @V_99 = (@V_9 * 2) % 9
--
IF @V_1 != 0 AND @V_11 = 0 SET @V_11 = 9
IF @V_2 != 0 AND @V_22 = 0 SET @V_22 = 9
IF @V_3 != 0 AND @V_33 = 0 SET @V_33 = 9
IF @V_4 != 0 AND @V_44 = 0 SET @V_44 = 9
IF @V_5 != 0 AND @V_55 = 0 SET @V_55 = 9
IF @V_6 != 0 AND @V_66 = 0 SET @V_66 = 9
IF @V_7 != 0 AND @V_77 = 0 SET @V_77 = 9
IF @V_8 != 0 AND @V_88 = 0 SET @V_88 = 9
IF @V_9 != 0 AND @V_99 = 0 SET @V_99 = 9
--
SET @TOPLAM = @V_11 + @V_22 + @V_33 + @V_44 +  @V_55 + @V_66 +  @V_77 + @V_88 + @V_99
IF @TOPLAM %10 =0
BEGIN
SET @TOPLAM=0
END
ELSE
BEGIN
SET @TOPLAM = (10 - (@TOPLAM %10))
END
--
IF @TOPLAM = @V_LAST_DIGIT
SET @R = 1 -- DOĞRU
ELSE
SET @R = 0 -- YANLIŞ
--
RETURN @R
--
END
