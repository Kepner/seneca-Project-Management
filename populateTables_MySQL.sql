/* password is 12345, Team Leader */
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Matthew', 'Schranz', 'mjschranz@learn.senecac.on.ca', 'PRJ566FALL2012_A1', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');

/* password is 12345, Team Leader */
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Victor', 'Tran', 'vvtran@learn.senecac.on.ca', 'PRJ566FALL2012_A2', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');

/* password is 12345, Team Leader */
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Noah', 'Gitalis', 'ngitalis@learn.senecac.on.ca', 'PRJ566FALL2012_A3', 'TL', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');

/* password is 12345, Company Rep */
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Megan', 'Reed', 'm.reed@sarifindustries.com', 'megan.reed', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo='); 

/* password is 12345, Company Rep */
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Netanya', 'Keitner', 'n.keitner@belltower.com', 'netanya.keitner', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo='); 

/* password is 12345, Company Rep */
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Jane', 'Smith', 'jane.smith@bakedtogo.com', 'jane.smith', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');

/* password is 12345, Company Rep */
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Daryl', 'Myers', 'daryl.myers@gmail.com', 'daryl.myers', 'CR', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');

/* password is 12345, SUPERVISOR */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Emile', 'Ohan', 'emile.ohan@senecac.on.ca', 'emile.ohan', 'SU', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, INSTRUCTOR */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Mark', 'Buchner', 'mark.buchner@senecac.on.ca', 'mark.buchner', 'IN', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');
  
/* password is 12345, ADMIN */  
INSERT INTO accounts (userFName, userLName, userEmail, userIdentifier, userRole, password) 
  VALUES ('Evan', 'Weaver', 'evan.weaver@senecac.on.ca', 'evan.weaver', 'AD', 'gyoODTfAfN0gNJZ7gSjN5hfp/eo=');


/* News Table Commands */
INSERT INTO news (postTitle, postText, instructorId)
  VALUES ('PRJ566 - Project Planning and Management','In this course students are required to select a project that involves developing a computer system. Students learn project management concepts while carrying out requirements gathering, analysis, design, and implementation planning for the identified system. Project management concepts learned include scope development and management, creation of work breakdown structures including task dependencies, and cost benefit analysis using return on investment and payback. Students create dialogue maps and mock-ups of user interfaces for their systems, and use a modeling tool to create detailed software models which they then go on to implement in PRJ666.', 9);

INSERT INTO news (postTitle, postText, instructorId)
  VALUES ('PRJ666 - Project Implementation', 'This is the final course in the systems\' stream in which students complete the development and implementation phase of a project. As part of a team, students will plan and manage the development of an actual system using project planning, system design, system implementation, and unit and system testing methodologies. Students will also integrate and apply the object-oriented concepts, tools and techniques learned in previous courses, and create appropriate documentation for the completed system.', 9);

/* Teams Table Commands */
INSERT INTO teams (teamEmail, teamName, teamConstraints, userId, teamDescription, teamLogo, hasRegistered)
VALUES ('asemionova1@learn.senecac.on.ca;mjschranz@learn.senecac.on.ca;edavlatian@learn.senecac.on.ca;bmcohen@learn.senecac.on.ca', 'BEAM Solutions','ASP.NET, C, C++, C#, Java, JavaScript, HTML, CSS, CL, Oracle SQL, MS SQL, HTML, xHTML, CSS, ASP.Net, CGI, AJAX', 1,'We are the team B(ryan)E(douard)A(nastasia)M(atthew) Solutions. Our place in the 5th semester of the Computer Programming and Analyst program gives us a broad base of knowledge. We all share the same passions in web programming which allow us to be focused in our efforts to produce the best system possible for your needs. We are confident that we have the education, potential and enthusiasm to be successful with your company and we would appreciate an opportunity to work on your project.','http://senecacprj566.files.wordpress.com/2011/05/beam_solutions.png?w=274&h=108', 1);
  
INSERT INTO teams (teamEmail, teamName, teamConstraints, userId, teamDescription, teamLogo, hasRegistered)
VALUES ('vvtran@learn.senecac.on.ca;acchung1@learn.senecac.on.ca;khabib@learn.senecac.on.ca;ctran13@learn.senecac.on.ca', 'Team Disarray','ASP.NET, C, C++, C#, Java, JavaScript, HTML, CSS, CL, Oracle SQL, MS SQL, HTML, xHTML, CSS, ASP.Net, CGI, AJAX', 2,'Are you tired of the everyman’s daily routine?<br/><br/>Try taking Team Disarray!  Clinical studies have shown that users taking a daily dose of Team Dissarray experience heightened senses and increased lifespan!','http://teamdisarray.files.wordpress.com/2011/05/disarray_b.jpg?w=640', 0);

