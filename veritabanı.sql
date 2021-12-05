--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 11.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: musteri_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.musteri_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
NEW.adi = LTRIM(NEW.adi);
NEW.soyadi = UPPER(NEW.soyadi);
RETURN NEW;
END;

$$;


ALTER FUNCTION public.musteri_insert() OWNER TO postgres;

--
-- Name: tedarik_eski(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tedarik_eski() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO "EskiTedarikci" Values (old.kisiid, old.adi, old.soyadi,
					old.kisituru, old.iletisimid);
					
					RETURN NULL;
					END;$$;


ALTER FUNCTION public.tedarik_eski() OWNER TO postgres;

--
-- Name: tedarikci_ekle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tedarikci_ekle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
NEW.adi = LTRIM(NEW.adi);
NEW.soyadi = UPPER(NEW.soyadi);
RETURN NEW;
END;
$$;


ALTER FUNCTION public.tedarikci_ekle() OWNER TO postgres;

--
-- Name: tedarikci_silmeden(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tedarikci_silmeden() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO "EskiTedarikci" Values (old.kisiid, old.adi, old.soyadi,
					old.kisituru, old.iletisimid);
					
					RETURN NULL;
					END;$$;


ALTER FUNCTION public.tedarikci_silmeden() OWNER TO postgres;

--
-- Name: urun_silmeden1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.urun_silmeden1() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO yeniurun Values (old.urunid, old.firmaid, old.urunadi,
					old.barkodno, old.tedarikid, old.sonkullanmatarihi,
					old.tedariktarihi, old.rafid, old.fiyatid,
					old.stok);
					
					RETURN NULL;
					END;$$;


ALTER FUNCTION public.urun_silmeden1() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Adres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Adres" (
    adresid integer NOT NULL,
    sehirid integer,
    firmaid integer
);


ALTER TABLE public."Adres" OWNER TO postgres;

--
-- Name: EskiTedarikci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EskiTedarikci" (
    kisiid integer NOT NULL,
    adi character varying(2044) NOT NULL,
    soyadi character varying(2044) NOT NULL,
    kisituru character varying(2044) NOT NULL,
    iletisimid integer NOT NULL
);


ALTER TABLE public."EskiTedarikci" OWNER TO postgres;

--
-- Name: Firma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Firma" (
    firmaid integer NOT NULL,
    firmaadi character varying(50)
);


ALTER TABLE public."Firma" OWNER TO postgres;

--
-- Name: Fiyat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fiyat" (
    fiyatid integer NOT NULL,
    alisfiyati integer,
    satisfiyati integer,
    urunadi character varying(50)
);


ALTER TABLE public."Fiyat" OWNER TO postgres;

--
-- Name: IletisimBilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IletisimBilgileri" (
    iletisimid integer NOT NULL,
    telefon bigint,
    faks character varying(50),
    mail character varying(50),
    tedarikid integer,
    adresid integer
);


ALTER TABLE public."IletisimBilgileri" OWNER TO postgres;

--
-- Name: Kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kategori" (
    kategoriid integer NOT NULL,
    kategoriadi character varying(20)
);


ALTER TABLE public."Kategori" OWNER TO postgres;

--
-- Name: Kisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kisi" (
    kisiid integer NOT NULL,
    adi character varying(20),
    soyadi character varying(20),
    kisituru character varying(20)
);


ALTER TABLE public."Kisi" OWNER TO postgres;

--
-- Name: Musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Musteri" (
)
INHERITS (public."Kisi");


ALTER TABLE public."Musteri" OWNER TO postgres;

--
-- Name: Raf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Raf" (
    rafid integer NOT NULL,
    urunadi character varying(50)
);


ALTER TABLE public."Raf" OWNER TO postgres;

--
-- Name: Sehir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sehir" (
    sehirid integer NOT NULL,
    sehir character varying(50),
    ulkeid integer
);


ALTER TABLE public."Sehir" OWNER TO postgres;

--
-- Name: Tedarik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tedarik" (
    tedarikid integer NOT NULL,
    tedarikyeri character varying(70)
);


ALTER TABLE public."Tedarik" OWNER TO postgres;

--
-- Name: Tedarikci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tedarikci" (
    iletisimid integer
)
INHERITS (public."Kisi");


ALTER TABLE public."Tedarikci" OWNER TO postgres;

--
-- Name: Ulke; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ulke" (
    ulkeid integer NOT NULL,
    ulke character varying(50)
);


ALTER TABLE public."Ulke" OWNER TO postgres;

