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
 	WHERE name = 'crime_scene_report';
 /* result: 
-----------------------
sql
-----------------------
CREATE TABLE crime_scene_report ( date integer, type text, description text, city text )
-----------------------
*/



/* read the crime scene report for ​any murder​ that occurred on ​Jan.15, 2018​ and took 
place in ​SQL City */
SELECT * 
 	FROM crime_scene_report
 	WHERE date = 20180115
 		AND type = 'murder'
 		AND city = 'SQL City';
/* info gained:  2 witnesses. One lives at the last house on "Northwestern Dr" and the
other is named Annabel and lives on "Franklin Ave". */ 



/* Let's see what's contained in the interview table */
SELECT sql
	FROM sqlite_master
	WHERE name = 'interview';
/* result: CREATE TABLE interview ( person_id integer, transcript text, 
FOREIGN KEY (person_id) REFERENCES person(id) ) */



/* We need the person ID to get their interviews, let's see what the person table has 
that we can use to find anabelle and the person in the last house*/
SELECT sql
	FROM sqlite_master
	WHERE name = 'person';
/* reults: CREATE TABLE person ( id integer PRIMARY KEY, name text, license_id integer, 
address_number integer, address_street_name text, ssn integer, FOREIGN KEY (license_id) 
REFERENCES drivers_license(id) ) */



 /* Let's see what we can find in 'person' for annabel */
SELECT * 
 	FROM person
	WHERE address_street_name = "Franklin Ave"
		AND name LIKE "annabel%";
/* id	name	        license_id	address_number	address_street_name	ssn
16371	Annabel Miller	490173	    103	            Franklin Ave	    318771143 */



/* And we'll do the same thing for the last person on Northwestern Dr.*/
SELECT * 
	FROM person
	WHERE address_street_name = "Northwestern Dr"
	ORDER BY address_number DESC 
	LIMIT 1;
/* id	name			license_id	address_number	address_street_name	ssn
14887	Morty Schapiro	118009		4919			Northwestern Dr		11564949 */



/* Okay, now we can checkout their interviews */
SELECT * 
	FROM interview
	WHERE person_id = 16371 
		OR person_id = 14887;
/* person_id	transcript
14887			I heard a gunshot and then saw a man run out. He had a "Get Fit 
				Now Gym" bag. The membership number on the bag started with "48Z". 
				Only gold members have those bags. The man got into a car with a 
				plate that included "H42W".
16371			I saw the murder happen, and I recognized the killer from my gym 
				when I was working out last week on January the 9th.