INSERT INTO teams (teamEmail, teamName, teamConstraints, userId, teamDescription, teamLogo, hasRegistered)
VALUES ('ngitalis@learn.senecac.on.ca;smohammad8@learn.senecac.on.ca;jrshaw@learn.senecac.on.ca;trusu@learn.senecac.on.ca', 'Scope','ASP.NET, C, C++, C#, Java, JavaScript, HTML, CSS, CL, Oracle SQL, MS SQL, HTML, xHTML, CSS, ASP.Net, CGI, AJAX', 3,'Scope is a highly motivated crack-shot team of programmers currently undergoing semester 5 and 6 at Seneca college.<br/>Our team possesses a wide range of skills and technical knowledge including: web-scraping, memory hacking, client/server systems, Linux systems, and image manipulation.<br/>We are dedicated fast-learners and ready to adapt to any project!','http://senecacprj566.files.wordpress.com/2011/09/scope-logo3.png?w=640', 0);


/* Team Member Commands */
INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId, memberImage)
  VALUES ('Matthew', 'Schranz', 'mjschranz@learn.senecac.on.ca', 'Hello, my name is Matthew Schranz. I’m in my fifth semester in Seneca College’s Computer Programming and Analysis program. After spending my time in other programs figuring out what career path I wanted to take, I finally found one that has stuck. I’ve grown to enjoy programming a lot because of the challenge it provides me. I have always enjoyed learning how things I come across in life work: home construction, motor vehicles and of course electronics. Taking the CPA Diploma has allowed me to apply that passion towards building my own applications and eventually work on important applications for businesses today.', 1, 1, 'http://senecacprj566.files.wordpress.com/2011/05/photo-on-2011-05-02-at-14-43.jpg?w=230&h=180');

INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId, memberImage)
  VALUES ('Victor', 'Tran', 'vvtran@learn.senecac.on.ca', 'Victor Tran previously received his Video Game Design and Development Diploma from the International Academy of Design and Technology, and is currently in his 5th semester of Computer Programming and Analysis(Co-op) at Seneca College maintaining a 3.9GPA. From January 2010 to January 2011, Victor worked at the City of Vaughan, creating the Elections 2010 and By-Elections 2010 websites, while assisting in a variety of other projects that used various technologies like MS Access, VB.NET, and ASP.NET 3.5, and also created graphics for the City of Vaughan using Adobe Photoshop CS4, Illustrator CS4, and Flash CS4.<br/><br/>As an aspiring Video Game Developer, Victor attended Tojam with Squirrel Pancakes May 13-15, 2011 and completed a fully functioning game in 48 hours.', 1, 2, '');

INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId, memberImage)
  VALUES ('Noah', 'Gitalis', 'ngitalis@learn.senecac.on.ca', 'Noah is a hard working student currently undergoing semester 5 of the Computer Programming and Analysis(CPA) program. Though he had a bit of rocky start through the beginnings of his school life, once he enrolled in programming at Seneca it was clear that it was his calling.<br/><br/>This summer he was lucky enough to work as an intern at Gridcentric, where he added on to his programming repertoire with some practical knowledge, client/server systems, VM’s, Cloud Systems, Linux ELF’s and memory hacking.', 1, 3, '');

INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId, memberImage)
  VALUES ('Anastasia', 'Semionova', 'asemionova1@learn.senecac.on.ca', 'My name is Anastasia Semionova. I find programming very interesting and challenging, and my success in Seneca College, my GPA is 4.0 and I am awarded with President’s Honor List twice, shows that I have a remarkable potential in this field. Throughout my academic career I have developed strong computer programming skills in various languages (Java/J2EE, Visual C#, C, C++, HTML/CSS, JavaScript), databases (Oracle PL/SQL, MySQL, MS Access), and also I have acquired expertise in working with different operating systems (Windows XP/Vista, UNIX, Linux, AS/400). Currently I am having an internship in Canadian Tire Online team as a Java Developer where my major responsibilities are improving the existing features and adding new features, requested by business people, on the main Canadian Tire web page (canadiantire.ca). This work experience is helping me to reinforce and deepen my Java programming skills as well as to expand my problem solving skills and improve my communication skills. Also, my previous work experience, as a project coordinator and draftsperson, has allowed me to develop management, leadership and team working skills and demonstrate my ability to work under pressure to meet tight deadlines.', 0, 1, 'http://senecacprj566.files.wordpress.com/2011/05/anastasia_semionova1.jpg?w=250&h=250');

INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId, memberImage)
  VALUES ('Edouard', 'Davlatian', 'edavlatian@learn.senecac.on.ca', 'My name is Edouard Davlatian, I am currently in the 5th semester of the CPA program at Seneca College. In the past I have worked as a paid COOP student for Business Information Group (BIG) where I was a Web Technecian. I worked together with many different departments ranging from Publishing to Web development. During my time at BIG I worked with many technologies, the most prominent were: ASP.Net, XHTML, CSS, JavaScript, and MS SQL. I have also worked for DM&T Services where I was responsible for making changes to existing software and troubleshooting/debugging new software. Recently I worked for Beauty Voyage Salon and Spa where I was responsible for developing and maintaining a website. I was also responsible for the networking and computers at the business location.', 0, 1, 'http://senecacprj566.files.wordpress.com/2011/05/imag0052.png?w=150&h=112');

INSERT INTO teammember (firstName, lastName, email, description, teamLeader, teamId, memberImage)
  VALUES ('Bryan', 'Cohen', 'bmcohen@learn.senecac.on.ca', 'My name is Bryan Cohen and I am in the 5th semester at Seneca College. I find programming very interesting and fun ever since my first course with programming in high school. Throughout the years I have learned a variety of languages including C/C++, Java, xHTML/CSS, VB.NET, Perl, PHP, and am in the process of learning COBOL. I’ve extensively used Microsoft Visual Studio to aid in my endeavors. My operating system of choice is Windows, but I can comfortably use Linux or AS/400 as well. Lastly, I’ve worked with a variety of database systems that use Oracle, DB2, MySQL, and MS SQL. I am always eager for a challenge and to figure out the best way to get a system functioning properly.', 0, 1, 'http://senecacprj566.files.wordpress.com/2011/05/bryan.jpg?w=172&h=160');

/* company Table Commands */
INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId)
  VALUES ('Sarif Industries', '111-537-7421', 'Biotechnology', 'Sarif Industries is a moderately sized but extremely advanced biotechnology company based in North America. Founded by the philanthropist David Sarif in 2007 when he acquired a failing Detroit auto factory and re-purposed it for the automated manufacture of prosthetics. Sarif Industries specializes in the design and manufacture of advanced mechanical augmentations for human implantation.', 4);

INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId)
  VALUES ('Belltower Associates', '772-455-9000', 'Security Contractor', 'Founded by Roger St.John-Frolkes the company was incorporated in 1997 beginning life as a security consultant and close protection agency. The company is currently expanding into the Private Millitary field.', 5);

INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId)
  VALUES ('Baked To Go!', '905-775-8452', 'Baked Goods<br/>Catering', 'Founded by Jane Smith in 2005. Baked To Go! is a company that specializes in baked goods and catering.', 6);

INSERT INTO company (companyName, companyPhone, businessAreas, companyDescription, userId) 
  VALUES ('Big Dog Delivery', '416-123-5566', 'Shipping', ' Founded by Daryl Myers in 2011. Big Dog Delivery is a company that specializes in shipping of packages that are very large.', 7);

 /* projects Table Commands */
