SELECT SUM(JobsRegister_Materials.count) AS quantity , Materials.name, Materials.unit FROM JobsRegister_Materials JOIN Materials ON JobsRegister_Materials.materialId = Materials.materialId GROUP BY JobsRegister_Materials.materialId;

SELECT JobsRegister.kkTechnicianId, COUNT(JobsRegister.jobsRegisterId) FROM JobsRegister GROUP BY JobsRegister.kkTechnicianId;

SELECT * FROM JobsRegister LEFT JOIN JobsRegister_Materials ON JobsRegister.jobsRegisterId = JobsRegister_Materials.jobsRegisterId WHERE JobsRegister.kkTechnicianId=42;

ALTER TABLE Materials ADD quantity decimal;

UPDATE Materials SET Materials.quantity = (SELECT SUM(JobsRegister_Materials.count) FROM JobsRegister_Materials WHERE JobsRegister_Materials.materialId = Materials.materialId GROUP BY JobsRegister_Materials.materialId);

ALTER TABLE Materials ADD profit decimal;

UPDATE Materials SET Materials.profit = Materials.quantity * (Materials.price - Materials.cost);

DELETE FROM JobsRegister WHERE JobsRegister.kkTechnicianId IS NULL;

DELETE FROM JobsRegister_Services WHERE JobsRegister_Services.goal IS NULL;

INSERT INTO JobsRegister_Materials(JobsRegister_Materials.jobsRegisterServiceId, JobsRegister_Materials.jobsRegisterId, JobsRegister_Materials.materialId, JobsRegister_Materials.count) VALUES (614650, 520382, 22233, 1);

DELIMITER //
CREATE PROCEDURE insert1000()
BEGIN
  DECLARE val INT DEFAULT 0;
  loopie : LOOP
    IF (val = 1000) THEN
      LEAVE loopie;
    END IF;
	
    INSERT INTO JobsRegister_Materials(JobsRegister_Materials.jobsRegisterServiceId, JobsRegister_Materials.jobsRegisterId, JobsRegister_Materials.materialId, JobsRegister_Materials.count) VALUES (614650, 520382, 22233, 1);
    SET val = val +1;
  END LOOP; 
END//
DELIMITER;

CALL insert1000();
