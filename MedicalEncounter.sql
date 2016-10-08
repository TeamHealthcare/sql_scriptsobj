USE healthcare;

CREATE TABLE medicalencounter (
  EncounterDate datetime NOT NULL,
  Practitioner int(11) NOT NULL,
  Complaint text NOT NULL,
  VitalSigns text NOT NULL,
  Notes text NOT NULL,
  LabOrderId int(11) NOT NULL,
  PharmacyOrder text NOT NULL,
  Diagnosis text NOT NULL,
  TreatmentPlan text NOT NULL,
  Referral text NOT NULL,
  FollowUpNotes text NOT NULL
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;