INSERT INTO projects (status, prjName, description, prjConstraints, companyId)
  VALUES ('PE', 'Secure Web Service', 'This web service will be used to upload confidential files to our file servers. The web service should be able to handle any unencrypted file that when uploaded will be encrypted using our cloud based encrypting service to our file servers.<br/>The web service will have a front end web page that will be accessible from any of the major web browsers as well as mobile devices. Mobile devices should be able to access either through their respective mobile browsers or through dedicated applications. Targeted mobile devices will be running the latest Apple iOS operating system and the latest Android operating system.<br/>Access to the front end web site will be limited to our users. A dummy database has been set up for testing purposes. Users must have a valid user name, password, and authenticator code. The authenticator code will be provided to users via a device only available to Sarif Industries employees and contractors. A dummy service will be provided for testing purposes in order to receive authentication codes.<br/>The cloud based encrypting service api details are available in the attached project file link. When the project is approved and matched to a team files we be uploaded with information regarding the dummy database and authenticator service.', 'Must use HTTPS', 1);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('AV', 'Information Web Site', 'This website will use the latest in HTML5 technologies to display information about our current consumer grade products as well as allow users to see and explore the products through cutout views and other really cool  things like rotating them around and such.<br/>This website will also allow Users to get in contact with a customer service rep and chat in real time via the web. The customer service reps will be able to log in to the website and make notes/comments and if a user decides to make a purchase create an order. This order will contain client information that will be passed onto our sales reps that will then call the client formalize any orders.<br/>The orders will be passed to an existing service that is already in place.', 'ASP.Net', 1, 9);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('AV', 'Work Hours Website', 'The website will allow our employees to log their hours of work. The website should be accessible from all the major web browsers. As well as the mobile browser for the Android operating system present in version 4.0.1+.<br/>The employees would log into the website and be able to add the hours for which they worked in the current week. They will also be able to specify the category of the work completed as well as a comment describing what they did.<br/>A supervisor user would be able to view detailed reports with regards to the employees they are responsible for. Supervisors will also be able to view detailed information about each employee.<br/>An admin user should be able to create new employee accounts and link them to the supervisor responsible.<br/>Samples of the reports have been added as a project file as well as sample account information for employees, supervisors and admins.', 'ASP.net<br/>SQL Server 2008', 2, 9);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('PA', 'Tablet Application', 'This application will run on Android 3.0.1+ Operating Systems and will be used on Samsung Galaxy Tab 10.1 devices. The application will be allow a user to log in to an existing service and then retrieve operation directives.<br/>The retrieved operation directives will display target information which may consist of 1 or more photos as well as any pertinent information. Depending on the kind of operation certain data will be present.<br/>Please see the images attached  of possible screens as well as sample operations data.', 'Must use secure connections.', 2, 9);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId)
  VALUES ('PE', 'Phone App', 'This application will run on Android 4.0.1+ Operating Systems and will be used on a variety of devices. The application will be able to receive notifications from an existing web service. This information will then be displayed to the user.<br/>Depending on the notification type an alert will play(sound, vibration, silent, etc..) as well as information will be promptly displayed on screen. Depending on the operation type specific information will be more pertinent and as such will be easily viewable.<br/>Sample screens and data is provided.', 'Must use secure connections.', 2);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('AV', 'Sales Website', 'Currently our website only is used as an information source for our products and all orders are done either in person or by phone. We would like to grow our potential clientele by opening up an online store that would allow web visitors to make purchases online for delivery to their home.<br/>This store website will allow users to register an account and be able to order goods online for delivery.<br/>A sales rep account would allow a sales rep to log in and create orders through a form with ease for our current customers, these customers are already in a MySQL database as well as their order information. The user interface should allow for searching/listing of customers as well as the ability to recreate orders based on previous purchases for that client.<br/>Test data is provided in the attached file.', 'PHP<br/>MySQL', 3, 9);

INSERT INTO projects (status, prjName, description, prjConstraints, companyId, instructorId)
  VALUES ('PA', 'Tracking Website','Website that allows users to check their packages tracking information. Users will be provided with a tracking number that when entered into the system will show all the package information as well as access to the current location of the package.<br/>Each package is equipped with a GPS device that sends out its current coordinates every 30 minutes via wireless. These coordinates get sent to an existing web service that is integrated with our current systems. The tracking website will be able to access this web service and get the required information for out clients to be displayed in an easy to read manner.<br/>The package information will be stored in a MySQL database. A sample of the tracking information data is provided, as well as the web service information.', 'ASP.Net', 4, 9);


/* projectfile Table Commands */
INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Cloud Encryption', 'Information for our Cloud Based Encrypting service. File in encrypted, please email Megan Reed for encryption password.', 'http://dl.dropbox.com/u/19945944/SecureAPIFile.7z', 1);

INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Web Service Info', 'Information for our Web Service. File in encrypted, please email Megan Reed for encryption password.', 'http://dl.dropbox.com/u/19945944/SecureAPIFile2.7z', 2);

INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Sample Reports and Data', 'Report samples, and sample data for employees. File is encrypted please email Netanya for information.', 'http://dl.dropbox.com/u/19945944/SecureSamples.7z', 3);

INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Sample Pictures and data', 'Sample pictures data. File is encrypted please email Netanya for information.', 'http://dl.dropbox.com/u/19945944/SecurePicturesData.7z', 4);

INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Sample Pictures and data', 'Sample pictures data. File is encrypted please email Netanya for information.', 'http://dl.dropbox.com/u/19945944/SecurePicturesData2.7z', 5);

INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Sample Data', 'Sample client data for a MySQL database.', 'http://dl.dropbox.com/u/19945944/DATA.sql', 6);

INSERT INTO projectfile (fileName, fileDescription, theFile, projectId)
  VALUES ('Web Service info ', 'Information for the web service that handles GPS tracking. As well as sample data for packages and tracking information.', 'http://dl.dropbox.com/u/19945944/SampleDataWebService.7z', 7);

/* Comments Table Commands */
INSERT INTO comments (projectId, commentDescription, commentStatus)
  VALUES (4, 'Very nicely done. Got the project specifications right on the mark. I highly recommend this group!', 1);

INSERT INTO comments (projectId, commentDescription, commentStatus)
  VALUES (7, 'This is an interesting group. The idea they have was fresh and unique. Keep up the good work.', 1);





