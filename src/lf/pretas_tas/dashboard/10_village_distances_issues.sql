/*
 * File: 10_village_distances_issues.sql
 * File Created: Wednesday, 6th May 2020 2:01:44 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 12th May 2020 1:57:33 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */


/*
 * This query will will display the list of nearby villages less than <%village_dist_required%> KM
 * Variable to rename <%ab_cde_fgh_1_site%>, <%village_dist_required%>
 */
SELECT

  calculate_distance(src.c_gps_lat , src.c_gps_lng , dest.c_gps_lat , dest.c_gps_lng,  'K') "Distances in KM",
  src.c_recorder_id "Recorder1 ID",
  src.c_cluster_id1 "Cluster1 ID",
  src.c_cluster_name "Cluster1 Name",
  dest.c_recorder_id "Recorder2 ID",
  dest.c_cluster_id1 "Cluster2 ID",
  dest.c_cluster_name  "Cluster2 Name",
  src.c_gps_lat "Latitude1",
  src.c_gps_lng "Longitude1",
  dest.c_gps_lat "Latitude2",
  dest.c_gps_lng "Longitude2"

FROM <%ab_cde_fgh_1_site%> src
  JOIN <%ab_cde_fgh_1_site%> dest on (
    SELECT calculate_distance(src.c_gps_lat , src.c_gps_lng , dest.c_gps_lat , dest.c_gps_lng,  'K') < <%village_dist_required%>
    AND src.c_cluster_id1 <> dest.c_cluster_id1
  )

WHERE IS NOT NULL

  ------ Metabase filter -------
  -- [[and {{district}}]];

