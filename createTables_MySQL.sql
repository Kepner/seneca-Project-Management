SET FOREIGN_KEY_CHECKS = 0;

/* DROP ALL TABLES */
DROP TABLE projectfile;
DROP TABLE teammember;
DROP TABLE comments;
DROP TABLE projects;
DROP TABLE teams;
DROP TABLE company;
DROP TABLE accounts;
DROP TABLE news;

CREATE TABLE accounts (
  userId int AUTO_INCREMENT PRIMARY KEY,
  userIdentifier varchar(25) NOT NULL UNIQUE,
  userFName varchar(16) NOT NULL,
  userLName varchar(16) NOT NULL,
  userEmail varchar(50) NOT NULL,
  userRole varchar(2) NOT NULL,
  password varchar(50) NOT NULL,
  accountStatus int DEFAULT 1
);

CREATE TABLE news (
  postId int AUTO_INCREMENT PRIMARY KEY,
  postDate TIMESTAMP DEFAULT NOW(),
  postTitle varchar(50) NOT NULL,
  postText TEXT NOT NULL,
  instructorId int NOT NULL,
  CONSTRAINT fk_InstructorId FOREIGN KEY (instructorId) REFERENCES accounts(userId)
);

CREATE TABLE teams (
  teamId int AUTO_INCREMENT PRIMARY KEY,
  teamEmail varchar(400) NOT NULL,
  teamStatus int DEFAULT 1,
  teamName varchar(20),
  teamConstraints varchar(120),
  teamDescription varchar(400),
  teamLogo varchar(200),
  projectId int,
  hasRegistered int DEFAULT 0,
  userId int NOT NULL,
  CONSTRAINT fk_TeamAccount FOREIGN KEY (userId) REFERENCES accounts (userId),
  CONSTRAINT fk_TeamProject FOREIGN KEY (projectId) REFERENCES projects (projectId) 
);

CREATE TABLE company (
  companyId int AUTO_INCREMENT PRIMARY KEY,
  companyName varchar(25) NOT NULL,
  companyPhone varchar(12) NOT NULL,
  businessAreas varchar(200),
  companyDescription varchar(600),
  userId int NOT NULL,
  CONSTRAINT fk_CompanyAccount FOREIGN KEY (userId) REFERENCES accounts (userId)
);

CREATE TABLE projects (
  projectId int AUTO_INCREMENT PRIMARY KEY,
  status varchar(2) NOT NULL,
  prjName varchar(20) NOT NULL UNIQUE,
  prjIdentifier varchar(25),
  description varchar(500) NOT NULL,
  prjConstraints varchar(250) NOT NULL,
  agreementDate TIMESTAMP DEFAULT NOW(),
  companyId int NOT NULL,
  teamId int UNIQUE,
  instructorId int,
  CONSTRAINT fk_CompanyId FOREIGN KEY (companyId) REFERENCES COMPANY (companyId),
  CONSTRAINT fk_TeamId FOREIGN KEY (teamId) REFERENCES teams (teamId),
  CONSTRAINT fk_InstructorId FOREIGN KEY (instructorId) REFERENCES accounts(userId)
);

ALTER TABLE teams ADD CONSTRAINT fk_ProjectId FOREIGN KEY (projectId) REFERENCES projects (projectId);

CREATE TABLE comments (
  commentId int AUTO_INCREMENT PRIMARY KEY,
  commentStatus INT DEFAULT 0,
  commentDescription varchar(500) NOT NULL,
  projectId INT NOT NULL,
  CONSTRAINT fk_CommentProjectId FOREIGN KEY (projectId) REFERENCES projects (projectId)
);

CREATE TABLE teammember (
  memberId int AUTO_INCREMENT PRIMARY KEY,
  firstName varchar(15) NOT NULL,
  lastName varchar(15) NOT NULL,
  email varchar(50) NOT NULL,
  memberImage varchar(300),
  description varchar(250),
  teamLeader INT DEFAULT 0,
  teamId INTEGER NOT NULL,
  CONSTRAINT fk_MemberTeamId FOREIGN KEY (teamId) REFERENCES teams (teamId)
);

CREATE TABLE projectfile (
  fileId int AUTO_INCREMENT PRIMARY KEY,
  fileName varchar(40) NOT NULL,
  fileDescription varchar(120) NOT NULL,
  theFile varchar(500) NOT NULL,
  projectId INT NOT NULL,
  CONSTRAINT fk_FileProjectId FOREIGN KEY (projectId) REFERENCES projects (projectId)
);

SET FOREIGN_KEY_CHECKS = 1;
