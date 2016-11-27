CREATE TABLE electronicpatient (
  PatientId int(11) NOT NULL AUTO_INCREMENT,
  PatientName varchar(128) NOT NULL,
  PhoneNumber varchar(16) NOT NULL,
  Address varchar(128) NOT NULL,
  InsuranceCarrierId int(11) NOT NULL,
  DateOfBirth datetime NOT NULL,
  Gender char(1) NOT NULL,
  EmployeeNumber int NOT NULL,
  DateEntered datetime NOT NULL,
  PRIMARY KEY (PatientId),
  CONSTRAINT FK_ElectronicPatient_InsuranceCarrier FOREIGN KEY (InsuranceCarrierId)
  REFERENCES insurancecarrier (InsuranceCarrierId) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

INSERT INTO electronicpatient (PatientName, PhoneNumber, Address, InsuranceCarrierId, DateOfBirth, Gender, EmployeeNumber, DateEntered) 
VALUES ('Jeff Spicoli', '8584921049', '2049 5th Ave San Diego CA 92103', 225, '1979-05-20', 'M', 1111, NOW());
INSERT INTO electronicpatient (PatientName, PhoneNumber, Address, InsuranceCarrierId, DateOfBirth, Gender, EmployeeNumber, DateEntered) 
VALUES ('Teresa Sampson', '7029031199', '1467 Feldspar Ave San Diego CA 92109', 225, '1969-11-04', 'F', 1111, NOW());
