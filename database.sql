-- Kategorie produktów
CREATE TABLE Kategorie (
    id_kategorii INT PRIMARY KEY IDENTITY(1,1),
    nazwa VARCHAR(50) NOT NULL
);

-- U¿ytkownicy
CREATE TABLE Uzytkownicy (
    id_uzytkownika INT PRIMARY KEY IDENTITY(1,1),
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    login VARCHAR(50) UNIQUE,
    mail VARCHAR(100) UNIQUE,
    haslo VARCHAR(255),
    data_rejestracji DATE,
    zdjecie_profilowe TEXT
);

-- Produkty
CREATE TABLE Produkty (
    id_produktu INT PRIMARY KEY IDENTITY(1,1),
    nazwa VARCHAR(100),
    id_sprzedajacego INT,
    opis TEXT,
    id_kategorii INT,
    cena DECIMAL(10,2),
    data_dodania DATE,
    link_do_pobrania TEXT,
    zdjecia TEXT,
    FOREIGN KEY (id_sprzedajacego) REFERENCES Uzytkownicy(id_uzytkownika),
    FOREIGN KEY (id_kategorii) REFERENCES Kategorie(id_kategorii)
);

-- Zamówienia
CREATE TABLE Zamowienia (
    id_zamowienia INT PRIMARY KEY IDENTITY(1,1),
    id_klienta INT,
    id_sprzedajacego INT,
    id_produktu INT,
    cena_koszyka DECIMAL(10,2),
    status_platnosci VARCHAR(50),
    data_zamowienia DATE,
    FOREIGN KEY (id_klienta) REFERENCES Uzytkownicy(id_uzytkownika),
    FOREIGN KEY (id_sprzedajacego) REFERENCES Uzytkownicy(id_uzytkownika),
    FOREIGN KEY (id_produktu) REFERENCES Produkty(id_produktu)
);

-- Promocje
CREATE TABLE Promocje (
    kod_rabatowy VARCHAR(50) PRIMARY KEY,
    zasady_promocji TEXT,
    znizka DECIMAL(5,2),
    data_waznosci DATE
);