--
-- Name: Urun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Urun" (
    urunid integer NOT NULL,
    firmaid integer,
    urunadi character varying(50),
    barkodno integer,
    tedarikid integer,
    sonkullanmatarihi date,
    tedariktarihi date,
    rafid integer,
    fiyatid integer,
    stok integer
);


ALTER TABLE public."Urun" OWNER TO postgres;

--
-- Name: yeniurun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yeniurun (
    urunid integer NOT NULL,
    firmaid integer NOT NULL,
    urunadi character varying(2044) NOT NULL,
    barkodno integer NOT NULL,
    tedarikid integer NOT NULL,
    sonkullanmatarihi date NOT NULL,
    tedariktarihi date NOT NULL,
    rafid integer NOT NULL,
    fiyatid integer NOT NULL,
    stok integer NOT NULL
);


ALTER TABLE public.yeniurun OWNER TO postgres;

--
-- Data for Name: Adres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Adres" VALUES (1, 1, 1);
INSERT INTO public."Adres" VALUES (2, 2, 10);
INSERT INTO public."Adres" VALUES (3, 5, 7);
INSERT INTO public."Adres" VALUES (4, 2, 5);


--
-- Data for Name: EskiTedarikci; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Firma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Firma" VALUES (1, 'Senpilic');
INSERT INTO public."Firma" VALUES (2, 'Torku');
INSERT INTO public."Firma" VALUES (3, 'Ruffles');
INSERT INTO public."Firma" VALUES (4, 'Doritos');
INSERT INTO public."Firma" VALUES (5, 'Eti');
INSERT INTO public."Firma" VALUES (6, 'Sutas');
INSERT INTO public."Firma" VALUES (7, 'Pinar');
INSERT INTO public."Firma" VALUES (8, 'Milka');
INSERT INTO public."Firma" VALUES (9, 'Kayseri');
INSERT INTO public."Firma" VALUES (10, 'Yasin');


--
-- Data for Name: Fiyat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Fiyat" VALUES (1, 2, 3, 'Doritos');
INSERT INTO public."Fiyat" VALUES (2, 1, 3, 'Sut');
INSERT INTO public."Fiyat" VALUES (3, 5, 8, 'Cikolata');
INSERT INTO public."Fiyat" VALUES (4, 1, 3, 'Biskuvit');
INSERT INTO public."Fiyat" VALUES (5, 2, 4, 'Milka');
INSERT INTO public."Fiyat" VALUES (6, 3, 5, 'Ruffles');


--
-- Data for Name: IletisimBilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."IletisimBilgileri" VALUES (1, 5768346521, '1-212-9876543', 'a@gmail.com', 1, 1);
INSERT INTO public."IletisimBilgileri" VALUES (2, 5987653412, '1-212-9876543', 'aaa@gmail.com', 2, 2);
INSERT INTO public."IletisimBilgileri" VALUES (3, 5678742876, '1-212-9876543', 'aasda@gmail.com', 3, 3);
INSERT INTO public."IletisimBilgileri" VALUES (4, 5634682876, '1-212-9876543', 'adfs@gmail.com', 6, 1);


--
-- Data for Name: Kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Kategori" VALUES (1, 'Biskuvit');
INSERT INTO public."Kategori" VALUES (2, 'Cikolata');
INSERT INTO public."Kategori" VALUES (3, 'Cips');
INSERT INTO public."Kategori" VALUES (4, 'Sut Urunleri');
INSERT INTO public."Kategori" VALUES (5, 'Et Urunleri');


--
-- Data for Name: Kisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Kisi" VALUES (2, 'Ayse', 'Gul', 'Musteri');
INSERT INTO public."Kisi" VALUES (3, 'Sercan', 'Ay', 'Musteri');
INSERT INTO public."Kisi" VALUES (4, 'Tugce', 'Er', 'Musteri');
INSERT INTO public."Kisi" VALUES (5, 'Cagla', 'Oksuz', 'Tedarikci');
INSERT INTO public."Kisi" VALUES (11, 'Sule', 'Yilmaz', 'Tedarikci');
INSERT INTO public."Kisi" VALUES (1, 'Okan', 'TOLGAY', 'Musteri');
INSERT INTO public."Kisi" VALUES (12, 'Rahmes', 'FIS', 'Musteri');
INSERT INTO public."Kisi" VALUES (15, 'samet', 'SARNAK', 'Tedarikci');


