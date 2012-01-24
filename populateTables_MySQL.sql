SET FOREIGN_KEY_CHECKS=0;

/* accounts Table COMMANDS */
/* password is 12345, TEAM LEADER*/
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Matthew', 'Schranz', 'mjschranz@learn.senecac.on.ca', 'PRJ566Sum2012', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);  

/* password is 12345, TEAM LEADER*/
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Edouard', 'Davlatian', 'edavlatian@learn.senecac.on.ca', 'PRJ566Sum2012', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);
  
/* password is 12345, TEAM LEADER*/
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Alana', 'Marinucci', 'alana.marinucci@learn.senecac.on.ca', 'PRJ566Sum2012', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);

/* password is 12345, SUPERVISOR */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Emile', 'Ohan', 'emile.ohan@senecac.on.ca', 'PRJ666Supervisor', 'SU', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);
  
/* password is 12345, INSTRUCTOR */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Mark', 'Buchner', 'mark.buchner@senecac.on.ca', 'PRJ566Instructor', 'IN', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);
  
/* password is 12345, ADMIN */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Evan', 'Weaver', 'evan.weaver@senecac.on.ca', 'ADMIN', 'AD', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Mark', 'Schranz', 'mark.schranz@gmail.com', 'companyREP', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Robin', 'Williams', 'robin.williams@yahoo.com', 'companyREP', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Bill', 'Maher', 'bmaher@gmail.com', 'companyREP', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Olivia', 'Wilde', 'olivia.wilde@olivia-wilde.org', 'companyREP', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 1);

  
/* teams Table Commands */
INSERT INTO teams (teamIdentifier, teamEmail, teamName, teamConstraints, userId)
  VALUES ('prj566ASUM2012_1', 'mjschranz@learn.senecac.on.ca;sara.underwood@learn.senecac.on.ca', 'BEAM Solutions', 'JAVA<br/>MySQL<br/>Glassfish', 1);
  
INSERT INTO teams (teamIdentifier, teamEmail, teamName, teamConstraints, userId)
  VALUES ('prj566ASUM2012_2', 'edavlatian@learn.senecac.on.ca;bmcohen@learn.senecac.on.ca;klcaliso1@learn.senecac.on.ca', 'NRA Solutions', 'C#<br/>SQLite<br/>Apache', 2);

INSERT INTO teams (teamIdentifier, teamEmail, teamName, teamConstraints, userId)
  VALUES ('prj566ASUM2012_3', 'alana.marinucci@learn.senecac.on.ca;batman.batman@learn.senecac.on.ca', 'BATMAAAAAANN', 'PHP<br/>DERBY<br/>JBoss', 3);

/* teammember Table Commands */
INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId)
  VALUES ('Matthew', 'Schranz', 'mjschranz@learn.senecac.on.ca', 'Almost like McGyver in programming form', 1, 1);
  
INSERT INTO teammember (firstName, lastName, email, description, teamId)
  VALUES ('Sara', 'Underwood', 'sara.underwood@learn.senecac.on.ca', 'Almost like McGyver in programming form', 1);
  
INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId)
  VALUES ('Edouard', 'Davlatian', 'edavlatian@learn.senecac.on.ca', 'Almost NOT like McGyver in programming form', 1, 2);
  
INSERT INTO teammember (firstName, lastName, email, description, teamId)
  VALUES ('Bryan', 'Cohen', 'bmcohen@learn.senecac.on.ca', 'Almost like NOT McGyver in programming form. Jokes.', 2);

INSERT INTO teammember (firstName, lastName, email, description, teamId)
  VALUES ('Kepner', 'Caliso', 'klcaliso1@learn.senecac.on.ca', 'Almost like NOT McGyver in programming form. Jokes.', 2);
  
INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId)
  VALUES ('Alana', 'Marinucci', 'alana.marinucci@learn.senecac.on.ca', 'Nothing can describe me', 1, 3);

INSERT INTO teammember (firstName, lastName, email, description, teamId)
  VALUES ('Batman', 'Batman', 'batman.batman@learn.senecac.on.ca', 'BATMAN. DUNAH NUNAH NUNAH NUNAH NUNAH NUNAH NUNAH BATMAN!', 3);


/* company Table Commands */
INSERT INTO company (companyName, companyPhone, repId)
  VALUES ('Batman Anonymous', '123-456-7890', 7);
  
