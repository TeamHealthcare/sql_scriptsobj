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

-- Lab Order
-----------------------------------------------------------------------------
INSERT INTO labtechnician (LabTechnicianId, LabTechnician) VALUES (1, 'Babe Ruth');
INSERT INTO labtechnician (LabTechnicianId, LabTechnician) VALUES (2, 'Joe DiMaggio');
INSERT INTO labtechnician (LabTechnicianId, LabTechnician) VALUES (3, 'Stan Musial');
INSERT INTO labtechnician (LabTechnicianId, LabTechnician) VALUES (4, 'Pete Rose');
INSERT INTO labtechnician (LabTechnicianId, LabTechnician) VALUES (5, 'Lou Brock');

INSERT INTO physician (EmployeeId, Name, ContactNumber) VALUES (1, 'Marcus Welby', '702-494-4900');
INSERT INTO physician (EmployeeId, Name, ContactNumber) VALUES (2, 'Zachary Smith', '619-854-7332');
INSERT INTO physician (EmployeeId, Name, ContactNumber) VALUES (3, 'Leonard McCoy', '760-774-8103');
INSERT INTO physician (EmployeeId, Name, ContactNumber) VALUES (4, 'Hawkeye Pierce', '760-335-8544');
INSERT INTO physician (EmployeeId, Name, ContactNumber) VALUES (5, 'Trapper John', '935-455-8547');

INSERT INTO labtesttype (LabTestTypeId, LabTest, NormalRangeStart, NormalRangeEnd, InvalidRange) 
VALUES (1, 'Cholsterol', 140, 200, 'Anything not in that range');
INSERT INTO labtesttype (LabTestTypeId, LabTest, NormalRangeStart, NormalRangeEnd, InvalidRange) 
VALUES (2, 'High Blood Pressure', 140, 200, 'Systolic values not in that range');
INSERT INTO labtesttype (LabTestTypeId, LabTest, NormalRangeStart, NormalRangeEnd, InvalidRange) 
VALUES (3, 'HBA1C', 90, 140, 'Anything not in that range');
INSERT INTO labtesttype (LabTestTypeId, LabTest, NormalRangeStart, NormalRangeEnd, InvalidRange) 
VALUES (4, 'Hypoglycemia', 40, 70, 'Anything not in that range');
INSERT INTO labtesttype (LabTestTypeId, LabTest, NormalRangeStart, NormalRangeEnd, InvalidRange) 
VALUES (5, 'Creatinine', 0.5, 1.1, 'Anything not in that range');

-- *** NOTE ***, The second column may need to be modified to ensure KF relation is preserved to the electronicpatient table
INSERT INTO laborder (LabOrderId, PatientId, EmployeeId, LabTestTypeId, LabTestDate, LabTechnicianId, LabTestResults)
VALUES (1, 25, 1, 1, '2016-10-12', 1, '');
INSERT INTO laborder (LabOrderId, PatientId, EmployeeId, LabTestTypeId, LabTestDate, LabTechnicianId, LabTestResults)
VALUES (2, 26, 2, 2, '2016-10-13', 2, '');
INSERT INTO laborder (LabOrderId, PatientId, EmployeeId, LabTestTypeId, LabTestDate, LabTechnicianId, LabTestResults)
VALUES (3, 27, 3, 3, '2016-10-14', 3, '');
INSERT INTO laborder (LabOrderId, PatientId, EmployeeId, LabTestTypeId, LabTestDate, LabTechnicianId, LabTestResults)
VALUES (4, 29, 4, 4, '2016-10-15', 4, '');
INSERT INTO laborder (LabOrderId, PatientId, EmployeeId, LabTestTypeId, LabTestDate, LabTechnicianId, LabTestResults)
VALUES (5, 30, 5, 5, '2016-10-16', 5, '');

-- These are medicalencounter queries that may or may not be needed.
-- *** NOTE *** The last column PatientId may need to be modified to ensure FK relation is preserved to the electronicpatient table
INSERT INTO medicalencounter (MedicalEncounterId, EncounterDate, Complaint, VitalSigns, Notes, PharmacyOrder, Diagnosis, TreatmentPlan, Referral, FollowUpNotes, PatientId) 
VALUES (1, '2016-11-22', 'Foot Pain', 'Normal', 'Patient complaining of foot pain.  Looks normal', '', '', 'Ice foot', '', '', 25);
INSERT INTO medicalencounter (MedicalEncounterId, EncounterDate, Complaint, VitalSigns, Notes, PharmacyOrder, Diagnosis, TreatmentPlan, Referral, FollowUpNotes, PatientId) 
VALUES (5, '2016-10-17', 'Migraines', 'Normal', 'Patient complaining of severe headaches.  Looks normal', '', '', 'Prescribe Althoma', '', '', 26);
