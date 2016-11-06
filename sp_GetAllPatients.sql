-- Don't forget to set the Delimiter
DROP PROCEDURE IF EXISTS sp_GetAllPatients $$
CREATE PROCEDURE sp_GetAllPatients ()
BEGIN
  SELECT
    PatientId,
    PatientName,
    PhoneNumber,
    Address,
    City,
    State,
    ZipCode,
    InsuranceCarrierId,
    DateOfBirth,
    Gender,
    Physician
  FROM electronicpatient;
END $$