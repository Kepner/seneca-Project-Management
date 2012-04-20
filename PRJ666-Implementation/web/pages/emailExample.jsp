<%-- 
    Document   : emailExample
    Created on : Feb 18, 2012, 2:01:06 PM
    Author     : matthewschranz
--%>
<%@page import="javax.mail.Message"%>
<%@page import="seneca.projectManagement.utils.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  // You need to create a new email each time, since the old message attribute will contain
  // previous To addresses
  Email emailer = new Email();
  emailer.addRecipient(Message.RecipientType.TO, "schranz.m@gmail.com");
  emailer.sendEmail( "matthew.schranz@senecacollege.ca",
          "Test Email", "This email is a test from the BEAM Solutions PRJ666 project"
          + " using an outside email as the recipient.");
  
  emailer = new Email();
  emailer.addRecipient(Message.RecipientType.TO, "mjschranz@learn.senecac.on.ca");
  emailer.sendEmail( "matthew.schranz@senecacollege.ca",
          "Test Email", "This email is a test from the BEAM Solutions PRJ666 project"
          + "using an @learn.senecac.on.ca as the recipient.");
  
  emailer = new Email();
  emailer.addRecipient(Message.RecipientType.TO, "matthew.schranz@senecacollege.ca");
  emailer.sendEmail( "emile.ohan@senecacollege.ca",
          "Test Email", "This email is a test from the BEAM Solutions PRJ666 project"
          + "using an @senecacollege.ca as the recipient.");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Email Example</title>
  </head>
  <body>
    <h3>You sent an email to mjschranz@learn.senecac.on.ca from matthew.schranz@senecacollege.ca.</h3>
    <h3>You sent an email to schranz.m@gmail.com from matthew.schranz@senecacollege.ca.</h3>
    <h3>You sent an email to matthew.schranz@senecacollege.ca from emile.ohan@senecacollege.ca.</h3>
  </body>
</html>
