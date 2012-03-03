SET FOREIGN_KEY_CHECKS=0;

/* accounts Table COMMANDS */
/* password is 12345, TEAM LEADER*/
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Matthew', 'Schranz', 'mjschranz@learn.senecac.on.ca', 'PRJ566Sum2012_1', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');  

/* password is 12345, TEAM LEADER*/
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Edouard', 'Davlatian', 'edavlatian@learn.senecac.on.ca', 'PRJ566Sum2012_2', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, TEAM LEADER*/
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Alana', 'Marinucci', 'alana.marinucci@learn.senecac.on.ca', 'PRJ566Sum2012_3', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');

/* password is 12345, SUPERVISOR */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Emile', 'Ohan', 'emile.ohan@senecac.on.ca', 'emile.ohan', 'SU', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, INSTRUCTOR */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Mark', 'Buchner', 'mark.buchner@senecac.on.ca', 'mark.buchner', 'IN', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, ADMIN */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Evan', 'Weaver', 'evan.weaver@senecac.on.ca', 'evan.weaver', 'AD', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Mark', 'Schranz', 'mark.schranz@gmail.com', 'mark.schranz', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Robin', 'Williams', 'robin.williams@yahoo.com', 'robin.williams', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Bill', 'Maher', 'bmaher@gmail.com', 'bill.maher', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Olivia', 'Wilde', 'olivia.wilde@olivia-wilde.org', 'olivia.wilde', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password, accountStatus) 
  VALUES ('Jon', 'Buckley', 'jon@buckley.ca', 'j.buck', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=', 0);
  
/* password is 12345, companyREP */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Scott', 'Downe', 'scott.downe@gmail.com', 'scott.downe', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');

/* password is 12345, TEAM LEADER */
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Rachel', 'Nichols', 'rachel.nichols@learn.senecac.on.ca', 'PRJ566Sum2012_4', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  

/* teams Table Commands */
INSERT INTO teams (teamEmail, teamName, teamConstraints, userId, teamDescription)
  VALUES ('mjschranz@learn.senecac.on.ca;sara.underwood@learn.senecac.on.ca', 'BEAM Solutions', 'JAVA<br/>MySQL<br/>Glassfish', 1,
    'WE LIKE PUPPIES AND RAINBOWS');
  
INSERT INTO teams (teamEmail, teamName, teamConstraints, userId, teamDescription)
  VALUES ('edavlatian@learn.senecac.on.ca;bmcohen@learn.senecac.on.ca;klcaliso1@learn.senecac.on.ca', 'NRA Solutions', 'C#<br/>SQLite<br/>Apache', 2,
    'WE LIKE CATS AND OTHER STUFF TOO');

INSERT INTO teams (teamEmail, teamName, teamConstraints, userId, teamDescription)
  VALUES ('alana.marinucci@learn.senecac.on.ca;batman.batman@learn.senecac.on.ca', 'BATMAAAAAANN', 'PHP<br/>DERBY<br/>JBoss', 3,
    'RABBLE RABBLE RABBLE RABBLE RABBLE RABBLE RABBLE');

/* teammember Table Commands */
INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId)
  VALUES ('Matthew', 'Schranz', 'mjschranz@learn.senecac.on.ca', 'Almost like McGyver in programming form', 1, 1);
  
INSERT INTO teammember (firstName, lastName, email, description, teamId)
  VALUES ('Derpina', 'Derpin', 'derpina.derpin@learn.senecac.on.ca', 'Almost like McGyver in programming form, V2', 1);
  
INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId)
  VALUES ('Edouard', 'Davlatian', 'edavlatian@learn.senecac.on.ca', 'Almost NOT like McGyver in programming form', 1, 2);
  
INSERT INTO teammember (firstName, lastName, email, description, teamId)
  VALUES ('Bryan', 'Cohen', 'bmcohen@learn.senecac.on.ca', 'Almost like NOT McGyver in programming form. Jokes.', 2);

INSERT INTO teammember (firstName, lastName, email, description, teamId)
  VALUES ('Kepner', 'Caliso', 'klcaliso1@learn.senecac.on.ca', 'Almost like NOT McGyver in programming form. Jokes.', 2);
  
INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId)
  VALUES ('Alana', 'Marinucci', 'alana.marinucci@learn.senecac.on.ca', 'Nothing can describe me. Super Programmer.', 1, 3);

INSERT INTO teammember (firstName, lastName, email, description, teamId)
  VALUES ('Batman', 'Batman', 'batman.batman@learn.senecac.on.ca', 'BATMAN. DUNAH NUNAH NUNAH NUNAH NUNAH NUNAH NUNAH BATMAN!', 3);


/* company Table Commands */
INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId)
  VALUES ('Batman Anonymous', '123-456-7890', 'Crime Fighting. Bruce Wayne Industries', 'Dunuah DUNAH Dunuah DUNAH Dunuah DUNAH Dunuah DUNAH Dunuah DUNAH BATMAAAAAANN', 7);
  
INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId)
  VALUES ('JUMANJI', '123-456-7891', 'Board Games', 'Awesome Board Games. We are going to make the next Monopoly.', 9);
  
INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId)
  VALUES ('Robin Anonymous', '123-456-7892', 'Movie Industry', 'Going to make the next awesome series of movies. Win many grammies.', 8);
  
INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId)
  VALUES ('Wilde Things', '123-456-7879', 'Philanthropy', 'Saving the world, one person at a time.', 10);

INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId)
  VALUES ('Downers', '123-456-4879', 'Sad Emo Stuff', 'Woop Woop Woop Woop. Derp Derp Derp Derp. DOOOOOOOOOOOOOO', 12);
  
INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId)
  VALUES ('Buckles', '123-356-7879', 'Robotic Industries.', 'Basically going to take over the world. You are either with us or against us.',11);
  
/* projects Table Commands */
INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId, teamId)
  VALUES ('MA', 'Gemini', 'We are going to be doing super awesome stuff. Our project is going to be the next Facebook!', 'Java<br/>MySQL', 4, 5, 1);
  
INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId, teamId)
  VALUES ('MA', 'McLovin', 'We are going to be doing super awesome stuff. Our project is going to be the next Twitter!', 'PHP<br/>MySQL', 3, 5, 2);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId, teamId)
  VALUES ('MA', 'Awesomesauce', 'We are going to be doing super awesome stuff. Our project is going to be the next World of Warcraft!', 'C#<br/>MySQL', 2, 5, 3);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('PR', 'EPIC MEAL TIME', 'We are going to be doing super awesome stuff. Our project is going to be the next Wordpress!', 'Drupal<br/>MySQL', 1, 5);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('PR', 'EPIC MEAL TIMEz', 'We are going to be doing super awesome stuffb. Our project is going to be the next Wordpress! JIBERISH WOOO', 'Drupal<br/>MySQL, BUTTER', 2, 5);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('PR', 'EPIC MEAL TIMEH', 'We are going to be doing super awesome stuffz. Our project is going to be the next Wordpress! WOOP DERP', 'Drupal<br/>MySQL, MORE DERP, POPCORN', 3, 5);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('PA', 'ZEEPIDY DO DA DAY', 'We are going to be doing super awesome stuff. Our project is going to be the next Wordpress!', 'Drupal<br/>MySQL', 5, 5);
  
INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('PA', 'WOOOOOOOOOOO', 'We are going to be doing super awesome stuff. Our project is going to be the next Wordpress!', 'Drupal<br/>MySQL', 5, 5);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId) VALUES ('AV', 'Something', 'I have given up on the whole coming up with information part.', 'Java<br/>MySQL<br/>Apache', 4);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId)
  VALUES ('PE', 'SUPER HELLO WORLD', 'We are going to be doing super awesome stuff. Our project is going to be the next Wordpress!', 'Drupal<br/>MySQL', 6); 
  
INSERT INTO projects (status, prjName, description, prjConstraints, companyId) VALUES ('AV', 'Reddit', 'Were Reddit. We are the internet. We are assuming control. We are assuming control.', 'Java<br/>MySQL<br/>Apache', 6);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId)
  VALUES ('AV', 'Fruit Loops', 'Were bringing back Fruit Loops. Why? Because Fruit Loops are super awesome and kids these days do not know what they are missing.', 'Java<br/>MySQL<br/>Apache', 6);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId) VALUES ('AV', 'Molsdon Canadian', 'Were trying to make our beer not taste like crap. We want you to help us.', 'Java<br/>MySQL<br/>Apache', 5);

/* comments Table Commands */
INSERT INTO comments (projectId, commentDescription, commentStatus)
  VALUES (1, 'This is a comment. Your groups work sucked. I hope you all failed.', 1);
  
INSERT INTO comments (projectId, commentDescription, commentStatus)
  VALUES (2, 'JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI! JUMANJI!', 1);

INSERT INTO comments (projectId, commentDescription, commentStatus)
  VALUES (3, 'This is a comment. Your groups work was terrible. I hope you all failed.', 1);
  
INSERT INTO comments (projectId, commentDescription, commentStatus)
  VALUES (4, 'This is a comment. Your groups work was awesome. Have my babies.', 1);

 
/* milestone Table Commands */
INSERT INTO milestone (description, projectId)
  VALUES ('Design Underway', 1);
  
INSERT INTO milestone (description, projectId)
  VALUES ('Design Underway', 2);
  
INSERT INTO milestone (description, projectId)
  VALUES ('Design Underway', 3);
  
INSERT INTO milestone (description, projectId)
  VALUES ('Design Underway', 4);
  
INSERT INTO milestone (description, milestoneStatus, projectId)
  VALUES ('PID Completion', 'CO', 1);
  
INSERT INTO milestone (description, milestoneStatus, projectId)
  VALUES ('PID Completion', 'CO', 2);
  
INSERT INTO milestone (description, milestoneStatus, projectId)
  VALUES ('PID Completion', 'CO', 3);
  
INSERT INTO milestone (description, milestoneStatus, projectId)
  VALUES ('PID Completion', 'CO', 4);
  
/* teamprojectranking Table Command */
/* THESE ARE RANKINGS DONE BY TEAMS */
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (1, 4, 'T', 4, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (1, 3, 'T', 2, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (1, 2, 'T', 3, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (1, 1, 'T', 1, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (2, 4, 'T', 3, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (2, 3, 'T', 2, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (2, 2, 'T', 1, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (2, 1, 'T', 4, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (3, 4, 'T', 3, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (3, 3, 'T', 1, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (3, 2, 'T', 4, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (3, 1, 'T', 2, '122');
  
/* RANKING DONE MY COMPANIES */
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (1, 1, 'C', 1, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (2, 1, 'C', 2, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (3, 1, 'C', 3, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (1, 2, 'C', 2, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (2, 2, 'C', 1, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (3, 2, 'C', 3, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (1, 3, 'C', 2, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (2, 3, 'C', 3, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (3, 3, 'C', 1, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (1, 4, 'C', 1, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (2, 4, 'C', 3, '122');
  
INSERT INTO teamprojectranking (teamId, projectId, whoRanked, ranking, whenRanked)
  VALUES (3, 4, 'C', 2, '122');
  
  
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