INSERT INTO company (companyName, companyPhone, repId)
  VALUES ('JUMANJI', '123-456-7891', 9);
  
INSERT INTO company (companyName, companyPhone, repId)
  VALUES ('Robin Anonymous', '123-456-7892', 8);
  
INSERT INTO company (companyName, companyPhone, repId)
  VALUES ('Wilde Things', '123-456-7879', 10);

  
/* projects Table Commands */
INSERT INTO projects (prjIdentifier, status, prjName, description, prjConstraints, agreementDate, companyId, instructorId)
  VALUES ('PRJ566SUM2012', 'PE', 'Gemini', 'We are going to be doing super awesome stuff. Our project is going to be the next Facebook!', 'Java<br/>MySQL', '06/21/2012', 4, 5);
  
INSERT INTO projects (prjIdentifier, status, prjName, description, prjConstraints, agreementDate, companyId, instructorId)
  VALUES ('PRJ566SUM2012', 'PE', 'McLovin', 'We are going to be doing super awesome stuff. Our project is going to be the next Twitter!', 'PHP<br/>MySQL', '06/19/2012', 3, 5);

INSERT INTO projects (prjIdentifier, status, prjName, description, prjConstraints, agreementDate, companyId, instructorId)
  VALUES ('PRJ566SUM2012', 'PE', 'Awesomesauce', 'We are going to be doing super awesome stuff. Our project is going to be the next World of Warcraft!', 'C#<br/>MySQL', '06/20/2012', 2, 5);

INSERT INTO projects (prjIdentifier, status, prjName, description, prjConstraints, agreementDate, companyId, instructorId)
  VALUES ('PRJ566SUM2012', 'PE', 'EPIC MEAL TIME', 'We are going to be doing super awesome stuff. Our project is going to be the next Wordpress!', 'Drupal<br/>MySQL', '05/19/2012', 1, 5);
  

/* comments Table Commands */
INSERT INTO comments (projectId, commentDescription)
  VALUES (1, 'This is a comment. Your groups work sucked. I hope you all failed.');
  
INSERT INTO comments (projectId, commentDescription)
  VALUES (2, 'JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI!');

INSERT INTO comments (projectId, commentDescription)
  VALUES (3, 'This is a comment. Your groups work sucked. I hope you all failed.');
  
INSERT INTO comments (projectId, commentDescription)
  VALUES (4, 'This is a comment. Your groups work was awesome. Have my babies.');

 
/* milestone Table Commands */
INSERT INTO milestone (description, projectId, dueDate)
  VALUES ('Design Underway', 1, '06/30/2012');
  
INSERT INTO milestone (description, projectId, dueDate)
  VALUES ('Design Underway', 2, '06/30/2012');
  
INSERT INTO milestone (description, projectId, dueDate)
  VALUES ('Design Underway', 3, '06/30/2012');
  
INSERT INTO milestone (description, projectId, dueDate)
  VALUES ('Design Underway', 4, '06/30/2012');
  
INSERT INTO milestone (description, milestoneStatus, projectId, dueDate)
  VALUES ('PID Completion', 'CO', 1, '08/30/2012');
  
INSERT INTO milestone (description, milestoneStatus, projectId, dueDate)
  VALUES ('PID Completion', 'CO', 2, '08/30/2012');
  
INSERT INTO milestone (description, milestoneStatus, projectId, dueDate)
  VALUES ('PID Completion', 'CO', 3, '08/30/2012');
  
INSERT INTO milestone (description, milestoneStatus, projectId, dueDate)
  VALUES ('PID Completion', 'CO', 4, '08/30/2012');
  
/* teamprojectranking Table Command 
  Note: Only doing two here because pre populated data isn't nearly as useful, as we obviously need to see if ranking is being saved properly when being done.
*/
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking)
  VALUES (1, 4, 'T', 1);
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking)
  VALUES (1, 4, 'C', 1);
  
/* projectfile Table Commands */
INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Sample Data', 'Containts Sample data for use in design', 'http://www.reddit.com/r/funny/', 4);
  
INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Sample Stuff', 'Containts Sample data for use with system design', 'http://www.reddit.com/r/gaming/', 3);
  
INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Sample Images', 'Containts Sample data for use in implementation', 'http://www.reddit.com/r/politics/', 2);
  
INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Sample Names', 'Containts Sample data for use in design process', 'http://www.reddit.com/r/music/', 1);
  
SET FOREIGN_KEY_CHECKS=1;