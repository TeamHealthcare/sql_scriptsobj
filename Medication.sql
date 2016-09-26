CREATE TABLE Medication
(
  MedicationId    int        NOT NULL  auto_increment  primary key,
  Medication          VARCHAR(64)    NOT NULL,
    MedicationUsage     TEXT            NOT NULL,
    Dosage              VARCHAR(255)    NOT NULL,
    Frequency           VARCHAR(255)    NOT NULL,
    SideEffects         TEXT
    );

INSERT INTO Medication (Medication, MedicationUsage, Dosage, Frequency, SideEffects) VALUES 
('Adderall', 'Taken orally with or without food as directed by your doctor', '150 mg', '1 to 3 times a day', 'Sleep problems, Mental mood changes');
INSERT INTO Medication (Medication, MedicationUsage, Dosage, Frequency, SideEffects) VALUES 
('Celexa', 'Citalopram is used to treat depression so this can be taken orally with or without food as directed by your doctor', '40 mg', '2 times a day', 'This should be taken at a low dosage to begin');
