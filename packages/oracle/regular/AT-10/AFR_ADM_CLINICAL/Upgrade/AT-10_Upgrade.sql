
--PROCESSING PACKAGE_SPEC DIAM_DIAGNOSES_MASTER_DATA_API

CREATE OR REPLACE EDITIONABLE PACKAGE "DIAM_DIAGNOSES_MASTER_DATA_API" IS

  -- Author  : 7040267
  -- Created : 2021-05-17 12:38:08 12:38:08
  -- Purpose : This pack is to be used to expose Diagnoses Master data to 3rd parties within the organisation.
  -----------------------------------------------------------------------------------------------------------------------------------------------

  -- Public type declarations
  -----------------------------------------------------------------------------------------------------------------------------------------------

  -- Public constant declarations
  -----------------------------------------------------------------------------------------------------------------------------------------------
  c_entry_request      CONSTANT VARCHAR2(50) := 'REQUEST';
  c_entry_last_changed CONSTANT VARCHAR2(50) := 'LAST_CHANGED';

  -- Public variable declarations
  -----------------------------------------------------------------------------------------------------------------------------------------------

  -- Public function and procedure declarations
  -----------------------------------------------------------------------------------------------------------------------------------------------

  FUNCTION generate_attributes (p_icod_id IN INTEGER) RETURN CLOB;

  -----------------------------------------------------------------------------------------------------------------------------------------------

  FUNCTION generate_age_classifications (p_icod_id IN INTEGER) RETURN CLOB;

  -----------------------------------------------------------------------------------------------------------------------------------------------

  PROCEDURE request (p_request    IN     CLOB,
                     p_response   IN OUT CLOB,
                     p_entrypoint IN     VARCHAR2 DEFAULT c_entry_request); -- For the Java Developer, hard code in thhe service REQUEST

  -----------------------------------------------------------------------------------------------------------------------------------------------

  PROCEDURE last_changed (p_payload  IN     CLOB,
                          p_response IN OUT CLOB);

  -----------------------------------------------------------------------------------------------------------------------------------------------

  procedure add_additional_procedure;

  -----------------------------------------------------------------------------------------------------------------------------------------------

  -----------------------------------------------------------------------------------------------------------------------------------------------

  -----------------------------------------------------------------------------------------------------------------------------------------------
END;
/


--PROCESSING PACKAGE_SPEC PRCM_PAYLOAD_PERSISTENCE

CREATE OR REPLACE EDITIONABLE PACKAGE "PRCM_PAYLOAD_PERSISTENCE" IS

  -- Author  : Simon Geuthner
  -- Created : 2021/04/19 07:55:26
  -- Purpose : All logic pertaining to the persistence of JSON payload data, into the relevent DB tables.
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  ----------------------------------
  -- Public constant declarations --
  ----------------------------------

  c_success       CONSTANT VARCHAR2(10)      := 'SUCCESS';
  c_fail          CONSTANT VARCHAR2(10)      := 'FAIL';
  c_additional_constant constant varchar2(1)  := 'Y';

  ------------------------------------------------
  -- Public function and procedure declarations --
  ------------------------------------------------

  -- This procedure is intended to process / persist the greater "PRCM JSON Payload", into the relevant DB tables.
  -- Refer to PRCM_PAYLOAD_MANAGEMENT package for additional detail on the payload itself.
  -- Parameters :
  --   Input : pi_request_payload :- Request payload in standard PRCM structure
  --           pi_disregard_nulls_on_update :- This parameter will drive how NULL values are treated in the provided record.
  --                                           Y : Should any particular field within the passed in record, contain a NULL value,
  --                                               the field will be treated as "nothing to update" / "leave in existing state" /
  --                                               "do not update field"
  --                                           N : Should any particular field within the passed in record, contain a NULL value,
  --                                               the field will be treated as "update specified field to NULL".
  --           pi_omit_nulls_from_response :- Should certain attributes / fields / properties contain NULL values, one has the ability
  --                                          to dictate whether these "unpopulated" attributes / fields / properties should be included
  --                                          in the response payload.
  --   Output : po_response_payload :- Response payload in standard PRCM structure, indicating processing status / errors encountered
  --                                   for the request as a whole, as well as at a record level for each entity / dataset. All or nothing
  --                                   approach taken, and entire request will be aborted upon first failure.
  PROCEDURE process_payload(pi_request_payload             IN  CLOB,
                            pi_disregard_nulls_on_update   IN  VARCHAR2 DEFAULT 'Y',
                            pi_omit_nulls_from_response    IN  VARCHAR2 DEFAULT 'Y',
                            po_response_payload            OUT CLOB);

END prcm_payload_persistence;
/


