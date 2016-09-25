CREATE TABLE Appointment
(
	AppoinmentId		INT				NOT NULL	AUTO_INCREMENT PRIMARY KEY,
	Appointment			VARCHAR(255)	NOT NULL,
	AppointmentDate		DATE            NOT NULL,
	StartTime			INT             NOT NULL,
	EndTime             INT             NOT NULL,
    DateEntered         DATETIME		NOT NULL
);

INSERT INTO Appointment (Appointment, AppointmentDate, StartTime, EndTime, DateEntered) 
VALUES ('Annual Physical', '2016-10-25', 540, 600, NOW());
INSERT INTO Appointment (Appointment, AppointmentDate, StartTime, EndTime, DateEntered) 
VALUES ('Foot Examination', '2016-10-29', 780, 840, NOW());