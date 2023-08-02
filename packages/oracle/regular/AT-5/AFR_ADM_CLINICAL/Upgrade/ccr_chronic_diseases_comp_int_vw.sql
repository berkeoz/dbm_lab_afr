CREATE OR REPLACE VIEW adm_clinical.ccr_chronic_diseases_comp_int_vw AS
SELECT cdis.cdis_id,
       cdis.code,
       cdis.description,
       -- Country Details
       cdis.cou_id,
         cou.alpha2_code       cou_alpha2_code,
         cou.alpha3_code       cou_alpha3_code,
         cou.country_name      cou_country_name,
         cou.active            cou_active,          
       -- Data Source Details
       cdis.dsou_id,
         dsou.code             dsou_code,
         dsou.description      dsou_description,
         dsou.cou_id           dsou_cou_id,
         dsou.cou_alpha2_code  dsou_cou_alpha2_code,
         dsou.cou_country_name dsou_cou_alpha3_code,
         dsou.active           dsou_active,
       cdis.start_date,
       cdis.end_date,
       cdis.create_date,
       cdis.create_user,
       cdis.modified_date,
       cdis.modified_user,
	   'Marc Was Here' whoamI
  FROM ccr_chronic_diseases cdis,
       cm_md_countries_comp_int_vw cou,
       cm_md_data_sources_comp_int_vw dsou
 WHERE cdis.cou_id  = cou.cou_id(+)
   AND cdis.dsou_id = dsou.dsou_id;
  
CREATE OR REPLACE PUBLIC SYNONYM ccr_chronic_diseases_comp_int_vw FOR adm_clinical.ccr_chronic_diseases_comp_int_vw;

GRANT SELECT ON adm_clinical.ccr_chronic_diseases_comp_int_vw TO svci_ccd_role;
