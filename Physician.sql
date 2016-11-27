CREATE TABLE physician (
  PhysicianId int(11) NOT NULL AUTO_INCREMENT,
  EmployeeId int(11) NOT NULL,
  Name varchar(255) NOT NULL,
  ContactNumber varchar(32) NOT NULL,
  PRIMARY KEY (PhysicianId)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;