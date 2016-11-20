-- MySQL Workbench Forward Engineering = 11-20-2016

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema healthcare
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema healthcare
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `healthcare` DEFAULT CHARACTER SET utf8 ;
USE `healthcare` ;

-- -----------------------------------------------------
-- Table `healthcare`.`appointmenttype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`appointmenttype` (
  `AppointmentTypeId` INT(11) NOT NULL AUTO_INCREMENT,
  `AppointmentType` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`AppointmentTypeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`appointment` (
  `AppointmentId` INT(11) NOT NULL AUTO_INCREMENT,
  `Appointment` VARCHAR(255) NOT NULL,
  `AppointmentTypeId` INT(11) NOT NULL,
  `AppointmentDate` DATE NOT NULL,
  `StartTime` INT(11) NOT NULL,
  `EndTime` INT(11) NOT NULL,
  `DateEntered` DATETIME NOT NULL,
  PRIMARY KEY (`AppointmentId`),
  INDEX `FK_AppointmentType_Appointment` (`AppointmentTypeId` ASC),
  CONSTRAINT `FK_AppointmentType_Appointment`
    FOREIGN KEY (`AppointmentTypeId`)
    REFERENCES `healthcare`.`appointmenttype` (`AppointmentTypeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`insurancecarrier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`insurancecarrier` (
  `InsuranceCarrierId` INT(11) NOT NULL AUTO_INCREMENT,
  `Carrier` VARCHAR(255) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Active` INT(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`InsuranceCarrierId`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`electronicpatient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`electronicpatient` (
  `PatientId` INT(11) NOT NULL AUTO_INCREMENT,
  `PatientName` VARCHAR(128) NOT NULL,
  `PhoneNumber` VARCHAR(16) NOT NULL,
  `Address` VARCHAR(128) NOT NULL,
  `City` VARCHAR(64) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `ZipCode` VARCHAR(30) NOT NULL,
  `InsuranceCarrierId` INT(11) NOT NULL,
  `DateOfBirth` DATETIME NOT NULL,
  `Gender` CHAR(1) NOT NULL,
  `Physician` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`PatientId`),
  INDEX `FK_ElectronicPatient_InsuranceCarrier` (`InsuranceCarrierId` ASC),
  CONSTRAINT `FK_ElectronicPatient_InsuranceCarrier`
    FOREIGN KEY (`InsuranceCarrierId`)
    REFERENCES `healthcare`.`insurancecarrier` (`InsuranceCarrierId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`equipmentinventorymaintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`equipmentinventorymaintenance` (
  `EquipmentId` INT(11) NOT NULL AUTO_INCREMENT,
  `EquipmentType` VARCHAR(255) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Department` VARCHAR(128) NULL DEFAULT NULL,
  `Owned` BIT(1) NOT NULL DEFAULT b'0',
  `OwnedDetails` VARCHAR(255) NULL DEFAULT NULL,
  `Leased` BIT(1) NOT NULL DEFAULT b'0',
  `LeasedDetails` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`EquipmentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`equipmenthistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`equipmenthistory` (
  `EquipmentHistoryId` INT(11) NOT NULL AUTO_INCREMENT,
  `EquipmentId` INT(11) NOT NULL,
  `ProblemType` VARCHAR(255) NOT NULL,
  `ProblemDescription` VARCHAR(255) NOT NULL,
  `CurrentStatus` VARCHAR(255) NOT NULL,
  `Resolution` VARCHAR(255) NOT NULL,
  UNIQUE INDEX `EquipmentHistoryId` (`EquipmentHistoryId` ASC),
  INDEX `FK_EH_EIM` (`EquipmentId` ASC),
  CONSTRAINT `FK_EH_EIM`
    FOREIGN KEY (`EquipmentId`)
    REFERENCES `healthcare`.`equipmentinventorymaintenance` (`EquipmentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`labtechnician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`labtechnician` (
  `LabTechnicianId` INT(11) NOT NULL AUTO_INCREMENT,
  `LabTechnician` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`LabTechnicianId`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`labtesttype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`labtesttype` (
  `LabTestTypeId` INT(11) NOT NULL AUTO_INCREMENT,
  `LabTest` VARCHAR(255) NOT NULL,
  `NormalRangeStart` DECIMAL(7,3) NOT NULL,
  `NormalRangeEnd` DECIMAL(7,3) NOT NULL,
  `InvalidRange` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`LabTestTypeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`physician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`physician` (
  `EmployeeId` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`EmployeeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`laborder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`laborder` (
  `LabOrderId` INT(11) NOT NULL AUTO_INCREMENT,
  `PatientId` INT(11) NOT NULL,
  `EmployeeId` INT(11) NOT NULL,
  `LabTestTypeId` INT(11) NOT NULL,
  `LabTestDate` DATETIME NOT NULL,
  `LabTechnicianId` INT(11) NOT NULL,
  `LabTestResults` TEXT NOT NULL,
  PRIMARY KEY (`LabOrderId`),
  INDEX `FK_LabOrder_ElectronicPatient` (`PatientId` ASC),
  INDEX `FK_LabOrder_Physician` (`EmployeeId` ASC),
  INDEX `FK_LabOrder_LabTestType` (`LabTestTypeId` ASC),
  INDEX `FK_LabOrder_LabTechnician` (`LabTechnicianId` ASC),
  CONSTRAINT `FK_LabOrder_ElectronicPatient`
    FOREIGN KEY (`PatientId`)
    REFERENCES `healthcare`.`electronicpatient` (`PatientId`),
  CONSTRAINT `FK_LabOrder_LabTechnician`
    FOREIGN KEY (`LabTechnicianId`)
    REFERENCES `healthcare`.`labtechnician` (`LabTechnicianId`),
  CONSTRAINT `FK_LabOrder_LabTestType`
    FOREIGN KEY (`LabTestTypeId`)
    REFERENCES `healthcare`.`labtesttype` (`LabTestTypeId`),
  CONSTRAINT `FK_LabOrder_Physician`
    FOREIGN KEY (`EmployeeId`)
    REFERENCES `healthcare`.`physician` (`EmployeeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`medicalencounter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`medicalencounter` (
  `EncounterDate` DATETIME NOT NULL,
  `Practitioner` INT(11) NOT NULL,
  `Complaint` TEXT NOT NULL,
  `VitalSigns` TEXT NOT NULL,
  `Notes` TEXT NOT NULL,
  `LabOrderId` INT(11) NOT NULL,
  `PharmacyOrder` TEXT NOT NULL,
  `Diagnosis` TEXT NOT NULL,
  `TreatmentPlan` TEXT NOT NULL,
  `Referral` TEXT NOT NULL,
  `FollowUpNotes` TEXT NOT NULL,
  `PatientId` INT(11) NOT NULL,
  INDEX `FK_medicalencounter_laborder_LabOrderId` (`LabOrderId` ASC),
  INDEX `FK_medicalencounter_electronicpatient_PatientId` (`PatientId` ASC),
  CONSTRAINT `FK_medicalencounter_electronicpatient_PatientId`
    FOREIGN KEY (`PatientId`)
    REFERENCES `healthcare`.`electronicpatient` (`PatientId`),
  CONSTRAINT `FK_medicalencounter_laborder_LabOrderId`
    FOREIGN KEY (`LabOrderId`)
    REFERENCES `healthcare`.`laborder` (`LabOrderId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`medication` (
  `MedicationId` INT(11) NOT NULL AUTO_INCREMENT,
  `Medication` VARCHAR(64) NOT NULL,
  `MedicationUsage` TEXT NOT NULL,
  `Dosage` VARCHAR(255) NOT NULL,
  `Frequency` VARCHAR(255) NOT NULL,
  `SideEffects` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`MedicationId`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`patientappointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`patientappointment` (
  `PatientAppointmentId` INT(11) NOT NULL AUTO_INCREMENT,
  `PatientId` INT(11) NOT NULL,
  `AppoinmentId` INT(11) NOT NULL,
  PRIMARY KEY (`PatientAppointmentId`),
  INDEX `FK_PatientAppointment_ElectronicPatient` (`PatientId` ASC),
  INDEX `FK_PatientAppointment_Appointment` (`AppoinmentId` ASC),
  CONSTRAINT `FK_PatientAppointment_Appointment`
    FOREIGN KEY (`AppoinmentId`)
    REFERENCES `healthcare`.`appointment` (`AppointmentId`),
  CONSTRAINT `FK_PatientAppointment_ElectronicPatient`
    FOREIGN KEY (`PatientId`)
    REFERENCES `healthcare`.`electronicpatient` (`PatientId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`patientmedication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`patientmedication` (
  `PatientMedicationId` INT(11) NOT NULL AUTO_INCREMENT,
  `PatientId` INT(11) NOT NULL,
  `MedicationId` INT(11) NOT NULL,
  PRIMARY KEY (`PatientMedicationId`),
  INDEX `FK_PatientMedication_ElectronicPatient` (`PatientId` ASC),
  INDEX `FK_PatientMedication_Medication` (`MedicationId` ASC),
  CONSTRAINT `FK_PatientMedication_ElectronicPatient`
    FOREIGN KEY (`PatientId`)
    REFERENCES `healthcare`.`electronicpatient` (`PatientId`),
  CONSTRAINT `FK_PatientMedication_Medication`
    FOREIGN KEY (`MedicationId`)
    REFERENCES `healthcare`.`medication` (`MedicationId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`patientphysician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`patientphysician` (
  `PatientPhysicianId` INT(11) NOT NULL AUTO_INCREMENT,
  `PatientId` INT(11) NOT NULL,
  `EmployeeId` INT(11) NOT NULL,
  PRIMARY KEY (`PatientPhysicianId`),
  INDEX `FK_Patient_Physician` (`EmployeeId` ASC),
  INDEX `FK_Patient_PatientPhysician` (`PatientId` ASC),
  CONSTRAINT `FK_Patient_PatientPhysician`
    FOREIGN KEY (`PatientId`)
    REFERENCES `healthcare`.`electronicpatient` (`PatientId`),
  CONSTRAINT `FK_Patient_Physician`
    FOREIGN KEY (`EmployeeId`)
    REFERENCES `healthcare`.`physician` (`EmployeeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`physicianappointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`physicianappointment` (
  `PhysicianAppointmentId` INT(11) NOT NULL AUTO_INCREMENT,
  `EmployeeId` INT(11) NOT NULL,
  `PatientAppointmentId` INT(11) NOT NULL,
  PRIMARY KEY (`PhysicianAppointmentId`),
  INDEX `FK_PhysicianAppointment_Physician` (`EmployeeId` ASC),
  INDEX `FK_PhysicianAppointment_PatientAppointment` (`PatientAppointmentId` ASC),
  CONSTRAINT `FK_PhysicianAppointment_PatientAppointment`
    FOREIGN KEY (`PatientAppointmentId`)
    REFERENCES `healthcare`.`patientappointment` (`PatientAppointmentId`),
  CONSTRAINT `FK_PhysicianAppointment_Physician`
    FOREIGN KEY (`EmployeeId`)
    REFERENCES `healthcare`.`physician` (`EmployeeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`physicianschedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`physicianschedule` (
  `PhysicianScheduleId` INT(11) NOT NULL AUTO_INCREMENT,
  `EmployeeId` INT(11) NOT NULL,
  `WeekNumber` INT(11) NOT NULL,
  `DayOfWeek` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`PhysicianScheduleId`),
  INDEX `FK_PhysicianSchedule_Physician` (`EmployeeId` ASC),
  CONSTRAINT `FK_PhysicianSchedule_Physician`
    FOREIGN KEY (`EmployeeId`)
    REFERENCES `healthcare`.`physician` (`EmployeeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`service` (
  `ServiceId` INT(11) NOT NULL AUTO_INCREMENT,
  `InsuranceCarrierId` INT(11) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Cost` DECIMAL(19,2) NOT NULL,
  UNIQUE INDEX `ServiceId` (`ServiceId` ASC),
  INDEX `FK_service_insurancecarrier_InsuranceCarrierId` (`InsuranceCarrierId` ASC),
  CONSTRAINT `FK_service_insurancecarrier_InsuranceCarrierId`
    FOREIGN KEY (`InsuranceCarrierId`)
    REFERENCES `healthcare`.`insurancecarrier` (`InsuranceCarrierId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`subsystem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`subsystem` (
  `SubsystemId` INT(11) NOT NULL AUTO_INCREMENT,
  `System` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`SubsystemId`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`user` (
  `UserId` INT(11) NOT NULL AUTO_INCREMENT,
  `EmployeeNumber` INT(11) NOT NULL,
  `JobTitle` VARCHAR(255) NOT NULL,
  `Password` VARCHAR(32) NOT NULL,
  `EmployeeName` VARCHAR(64) NOT NULL,
  `DateEntered` DATETIME NOT NULL,
  PRIMARY KEY (`UserId`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `healthcare`.`usersubsystem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `healthcare`.`usersubsystem` (
  `UserId` INT(11) NOT NULL,
  `SubsystemId` INT(11) NOT NULL,
  INDEX `FK_UserSubsystem_User` (`UserId` ASC),
  INDEX `FK_UserSubsystem_Subsystem` (`SubsystemId` ASC),
  CONSTRAINT `FK_UserSubsystem_Subsystem`
    FOREIGN KEY (`SubsystemId`)
    REFERENCES `healthcare`.`subsystem` (`SubsystemId`),
  CONSTRAINT `FK_UserSubsystem_User`
    FOREIGN KEY (`UserId`)
    REFERENCES `healthcare`.`user` (`UserId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
