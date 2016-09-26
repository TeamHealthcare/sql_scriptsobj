CREATE TABLE InsuranceCarrier
(
    InsuranceCarrierId      int        NOT NULL  auto_increment  primary key,
    Carrier                 varchar(255)    NOT NULL,
    Address                 varchar(255)    NOT NULL,
    Active          bit         NOT NULL
);

ALTER TABLE InsuranceCarrier AUTO_INCREMENT = 225;

INSERT INTO InsuranceCarrier (Carrier, Address, Active) VALUES ('Cigna', '2405 N. Highland Dr., Irvine, CA 92604', 1);
INSERT INTO InsuranceCarrier (Carrier, Address, Active) VALUES ('Aetna', '701 Orem Pl, Salt Lake City, UT 83020', 1);