
/*
========================================================================
====================BUILD WARNINGS======================================
========================================================================

Alter script for TABLE type is not supported yet

========================================================================
*/
ALTER TABLE CCR_APPL_PARAMS DROP COLUMN ADDITIONAL_COLUMN;

--### TABLE 'CCR_APPL_PARAMS' has changed. Alter script for TABLE type is not supported yet. Please add here the alter script manually ###


SET TRANSACTION READ WRITE;
ALTER SESSION SET CONSTRAINTS = DEFERRED;

DELETE FROM CCR_APPL_PARAMS
WHERE 
"APAR_ID"=2;
ALTER SESSION SET CONSTRAINTS = IMMEDIATE;
COMMIT;