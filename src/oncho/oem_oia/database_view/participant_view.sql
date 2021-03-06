/*
 * File: participant_view.sql
 * File Created: Thursday, 23rd April 2020 2:11:14 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 28th April 2020 5:29:11 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */


  /*
 * Variable to rename  <%ab_cde_fgh_2_participant%>, <%ab_cde_fgh_1_cluster%>, <%v_ab_cde_fgh_2_participant%>
 */

CREATE VIEW <%v_ab_cde_fgh_2_participant%>
AS SELECT p.id,
    p.p_recorder_id,
    p.p_district,
    p.p_cluster_id,
    c.c_cluster_name AS p_cluster_name,
    p.p_consent,
    p.p_age_yrs,
    p.p_how_long_lived,
    p.p_travel,
    p.p_ivm,
    p.p_ivm_where,
    p.p_sex,
    p.p_id_method,
    CASE WHEN p_IDMethod = 'Scanner' THEN p.p_barcode_id ELSE p_GenerateID END as p_barcode_id,
    --p.p_barcode_id,
    p.p_generate_id,
    p.p_additional_notes,
    p.p_end_time AS p_date
   FROM <%ab_cde_fgh_2_participant%> p
   LEFT JOIN <%ab_cde_fgh_1_cluster%> c ON c.c_cluster_id = p.p_cluster_id::TEXT