--
-- Data for Name: Musteri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Musteri" VALUES (4, 'Tugce', 'ER', 'Musteri');
INSERT INTO public."Musteri" VALUES (3, 'Sercan', 'AY', 'Musteri');
INSERT INTO public."Musteri" VALUES (1, 'Okan', 'TOLGAY', 'Musteri');
INSERT INTO public."Musteri" VALUES (11, 'name', 'SURNAME', 'Musteri');


--
-- Data for Name: Raf; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Raf" VALUES (1, 'Torku - cikolata');
INSERT INTO public."Raf" VALUES (3, 'Doritos ');
INSERT INTO public."Raf" VALUES (4, 'Ruffles');
INSERT INTO public."Raf" VALUES (5, 'Sutas -Sut urunleri');
INSERT INTO public."Raf" VALUES (6, 'Milka - Cikolata');
INSERT INTO public."Raf" VALUES (2, 'Eti - biskuvit');
INSERT INTO public."Raf" VALUES (7, 'Pinar - Yogurt');


--
-- Data for Name: Sehir; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Sehir" VALUES (1, 'Istanbul', 1);
INSERT INTO public."Sehir" VALUES (2, 'Eskisehir', 1);
INSERT INTO public."Sehir" VALUES (3, 'Kayser', 1);
INSERT INTO public."Sehir" VALUES (4, 'Izmit', 1);
INSERT INTO public."Sehir" VALUES (5, 'Berlin', 5);
INSERT INTO public."Sehir" VALUES (6, 'Naples', 4);


--
-- Data for Name: Tedarik; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tedarik" VALUES (2, 'Eti - Eskisehir');
INSERT INTO public."Tedarik" VALUES (5, 'Doritos - Izmit');
INSERT INTO public."Tedarik" VALUES (6, 'Sutas - Istanbul');
INSERT INTO public."Tedarik" VALUES (1, 'Senpilic - Istanbul ');
INSERT INTO public."Tedarik" VALUES (3, 'Torku - Izmit');
INSERT INTO public."Tedarik" VALUES (9, 'Kayseri - Kayseri');
INSERT INTO public."Tedarik" VALUES (10, 'Yasin - Eskisehir');
INSERT INTO public."Tedarik" VALUES (7, 'Pinar - Almanya');
INSERT INTO public."Tedarik" VALUES (4, 'Ruffles - Naples');
INSERT INTO public."Tedarik" VALUES (8, 'Milka - Lyon');


--
-- Data for Name: Tedarikci; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tedarikci" VALUES (5, 'Cagla', 'OKSUZ', 'Tedarikci', 1);
INSERT INTO public."Tedarikci" VALUES (11, 'Sule', 'YILMAZ', 'Tedarikci', 2);
INSERT INTO public."Tedarikci" VALUES (15, 'samet', 'SARNAK', 'Tedarikci', 1);
INSERT INTO public."Tedarikci" VALUES (11, 'deneme', 'DENEME', 'Tedarikci', 4);


--
-- Data for Name: Ulke; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ulke" VALUES (1, 'Turkiye');
INSERT INTO public."Ulke" VALUES (2, 'Amerika');
INSERT INTO public."Ulke" VALUES (3, 'Fransa');
INSERT INTO public."Ulke" VALUES (4, 'Italya');
INSERT INTO public."Ulke" VALUES (5, 'Almanya');
INSERT INTO public."Ulke" VALUES (6, 'Kanada');


--
-- Data for Name: Urun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Urun" VALUES (1, 4, 'Doritos ', 987654321, 5, '2019-11-21', '2017-01-12', 3, 1, 1);
INSERT INTO public."Urun" VALUES (2, 6, 'Sut', 765456457, 6, '2018-10-05', '2018-10-15', 5, 2, 2);
INSERT INTO public."Urun" VALUES (3, 8, 'Cikolata', 234565445, 8, '2020-07-13', '2017-05-17', 6, 3, 3);
INSERT INTO public."Urun" VALUES (4, 5, 'Biskuvi', 654536734, 2, '2020-07-12', '2017-12-12', 2, 4, 4);


--
-- Data for Name: yeniurun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yeniurun VALUES (3, 8, 'Cikolata', 765456765, 8, '2020-07-12', '2017-05-17', 6, 3, 3);
INSERT INTO public.yeniurun VALUES (5, 3, 'Norway', 54345345, 3, '2020-10-03', '2018-08-07', 2, 3, 5);


--
-- Name: Adres adresId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Adres"
    ADD CONSTRAINT "adresId" PRIMARY KEY (adresid);


--
-- Name: Firma firmaId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Firma"
    ADD CONSTRAINT "firmaId" PRIMARY KEY (firmaid);


