USE healthcare;

CREATE VIEW vw_userstosystems
AS
SELECT
  `u`.`UserId` AS `UserId`,
  `u`.`Username` AS `username`,
  `us`.`SubsystemId` AS `SubsystemId`,
  `s`.`System` AS `System`
FROM ((`user` `u`
  JOIN `usersubsystem` `us`
    ON ((`u`.`UserId` = `us`.`UserId`)))
  JOIN `subsystem` `s`
    ON ((`s`.`SubsystemId` = `us`.`SubsystemId`)));