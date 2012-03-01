<%-- 
    Document   : processTeam
    Created on : Jan 26, 2012, 8:36:36 PM
    Author     : matthewschranz
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page
  import="seneca.projectManagement.utils.CryptoUtil,
          seneca.projectManagement.entity.*"
  language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
  
  <jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession"
               scope="session" />
  <jsp:setProperty name="userBean" property="*" />
  
<%
if ("true".equals(request.getParameter("publishTeamPage"))){
  // Team Members
  String[] tmFName = request.getParameterValues("tmFName"),
           tmLName = request.getParameterValues("tmLName"),
           tmDesc = request.getParameterValues("tmDesc"),
           tmEmail = request.getParameterValues("tmEmail");
  
  // Team Leader 
  String tlFName = request.getParameter("tlFName"),
         tlLName = request.getParameter("tlLName"),
         tlDesc = request.getParameter("tlDesc"),
         tlEmail = request.getParameter("tlEmail");
  
  // Team Fields
  String teamDesc = request.getParameter("teamDescription"),
         teamCons = request.getParameter("teamConstraints"),
         teamName = request.getParameter("teamName");

  String emails = "";
  emails = tlEmail + ";";
  
  for(int i = 0, len = tmEmail.length; i < len; i++){
    emails += tmEmail[i] + ";";
  }
  
  Teams team = userBean.getTeam();
  
  
  if (team != null){
    
      Teammember teamMember = userBean.getLeader(team.getTeamId());
      teamMember.setDescription(tlDesc);
      teamMember.setFirstName(tlFName);
      teamMember.setLastName(tlLName);
      teamMember.setEmail(tlEmail);
      
      
      if (userBean.updateMember( teamMember )) {
        for (int i = 0, len = tmFName.length; i < len;){
          teamMember = new Teammember();
        
          teamMember.setDescription(tmDesc[i]);
          teamMember.setEmail(tmEmail[i]);
          teamMember.setTeamId(team.getTeamId());
          teamMember.setFirstName(tmFName[i]);
          teamMember.setLastName(tmLName[i]);
          teamMember.setTeamLeader(0);
          
          if ( userBean.addMember( teamMember ) ){
            i++;
          }
          else {
            session.setAttribute("errors", "Error. Team Member could not be added.");
            response.sendRedirect("../Team/publishTeamPage.jsp");
          }
        }
      }
      else {
        session.setAttribute("errors", "Error. Team Leader could not be updated.");
        response.sendRedirect("../Team/publishTeamPage.jsp");
      }
    
    team.setTeamDescription(teamDesc);
    team.setTeamConstraints(teamCons);
    team.setTeamName(teamName);
    team.setTeamEmail(emails);
    team.setHasRegistered(1);
    
    if ( userBean.updateTeam( team ) ){
      response.sendRedirect("../Team/teamHome.jsp");
    }
    else {
      session.setAttribute("errors", "Error. Team Account could not be updated.");
      response.sendRedirect("../Team/publishTeamPage.jsp");
    }
  }
  else {
    session.setAttribute("errors", "Error. Team Account could not be found.");
    response.sendRedirect("../Team/publishTeamPage.jsp");
  }
}
else if ("true".equals(request.getParameter("editTeamPage"))) {
  String[] tmDescs = request.getParameterValues("id_tmDesc"),
           tmImages = request.getParameterValues("id_tmImage"),
           tmEmails = request.getParameterValues("id_tmEmail"),
           tmLNames = request.getParameterValues("id_tmLName"),
           tmFNames = request.getParameterValues("id_tmFName");
  
  String tLogo = request.getParameter("id_tLogo"),
         tCons = request.getParameter("id_tCons"),
         tDesc = request.getParameter("id_tDesc"),
         tName = request.getParameter("id_tName"),
         tlFName = request.getParameter("id_tlFName"),
         tlLName = request.getParameter("id_tlLName"),
         tlEmail = request.getParameter("id_tlEmail"),
         tlImage = request.getParameter("id_tlImage"),
         tlDesc = request.getParameter("id_tlDesc"),
         tEmail;
  
  // Team Validation
  if(tName.isEmpty() || tName.length() > 20){
    session.setAttribute("tName", "Error. Team Name can not be empty or greater than 20 characters.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }
  else if(tDesc.isEmpty() || tDesc.length() > 400){
    session.setAttribute("tDesc", "Error. Team Description can not be empty or greater than 400 characters.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }
  else if(tCons.isEmpty() || tCons.length() > 120){
    session.setAttribute("tCons", "Error. Team Constrains can not be empty or greater than 120 characters.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }
  else if(tLogo.isEmpty()){
    session.setAttribute("tLogo", "Error. Teamd Logo location can not be empty.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }
  
  // Team Leader Validation
  if(!tlFName.matches("[A-Za-z\\s]{3,15}")){
    session.setAttribute("tlFName", "Error. Must be only alphanumeric and between 3 and 15 characters in length.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }
  else if(!tlLName.matches("[A-Za-z\\s]{3,15}")){
    session.setAttribute("tlLName", "Error. Must be only alphanumeric and between 3 and 15 characters in length.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }
  else if(!tlEmail.matches("[\\w\\+\\-\\._]+(@learn.senecac.on.ca|@senecacollege.ca)")){
    session.setAttribute("tlEmail", "Error. Must end with @learn.senecac.on.ca or @senecacollege.ca");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }
  else if(tlImage.isEmpty()){
    session.setAttribute("tlImage", "Error. Team Leader Image can't be empty.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }
  else if(tlDesc.isEmpty() || tlDesc.length() > 250){
    session.setAttribute("tlDesc", "Error. Can't be empty or greater than 250 characters.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }

  // Team Member First Name Validation
  Pattern p = Pattern.compile("[A-Za-z\\s]{3,15}");
  Matcher m;
  
  for(int i = 0, len = tmFNames.length; i < len; i++){
    m = p.matcher(tmFNames[i].toString());
    if(!m.matches()){
      session.setAttribute("tmFName" + i, "Error. Must be only alphanumeric and between 3 and 15 characters in length.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
    }
  }
  
  // Team Member Last Name Validation
  for(int i = 0, len = tmLNames.length; i < len; i++){
    m = p.matcher(tmLNames[i].toString());
    if(!m.matches()){
      session.setAttribute("tmLName" + i, "Error. Must be only alphanumeric and between 3 and 15 characters in length.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
    }
  }
  
  // Team Member Email Validation
  p = Pattern.compile("[\\w\\+\\-\\._]+(@learn.senecac.on.ca|@senecacollege.ca)");
  for(int i = 0, len = tmEmails.length; i < len; i++){
    m = p.matcher(tmEmails[i].toString());
    if(!m.matches()){
      session.setAttribute("tmEmail" + i, "Error. Email must end in @learn.senecac.on.ca or @senecacollege.ca .");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
    }
  }
  
  // Team Member Images Validation
  for(int i = 0, len = tmImages.length; i < len && tmImages[i] != null; i++){
    System.out.println("in for loop");
    if(tmImages[i].isEmpty()){
      session.setAttribute("tmImages" + i, "Error. Must not be empty.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
    }
  }

  // Team Member Desc Validation
  for(int i = 0, len = tmDescs.length; i < len; i++){
    if(tmDescs[i].isEmpty() || tmDescs[i].length() > 250){
      session.setAttribute("tmDesc" + i, "Error. Can't be empty or greater than 250 characters.");
      %>
      <jsp:forward page="../Team/editTeamPage.jsp" />
      <%
    }
  }
  
  tEmail = tlEmail + ";";
  for(int k = 0, len = tmEmails.length; k < len; k++){
    tEmail += (tmEmails[k] + ";");
  }
  
  Teams team = userBean.getTeam();
  List<Teammember> members = userBean.getAllTeamMembers( team.getTeamId() );
  team.setTeamConstraints(tCons);
  team.setTeamDescription(tDesc);
  team.setTeamEmail(tEmail);
  team.setTeamLogo(tLogo);
  team.setTeamName(tName);
  
  if(userBean.updateTeam(team)){
    System.out.println("Updated the team");
    Teammember leader = userBean.getLeader(team.getTeamId());
    leader.setDescription(tlDesc);
    leader.setFirstName(tlFName);
    leader.setLastName(tlLName);
    leader.setMemberImage(tlImage);
    leader.setEmail(tlEmail);
    
    if(userBean.updateMember(leader)){
      System.out.println("Updated the leader");
      
      for(int i = 0, len = tmFNames.length; i < len; i++){
        leader = members.get(i);
        
        leader.setFirstName(tmFNames[i]);
        leader.setLastName(tmLNames[i]);
        leader.setDescription(tmDescs[i]);
        leader.setEmail(tmEmails[i]);
        leader.setMemberImage(tmImages[i]);
        
        if(!userBean.updateMember(leader)){
          session.setAttribute("errors", "Error. Failed to update a team member.");
          %>
          <jsp:forward page="../Team/editTeamPage.jsp" />
          <%
        }
      }
      session.setAttribute("editSuccess", "You successfully updated your Team Page! WOOOOHOOOOO!");
      %>
      <jsp:forward page="../Team/teamHome.jsp" />
      <%
    }
    else {
      session.setAttribute("errors", "Error. Failed to update the Team Leader.");
      %>
      <jsp:forward page="../Team/editTeamPage.jsp" />
      <%
    }
  }
  else {
    session.setAttribute("errors", "Error. Failed to update the team.");
    %>
    <jsp:forward page="../Team/editTeamPage.jsp" />
    <%
  }
}
%>