--
-- Name: Fiyat fiyatId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fiyat"
    ADD CONSTRAINT "fiyatId" PRIMARY KEY (fiyatid);


--
-- Name: IletisimBilgileri iletisimId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IletisimBilgileri"
    ADD CONSTRAINT "iletisimId" PRIMARY KEY (iletisimid);


--
-- Name: Kategori kategoriId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kategori"
    ADD CONSTRAINT "kategoriId" PRIMARY KEY (kategoriid);


--
-- Name: Kisi kisiId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kisi"
    ADD CONSTRAINT "kisiId" PRIMARY KEY (kisiid);


--
-- Name: Raf rafId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Raf"
    ADD CONSTRAINT "rafId" PRIMARY KEY (rafid);


--
-- Name: Sehir sehirId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sehir"
    ADD CONSTRAINT "sehirId" PRIMARY KEY (sehirid);


--
-- Name: Tedarik tedarikId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tedarik"
    ADD CONSTRAINT "tedarikId" PRIMARY KEY (tedarikid);


--
-- Name: Ulke ulkeId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ulke"
    ADD CONSTRAINT "ulkeId" PRIMARY KEY (ulkeid);


--
-- Name: Urun urunId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "urunId" PRIMARY KEY (urunid);


--
-- Name: fki_kisiId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_kisiId" ON public."Musteri" USING btree (kisiid);


--
-- Name: Musteri musteri_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER musteri_insert BEFORE INSERT ON public."Musteri" FOR EACH ROW EXECUTE PROCEDURE public.musteri_insert();


--
-- Name: Tedarikci musteri_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER musteri_insert BEFORE INSERT ON public."Tedarikci" FOR EACH ROW EXECUTE PROCEDURE public.musteri_insert();


--
-- Name: Tedarikci tedarik_eski; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tedarik_eski AFTER DELETE ON public."Tedarikci" FOR EACH ROW EXECUTE PROCEDURE public.tedarik_eski();


--
-- Name: Tedarikci tedarikci_silmeden; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tedarikci_silmeden AFTER DELETE ON public."Tedarikci" FOR EACH ROW EXECUTE PROCEDURE public.tedarikci_silmeden();


--
-- Name: Urun urun_silmeden; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER urun_silmeden AFTER DELETE ON public."Urun" FOR EACH ROW EXECUTE PROCEDURE public.urun_silmeden1();


--
-- Name: IletisimBilgileri adresId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IletisimBilgileri"
    ADD CONSTRAINT "adresId" FOREIGN KEY (iletisimid) REFERENCES public."Adres"(adresid);


--
-- Name: Adres firmaId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Adres"
    ADD CONSTRAINT "firmaId" FOREIGN KEY (adresid) REFERENCES public."Firma"(firmaid);


--
-- Name: Urun firmaId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "firmaId" FOREIGN KEY (urunid) REFERENCES public."Firma"(firmaid);


--
-- Name: Urun fiyatId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "fiyatId" FOREIGN KEY (urunid) REFERENCES public."Fiyat"(fiyatid);


--
-- Name: Tedarikci iletisimId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tedarikci"
    ADD CONSTRAINT "iletisimId" FOREIGN KEY (iletisimid) REFERENCES public."IletisimBilgileri"(iletisimid);


--
-- Name: Musteri kisiId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Musteri"
    ADD CONSTRAINT "kisiId" FOREIGN KEY (kisiid) REFERENCES public."Kisi"(kisiid);


--
-- Name: Tedarikci kisiId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tedarikci"
    ADD CONSTRAINT "kisiId" FOREIGN KEY (kisiid) REFERENCES public."Kisi"(kisiid);


--
-- Name: Urun rafId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "rafId" FOREIGN KEY (urunid) REFERENCES public."Raf"(rafid);


--
-- Name: Adres sehirId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Adres"
    ADD CONSTRAINT "sehirId" FOREIGN KEY (adresid) REFERENCES public."Sehir"(sehirid);


--
-- Name: Urun tedarik; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT tedarik FOREIGN KEY (urunid) REFERENCES public."Tedarik"(tedarikid);


--
-- Name: IletisimBilgileri tedarikId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IletisimBilgileri"
    ADD CONSTRAINT "tedarikId" FOREIGN KEY (iletisimid) REFERENCES public."Tedarik"(tedarikid);


--
-- Name: Sehir ulkeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sehir"
    ADD CONSTRAINT "ulkeId" FOREIGN KEY (sehirid) REFERENCES public."Ulke"(ulkeid);


--
-- PostgreSQL database dump complete
--

