USE healthcare;

CREATE TABLE workschedule (
  WorkScheduleId int(11) NOT NULL AUTO_INCREMENT,
  PhysicianId int(11) NOT NULL,
  WeekOfYear int(11) NOT NULL,
  DayOfWeek int(11) NOT NULL,
  StartTime int(11) NOT NULL,
  EndTime int(11) NOT NULL,
  PRIMARY KEY (WorkScheduleId),
  CONSTRAINT FK_workschedule_physician_PhysicianId FOREIGN KEY (PhysicianId)
  REFERENCES physician (PhysicianId) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;