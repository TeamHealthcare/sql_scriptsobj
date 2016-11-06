INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('Aetna', '801 S. Harbor Dr.  Orem, UT 84057', 1);
INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('United Health Care', '2341 Avenida La Plaza.  Irvine, CA 92614', 1);
INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('Blue Cross', '1701 Highland Dr.  Tigard, OR  97223', 1);
INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('Red Cross', '9711 Smithsonian Way.  Lexington, KY 40502', 1);

INSERT INTO electronicpatient (PatientName, PhoneNumber, Address, City, State, ZipCode, InsuranceCarrierId, DateOfBirth, Gender, Physician)
VALUES ('Anthony Nelson', '714-293-1990', '234 S. Marin Dr', 'Huntington Beach', 'CA', '92660', 3, '1974-05-11', 'M', 'Dr Smith');
INSERT INTO electronicpatient (PatientName, PhoneNumber, Address, City, State, ZipCode, InsuranceCarrierId, DateOfBirth, Gender, Physician)
VALUES ('Roger Healy', '305-749-1044', '914 Fetwick Dr', 'Cocoa Beach', 'FL', '33512', 4, '1970-11-15', 'M', 'Dr Huxtable');

