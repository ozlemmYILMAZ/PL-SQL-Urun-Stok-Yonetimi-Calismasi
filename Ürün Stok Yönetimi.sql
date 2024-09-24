--Tablo OLUÞTURMA--
CREATE TABLE Urunler (
    urun_id NUMBER PRIMARY KEY,
    urun_adi VARCHAR2(100),
    kategori VARCHAR2(50),
    stok_miktari NUMBER,
    birim_fiyati NUMBER
);

CREATE OR REPLACE PROCEDURE UrunEkle(
    p_urun_id IN NUMBER,
    p_urun_adi IN VARCHAR2,
    p_kategori IN VARCHAR2,
    p_stok_miktari IN NUMBER,
    p_birim_fiyati IN NUMBER
) IS
BEGIN
    INSERT INTO Urunler (urun_id, urun_adi, kategori, stok_miktari, birim_fiyati)
    VALUES (p_urun_id, p_urun_adi, p_kategori, p_stok_miktari, p_birim_fiyati);
    
    DBMS_OUTPUT.PUT_LINE('Ürün baþarýyla eklendi.');
END;
/

CREATE OR REPLACE PROCEDURE StokGuncelle(
    p_urun_id IN NUMBER,
    p_yeni_stok IN NUMBER
) IS
BEGIN
    UPDATE Urunler
    SET stok_miktari = p_yeni_stok
    WHERE urun_id = p_urun_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Ürün bulunamadý.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Stok güncellendi.');
    END IF;
END;
/
CREATE OR REPLACE PROCEDURE UrunSil(
    p_urun_id IN NUMBER
) IS
BEGIN
    DELETE FROM Urunler
    WHERE urun_id = p_urun_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Ürün bulunamadý.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ürün baþarýyla silindi.');
    END IF;
END;
/
--Ürün ekleme--
EXEC UrunEkle(1, 'Laptop', 'Elektronik', 50, 12000);
EXEC UrunEkle(2, 'Telefon', 'Elektronik', 100, 6000);
EXEC UrunEkle(3, 'Tablet', 'Elektronik', 80, 4000);
EXEC UrunEkle(4, 'Akýllý Saat', 'Elektronik', 150, 3000);
EXEC UrunEkle(5, 'Kulaklýk', 'Elektronik', 200, 500);

EXEC UrunEkle(6, 'T-Shirt', 'Giyim', 300, 100);
EXEC UrunEkle(7, 'Jeans Pantolon', 'Giyim', 150, 250);
EXEC UrunEkle(8, 'Kaban', 'Giyim', 80, 500);

EXEC UrunEkle(9, 'Koltuk Takýmý', 'Ev Eþyalarý', 20, 8000);
EXEC UrunEkle(10, 'Yatak', 'Ev Eþyalarý', 30, 4000);

EXEC UrunEkle(221, 'Kedi mamasý', 'Petshop', 50, 500);
EXEC UrunEkle(458, 'Top', 'Petshop', 100, 100);
EXEC UrunEkle(69, 'Köpek Yemi', 'Petshop', 80, 500);
EXEC UrunEkle(347, 'Balýk Yemi', 'Petshop', 150, 250);
EXEC UrunEkle(15, 'Tarak', 'Petshop', 200, 300);



SELECT * FROM Urunler;

--Kategoriye göre arama--
SELECT * FROM Urunler
WHERE kategori = 'Elektronik';
SELECT * FROM Urunler
WHERE kategori = 'Giyim';
SELECT * FROM Urunler
WHERE kategori = 'Ev Eþyalarý';
SELECT * FROM Urunler
WHERE kategori = 'Petshop';
 
--Stok Güncelleme--
EXEC StokGuncelle(1, 45);
EXEC StokGuncelle(9, 45);

SELECT * FROM Urunler;


--Id ye göre sýralama--
SELECT * FROM Urunler
ORDER BY urun_id ASC;

--En yüksek Fiyatlý Ürünü Bulma--
SELECT * FROM Urunler
ORDER BY birim_fiyati DESC
FETCH FIRST 5 ROW ONLY;

--Belirli bir kategori için ürün sayýsýný bulma--
SELECT COUNT(*) FROM Urunler
WHERE kategori = 'Elektronik';









