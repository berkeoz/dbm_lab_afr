
/*
========================================================================
====================BUILD WARNINGS======================================
========================================================================

Alter script for TABLE type is not supported yet

========================================================================
*/
ALTER TABLE CCR_APPL_PARAMS ADD (ADD_COLUMN VARCHAR2(20));
ALTER TABLE CCR_APPL_PARAMS ADD (ADDITIONAL_COLUMN VARCHAR2(20));

--### TABLE 'CCR_APPL_PARAMS' has changed. Alter script for TABLE type is not supported yet. Please add here the alter script manually ###


SET TRANSACTION READ WRITE;
ALTER SESSION SET CONSTRAINTS = DEFERRED;


UPDATE CCR_APPL_PARAMS 
SET
"ADDITIONAL_COLUMN"=null
WHERE 
"APAR_ID"=1;



INSERT INTO CCR_APPL_PARAMS ("APAR_ID", "PAR_NAME", "PAR_VALUE", "PAR_DATA_TYPE_ID", "PAR_FORMAT_ID", "PAR_DESCRIPTION", "ACTIVE", "CREATE_DATE", "CREATE_USER", "MODIFIED_DATE", "MODIFIED_USER", "ADD_COLUMN", "ADDITIONAL_COLUMN")
VALUES (2, 'Test-param-2', 'Value 2', 123456, null, 'Test Paramater 2', 'Y', TO_TIMESTAMP('2023-08-03 13:24:39','YYYY-MM-DD HH24:MI:SS'), 'SIMON', TO_TIMESTAMP('2023-08-03 13:24:46','YYYY-MM-DD HH24:MI:SS'), 'SIMON', 'Bleh', null);
ALTER SESSION SET CONSTRAINTS = IMMEDIATE;
COMMIT;