/* get table names - provided by site */
SELECT name 
  FROM sqlite_master
 where type = 'table';
/* result: 
-----------------------
name
-----------------------
crime_scene_report
drivers_license
person
facebook_event_checkin
interview
get_fit_now_member
get_fit_now_check_in
income
solution 
-----------------------
*/

 /* get structure of the crime scene report - provided by site */
 SELECT sql 
  FROM sqlite_master
 where name = 'crime_scene_report';
 /* result: 
-----------------------
sql
-----------------------
CREATE TABLE crime_scene_report ( date integer, type text, description text, city text )
-----------------------
*/


