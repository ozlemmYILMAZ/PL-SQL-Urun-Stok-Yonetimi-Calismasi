--Tablo OLU�TURMA--
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
    
    DBMS_OUTPUT.PUT_LINE('�r�n ba�ar�yla eklendi.');
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
        DBMS_OUTPUT.PUT_LINE('�r�n bulunamad�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Stok g�ncellendi.');
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
        DBMS_OUTPUT.PUT_LINE('�r�n bulunamad�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�r�n ba�ar�yla silindi.');
    END IF;
END;
/
--�r�n ekleme--
EXEC UrunEkle(1, 'Laptop', 'Elektronik', 50, 12000);
EXEC UrunEkle(2, 'Telefon', 'Elektronik', 100, 6000);
EXEC UrunEkle(3, 'Tablet', 'Elektronik', 80, 4000);
EXEC UrunEkle(4, 'Ak�ll� Saat', 'Elektronik', 150, 3000);
EXEC UrunEkle(5, 'Kulakl�k', 'Elektronik', 200, 500);

EXEC UrunEkle(6, 'T-Shirt', 'Giyim', 300, 100);
EXEC UrunEkle(7, 'Jeans Pantolon', 'Giyim', 150, 250);
EXEC UrunEkle(8, 'Kaban', 'Giyim', 80, 500);

EXEC UrunEkle(9, 'Koltuk Tak�m�', 'Ev E�yalar�', 20, 8000);
EXEC UrunEkle(10, 'Yatak', 'Ev E�yalar�', 30, 4000);

EXEC UrunEkle(221, 'Kedi mamas�', 'Petshop', 50, 500);
EXEC UrunEkle(458, 'Top', 'Petshop', 100, 100);
EXEC UrunEkle(69, 'K�pek Yemi', 'Petshop', 80, 500);
EXEC UrunEkle(347, 'Bal�k Yemi', 'Petshop', 150, 250);
EXEC UrunEkle(15, 'Tarak', 'Petshop', 200, 300);



SELECT * FROM Urunler;

--Kategoriye g�re arama--
SELECT * FROM Urunler
WHERE kategori = 'Elektronik';
SELECT * FROM Urunler
WHERE kategori = 'Giyim';
SELECT * FROM Urunler
WHERE kategori = 'Ev E�yalar�';
SELECT * FROM Urunler
WHERE kategori = 'Petshop';
 
--Stok G�ncelleme--
EXEC StokGuncelle(1, 45);
EXEC StokGuncelle(9, 45);

SELECT * FROM Urunler;


--Id ye g�re s�ralama--
SELECT * FROM Urunler
ORDER BY urun_id ASC;

--En y�ksek Fiyatl� �r�n� Bulma--
SELECT * FROM Urunler
ORDER BY birim_fiyati DESC
FETCH FIRST 5 ROW ONLY;

--Belirli bir kategori i�in �r�n say�s�n� bulma--
SELECT COUNT(*) FROM Urunler
WHERE kategori = 'Elektronik';









