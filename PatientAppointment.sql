USE healthcare;

CREATE TABLE patientappointment (
  PatientAppointmentId int(11) NOT NULL AUTO_INCREMENT,
  PatientId int(11) NOT NULL,
  AppoinmentId int(11) NOT NULL,
  PRIMARY KEY (PatientAppointmentId),
  CONSTRAINT FK_patientappointment_appointment_AppointmentId FOREIGN KEY (AppoinmentId)
  REFERENCES appointment (AppointmentId) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_patientappointment_electronicpatient_PatientId FOREIGN KEY (PatientId)
  REFERENCES electronicpatient (PatientId) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;