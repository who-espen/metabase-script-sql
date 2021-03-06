/*
 * File: 11_action_todo.sql
 * File Created: Tuesday, 12th May 2020 1:55:56 pm
 * Author: Dyesse YUMBA
 * Last Modified: Tuesday, 12th May 2020 1:59:22 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * This query will provide the list of actions to do for fixing the mistakes on data
 * Variable to rename <%surver_detail%>, <%metabase_sch_sth_ias_action_todo_202004%>
 */
SELECT
 id "SN",
 description "Description",
 actor "Actor",
 status "Status",
 due_date "Due Date"
FROM <%metabase_sch_sth_ias_action_todo_202004%>
WHERE surver_detail = '<%surver_detail%>'
