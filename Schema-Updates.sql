ALTER TABLE laborder DROP FOREIGN KEY FK_LabOrder_ElectronicPatient;
ALTER TABLE medicalencounter DROP FOREIGN KEY FK_medicalencounter_laborder_LabOrderId;

ALTER TABLE medicalencounter ADD COLUMN MedicalEncounterId  int NOT NULL AUTO_INCREMENT UNIQUE FIRST;
ALTER TABLE medicalencounter DROP COLUMN LabOrderId;
ALTER TABLE medicalencounter DROP COLUMN Practitioner;

CREATE TABLE medicalencounterlaborders (
  ME_LabOrderId int(11) NOT NULL AUTO_INCREMENT,
  MedicalEncounterId int(11) NOT NULL,
  LabOrderId int(11) NOT NULL,
  PRIMARY KEY (ME_LabOrderId),
  CONSTRAINT FK_ME_MELO_MedicalEncounterId FOREIGN KEY (MedicalEncounterId)
  REFERENCES medicalencounter (MedicalEncounterId) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_MELO_LO_LabOrderId FOREIGN KEY (LabOrderId)
  REFERENCES laborder (LabOrderId) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;
