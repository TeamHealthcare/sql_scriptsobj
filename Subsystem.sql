CREATE TABLE Subsystem
(
	SubsystemId		    int				NOT NULL	auto_increment	primary key,
    System              varchar(32)     NOT NULL
);

INSERT INTO Subsystem (System) VALUES ('ER');
INSERT INTO Subsystem (System) VALUES ('SCHED');
INSERT INTO Subsystem (System) VALUES ('LT');
INSERT INTO Subsystem (System) VALUES ('PT');
INSERT INTO Subsystem (System) VALUES ('IB');
INSERT INTO Subsystem (System) VALUES ('EQ');