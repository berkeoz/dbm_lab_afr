

SET TRANSACTION READ WRITE;
ALTER SESSION SET CONSTRAINTS = DEFERRED;

DELETE FROM CCR_REF_CODES
WHERE 
"RCOD_ID"=1;
ALTER SESSION SET CONSTRAINTS = IMMEDIATE;
COMMIT;