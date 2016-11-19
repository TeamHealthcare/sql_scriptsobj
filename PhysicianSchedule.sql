CREATE TABLE physicianschedule (
  PhysicianScheduleId int(11) NOT NULL,
  PhysicianId int(11) NOT NULL,
  WeekNumber int(11) NOT NULL,
  DayOfWeek varchar(12) NOT NULL,
  PRIMARY KEY (PhysicianScheduleId),
  CONSTRAINT FK_physicianschedule_physician_PhysicianId FOREIGN KEY (PhysicianId)
  REFERENCES physician (PhysicianId) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;