CREATE TABLE User
(
    UserId          int          NOT NULL   auto_increment   primary key,
    EmployeeNumber      int          NOT NULL,
    JobTitle            varchar(255)    NOT NULL,
    Password            varchar(32)     NOT NULL,
    EmployeeName     varchar(64)     NOT NULL,
    DateEntered      datetime    NOT NULL
);

INSERT INTO User (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (1111, 'Physician', 'doctor', 'Joe Smith', NOW());
INSERT INTO User (EmployeeNumber, JobTitle, Password, EmployeeName, DateEntered) VALUES (1112, 'Nurse', 'nurse', 'Joe Intern', NOW());