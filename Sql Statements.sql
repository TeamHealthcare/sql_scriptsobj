INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('Aetna', '801 S. Harbor Dr.  Orem, UT 84057', 1);
INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('United Health Care', '2341 Avenida La Plaza.  Irvine, CA 92614', 1);
INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('Blue Cross', '1701 Highland Dr.  Tigard, OR  97223', 1);
INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('Red Cross', '9711 Smithsonian Way.  Lexington, KY 40502', 1);

INSERT INTO electronicpatient (PatientName, PhoneNumber, Address, City, State, ZipCode, InsuranceCarrierId, DateOfBirth, Gender, Physician)
VALUES ('Anthony Nelson', '714-293-1990', '234 S. Marin Dr', 'Huntington Beach', 'CA', '92660', 3, '1974-05-11', 'M', 'Dr Smith');
INSERT INTO electronicpatient (PatientName, PhoneNumber, Address, City, State, ZipCode, InsuranceCarrierId, DateOfBirth, Gender, Physician)
VALUES ('Roger Healy', '305-749-1044', '914 Fetwick Dr', 'Cocoa Beach', 'FL', '33512', 4, '1970-11-15', 'M', 'Dr Huxtable');

INSERT INTO subsystem (System) VALUES ('ElectronicPatient');
INSERT INTO subsystem (System) VALUES ('MedicalEncounter');
INSERT INTO subsystem (System) VALUES ('Dashboard');

INSERT INTO user (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (111, 'Doctor', SHA1('Doctor'), 'Bob Jones', NOW());
INSERT INTO user (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (112, 'Nurse', SHA1('Nurse'), 'Jackie Browne', NOW());
INSERT INTO user (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (113, 'Therapist', SHA1('Therapist'), 'Glenda Thompson', NOW());
INSERT INTO user (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (114, 'Unassigned', SHA1('Unassigned'), 'Jason Rodriguez', NOW());

INSERT INTO usersubsystem (UserId, SubSystemId) VALUES (17, 7);
INSERT INTO usersubsystem (UserId, SubSystemId) VALUES (17, 8);
INSERT INTO usersubsystem (UserId, SubSystemId) VALUES (17, 9);
INSERT INTO usersubsystem (UserId, SubSystemId) VALUES (18, 7);
INSERT INTO usersubsystem (UserId, SubSystemId) VALUES (18, 8);
INSERT INTO usersubsystem (UserId, SubSystemId) VALUES (18, 9);
INSERT INTO usersubsystem (UserId, SubSystemId) VALUES (19, 7);
INSERT INTO usersubsystem (UserId, SubSystemId) VALUES (19, 9);
INSERT INTO usersubsystem (UserId, SubSystemId) VALUES (20, 9);

ALTER TABLE user
ADD COLUMN `Username` VARCHAR(32) NOT NULL AFTER `JobTitle`;

UPDATE user SET Username = 'bjones' WHERE EmployeeNumber = 111;
UPDATE user SET Username = 'jbrowne' WHERE EmployeeNumber = 112;
UPDATE user SET Username = 'gthompson' WHERE EmployeeNumber = 113;
UPDATE user SET Username = 'jrodriguez' WHERE EmployeeNumber = 114;

