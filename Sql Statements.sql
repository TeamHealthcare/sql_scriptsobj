INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('Aetna', '801 S. Harbor Dr.  Orem, UT 84057', 1);
INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('United Health Care', '2341 Avenida La Plaza.  Irvine, CA 92614', 1);
INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('Blue Cross', '1701 Highland Dr.  Tigard, OR  97223', 1);
INSERT INTO insurancecarrier (Carrier, Address, Active) VALUES ('Red Cross', '9711 Smithsonian Way.  Lexington, KY 40502', 1);

INSERT INTO electronicpatient (PatientName, PhoneNumber, Address, City, State, ZipCode, InsuranceCarrierId, DateOfBirth, Gender, Physician)
VALUES ('Anthony Nelson', '714-293-1990', '234 S. Marin Dr', 'Huntington Beach', 'CA', '92660', 3, '1974-05-11', 'M', 'Dr Smith');
INSERT INTO electronicpatient (PatientName, PhoneNumber, Address, City, State, ZipCode, InsuranceCarrierId, DateOfBirth, Gender, Physician)
VALUES ('Roger Healy', '305-749-1044', '914 Fetwick Dr', 'Cocoa Beach', 'FL', '33512', 4, '1970-11-15', 'M', 'Dr Huxtable');

-- For authentication add this
INSERT INTO subsystem (System) VALUES ('ElectronicPatient');
INSERT INTO subsystem (System) VALUES ('MedicalEncounter');
INSERT INTO subsystem (System) VALUES ('Dashboard');

alter table `user` modify column Password varchar(512) not null;

INSERT INTO user (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (111, 'Doctor', SHA2('Doctor', 256), 'Bob Jones', NOW());
INSERT INTO user (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (112, 'Nurse', SHA2('Nurse', 256), 'Jackie Browne', NOW());
INSERT INTO user (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (113, 'Therapist', SHA2('Therapist', 256), 'Glenda Thompson', NOW());
INSERT INTO user (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (114, 'Unassigned', SHA2('Unassigned', 256), 'Jason Rodriguez', NOW());

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

USE healthcare;

CREATE VIEW vw_userstosystems
AS
SELECT
  `u`.`UserId` AS `UserId`,
  `u`.`Username` AS `username`,
  `us`.`SubsystemId` AS `SubsystemId`,
  `s`.`System` AS `System`
FROM ((`user` `u`
  JOIN `usersubsystem` `us`
    ON ((`u`.`UserId` = `us`.`UserId`)))
  JOIN `subsystem` `s`
    ON ((`s`.`SubsystemId` = `us`.`SubsystemId`)));
	
	
-- For service endpoints, add this
CREATE TABLE service (
  ServiceId int(11) NOT NULL AUTO_INCREMENT,
  InsuranceCarrierId int(11) NOT NULL,
  Description varchar(255) NOT NULL,
  Cost decimal(19, 2) NOT NULL,
  UNIQUE INDEX ServiceId (ServiceId),
  CONSTRAINT FK_service_insurancecarrier_InsuranceCarrierId FOREIGN KEY (InsuranceCarrierId)
  REFERENCES insurancecarrier (InsuranceCarrierId) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;
	


