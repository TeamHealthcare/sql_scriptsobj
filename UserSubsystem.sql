CREATE TABLE UserSubsystem
(
  UserId      int    not null,
    SubsystemId   int     not null,
    CONSTRAINT              FK_UserSubsystem_User FOREIGN KEY (UserId)
  REFERENCES              User(UserId),
    CONSTRAINT              FK_UserSubsystem_Subsystem FOREIGN KEY (SubsystemId)
  REFERENCES              Subsystem(SubsystemId)    
);

INSERT INTO UserSubsystem (UserId, SubsystemId) VALUES (1, 1);
INSERT INTO UserSubsystem (UserId, SubsystemId) VALUES (1, 2);
INSERT INTO UserSubsystem (UserId, SubsystemId) VALUES (1, 3);
INSERT INTO UserSubsystem (UserId, SubsystemId) VALUES (2, 1);
INSERT INTO UserSubsystem (UserId, SubsystemId) VALUES (2, 2);
INSERT INTO UserSubsystem (UserId, SubsystemId) VALUES (2, 3);