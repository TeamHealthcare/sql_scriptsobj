USE healthcare;

CREATE TABLE physicianappointment (
  PhysicianAppointmentId int(11) NOT NULL AUTO_INCREMENT,
  PhysicianId int(11) NOT NULL,
  PatientAppointmentId int(11) NOT NULL,
  PRIMARY KEY (PhysicianAppointmentId),
  CONSTRAINT FK_physicianappointment_patientappointment_PatientAppointmentId FOREIGN KEY (PatientAppointmentId)
  REFERENCES patientappointment (PatientAppointmentId) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;