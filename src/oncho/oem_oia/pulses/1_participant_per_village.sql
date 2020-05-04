/*
 * File: 1_participant_per_village.sql
 * File Created: Monday, 4th May 2020 12:34:18 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 4th May 2020 12:39:30 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will return a table that will contain the number of participants per village surveyed the day before.
 * Variable to rename <%ab_cde_fgh_3_rdt_ov16%>, <%v_ab_cde_fgh_3_participant%>
 */
 SELECT
  p_recorder_id "Recorder ID",
  c_district "Duistrict",
  c_cluster_id "Cluster ID",
  c_cluster_name "Cluster Name",
  COUNT(p.id) "# Participant"

FROM <%v_ab_cde_fgh_1_cluster%> p
LEFT JOIN <%v_ab_cde_fgh_3_participant%> c ON c.c_cluster_id = p.p_cluster_id::INT

where p.p_date > CURRENT_DATE - 1

GROUP BY p_recorder_id, c_district, c_cluster_id, c_cluster_name