CREATE TABLE AppointmentType
(
  AppointmentTypeId    INT        NOT NULL  AUTO_INCREMENT PRIMARY KEY,
  AppointmentType      VARCHAR(255)  NOT NULL  
);

INSERT INTO AppointmentType (AppointmentType) VALUES ('Routine');
INSERT INTO AppointmentType (AppointmentType) VALUES ('Urgent Care');
INSERT INTO AppointmentType (AppointmentType) VALUES ('Follow Up');