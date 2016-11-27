CREATE TABLE Appointment
(
    AppointmentId       INT             NOT NULL    AUTO_INCREMENT PRIMARY KEY,
    Appointment         VARCHAR(255)    NOT NULL,
    AppointmentTypeId   INT             NOT NULL,
    AppointmentDate     DATE            NOT NULL,
    StartTime           INT             NOT NULL,
    EndTime             INT             NOT NULL,
    DateEntered         DATETIME        NOT NULL,
    CONSTRAINT          FK_Appointment_AppointmentType FOREIGN KEY (AppointmentTypeId)
    REFERENCES          AppointmentType(AppointmentTypeId)
);

INSERT INTO Appointment (Appointment, AppointmentTypeId, AppointmentDate, StartTime, EndTime, DateEntered) 
VALUES ('Annual Physical', 1, '2016-10-25', 540, 600, NOW());
INSERT INTO Appointment (Appointment, AppointmentTypeId, AppointmentDate, StartTime, EndTime, DateEntered) 
VALUES ('Foot Examination', 1, '2016-10-29', 780, 840, NOW());

