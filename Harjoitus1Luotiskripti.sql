
CREATE SEQUENCE public.postin_tyyppi_tyyppikoodi_seq;

CREATE TABLE public.postin_tyyppi (
                tyyppikoodi INTEGER NOT NULL DEFAULT nextval('public.postin_tyyppi_tyyppikoodi_seq'),
                tyyppinimitys VARCHAR(30) NOT NULL,
                CONSTRAINT psotin_tyyppi_pk PRIMARY KEY (tyyppikoodi)
);


ALTER SEQUENCE public.postin_tyyppi_tyyppikoodi_seq OWNED BY public.postin_tyyppi.tyyppikoodi;

CREATE TABLE public.henkilo (
                opiskelijanumero VARCHAR(8) NOT NULL,
                etunimi VARCHAR(20) NOT NULL,
                sukunimi VARCHAR(30) NOT NULL,
                tutkinto VARCHAR(100) DEFAULT Tieto- ja viestintätekniikan perustutkinto NOT NULL,
                CONSTRAINT henkilo_pk PRIMARY KEY (opiskelijanumero)
);


CREATE TABLE public.sahkoposti (
                osoite VARCHAR(80) NOT NULL,
                opiskelijanumero VARCHAR(8) NOT NULL,
                tyyppikoodi INTEGER NOT NULL,
                CONSTRAINT sahkoposti_pk PRIMARY KEY (osoite)
);


ALTER TABLE public.sahkoposti ADD CONSTRAINT postin_tyyppi_sahkoposti_fk
FOREIGN KEY (tyyppikoodi)
REFERENCES public.postin_tyyppi (tyyppikoodi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sahkoposti ADD CONSTRAINT henkilo_sahkoposti_fk
FOREIGN KEY (opiskelijanumero)
REFERENCES public.henkilo (opiskelijanumero)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;
