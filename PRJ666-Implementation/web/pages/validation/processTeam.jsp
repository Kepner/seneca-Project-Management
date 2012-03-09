<%-- 
    Document   : processTeam
    Created on : Jan 26, 2012, 8:36:36 PM
    Author     : matthewschranz
--%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
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
else if (request.getParameter("editTeamInfo") != null){
  String tDesc = request.getParameter("tDesc"),
         tLogo = request.getParameter("tLogo"),
         tName = request.getParameter("tName"),
         tCons = request.getParameter("tCons");
  
  Teams t = userBean.getTeam();
  t.setTeamLogo(tLogo);
  t.setTeamConstraints(tCons);
  t.setTeamName(tName);
  t.setTeamDescription(tDesc);
  
  if(!tName.matches("[A-Za-z0-9\\s]{1,20}")){
    session.setAttribute("editTeamFail", "Error. First Name must be only alphanumeric and between 1 and 20 characters in length.");
    session.setAttribute("editTeam", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
  else if(tLogo.isEmpty()){
    session.setAttribute("editTeamFail" , "Error. Image can not be empty.");
    session.setAttribute("editTeam", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
  else if(tDesc.isEmpty() || tDesc.length() > 400){
    session.setAttribute("editTeamFail", "Error. Description can't be empty or greater than 400 characters.");
    session.setAttribute("editTeam", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
  else if(tCons.isEmpty() || tCons.length() > 120){
    session.setAttribute("editTeamFail", "Error. Constraints can't be empty or greater than 120 characters.");
    session.setAttribute("editTeam", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
  else if(!userBean.updateTeam(t)){
    session.setAttribute("editTeamFail", "Error. Team couldn't successfully be saved to the database.");
    session.setAttribute("editTeam", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
  else{
    session.removeAttribute("editTeam");
    session.removeAttribute("editTeamFail");
    session.setAttribute("teamSuccess", "Successfully edited the team info.");
    response.sendRedirect("../Team/manageTeamPage.jsp");
  }    
}
else if (request.getParameter("editMemberInfo") != null) {
  String mDesc = request.getParameter("mDesc"),
         mImage = request.getParameter("mImage"),
         mEmail = request.getParameter("mEmail"),
         mLName = request.getParameter("mLName"),
         mFName = request.getParameter("mFName"),
         mId = request.getParameter("memberId"),
         mLeader = request.getParameter("teamLeader"),
         tEmail = "";
  
  Teams t = userBean.getTeam();
  Teammember m = new Teammember();
  m.setDescription(mDesc);
  m.setEmail(mEmail);
  m.setFirstName(mFName);
  m.setLastName(mLName);
  m.setMemberImage(mImage);
  m.setMemberId(Integer.parseInt(mId));
  m.setTeamId(t.getTeamId());
  m.setTeamLeader(Integer.parseInt(mLeader));
  
  if(!mFName.matches("[A-Za-z\\s]{3,15}")){
    session.setAttribute("editMemberFail", "Error. First Name must be only alphanumeric and between 3 and 15 characters in length.");
    session.setAttribute("editMember", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
  else if(!mLName.matches("[A-Za-z\\s]{3,15}")){
    session.setAttribute("editMemberFail", "Error. Last Name must be only alphanumeric and between 3 and 15 characters in length.");
    session.setAttribute("editMember", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
  else if(!mEmail.matches("[\\w\\+\\-\\._]+(@learn.senecac.on.ca|@senecacollege.ca)")){
    session.setAttribute("editMemberFail", "Error. Email must end in @learn.senecac.on.ca or @senecacollege.ca .");
    session.setAttribute("editMember", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
  else if(mDesc.isEmpty() || mDesc.length() > 250){
    session.setAttribute("editMemberFail", "Error. Description can't be empty or greater than 250 characters.");
    session.setAttribute("editMember", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
  else if(userBean.updateMember(m)) {
    System.out.println("updated member");
    List<Teammember> members = userBean.getAllMembers(t.getTeamId());
      
    for(int i = 0; i < members.size(); i++){
      m = members.get(i);
      tEmail += m.getEmail() + ";";
    }
      
    t.setTeamEmail(tEmail);
    userBean.updateTeam(t);
    session.removeAttribute("editMember");
    session.removeAttribute("editMemberFail");
    session.setAttribute("teamSuccess", "Successfully edited the info for " + m.getFirstName() + " " + m.getLastName() +".");
    response.sendRedirect("../Team/manageTeamPage.jsp");
  }
  else{
    session.setAttribute("editMemberFail", "Error. Member couldn't successfully be saved to the database.");
    session.setAttribute("editMember", "blahblah");
    response.sendRedirect("../Team/updateMember.jsp");
  }
}
else if(request.getParameter("createMilestone") != null){
  String mName = request.getParameter("milestoneName"),
         mDesc = request.getParameter("milestoneDescription"),
         mStatus = request.getParameter("milestoneStatus"),
         mDate = request.getParameter("milestoneDate");
  
  DateFormat f = new SimpleDateFormat("MM/dd/yyyy");
  Date d = new Date();
  
  try{
    System.out.println("in date parse");
    d = (Date) f.parse(mDate);
  }
  catch(ParseException e){
    d = null;
  }
  
  Teams team = userBean.getTeam();
  Projects proj = userBean.getTeamProject(team.getTeamId());
  
  Milestone milestone = new Milestone();
  milestone.setDescription(mDesc);
  milestone.setDueDate(d);
  milestone.setMilestoneName(mName);
  milestone.setMilestoneStatus(mStatus);
  milestone.setProjectId(proj.getProjectId());
  
  if(!mName.matches("[A-Za-z\\s]{7,70}")){
    session.setAttribute("createErrors", "Error. Milestone name must be between 7 and 70 alphanumeric characters.");
    session.setAttribute("create", "sum");
    response.sendRedirect("../Team/updateMilestone.jsp");  
  }
  else if(!mDesc.matches("[A-Za-z\\s.]{10,125}")){
    session.setAttribute("createErrors", "Error. Milestone description must be between 10 and 125 alphanumeric characters.");
    session.setAttribute("create", "sum");
    response.sendRedirect("../Team/updateMilestone.jsp"); 
  }
  else if(d == null){
    session.setAttribute("createErrors", "Error. Milestone date must be in MM/DD/YYYY format.");
    session.setAttribute("create", "sum");
    response.sendRedirect("../Team/updateMilestone.jsp");
  }
  // Date Validation
  else if(d.before(new Date())){
    session.setAttribute("createErrors", "Error. Milestone date can't be set to the past.");
    session.setAttribute("create", "sum");
    response.sendRedirect("../Team/updateMilestone.jsp");
  }
  else if(!userBean.newMilestone(milestone)){
    session.setAttribute("createErrors", "Error. Milestone was not successfully added.");
    session.setAttribute("create", "sum");
    response.sendRedirect("../Team/updateMilestone.jsp");
  } 
  else {
    session.setAttribute("milestoneSuccess", "Milestones successfully created.");
    session.removeAttribute("create");
    session.removeAttribute("createErrors");
    response.sendRedirect("../Team/manageMilestones.jsp");
  }
}
else if(request.getParameter("editMilestone") != null){
  System.out.println("in edit");
  String mName = request.getParameter("milestoneName"),
           mDesc = request.getParameter("milestoneDescription"),
           mDate = request.getParameter("milestoneDate"),
           mStatus = request.getParameter("milestoneStatus"),
           mId = request.getParameter("milestoneId");
  
  DateFormat f = new SimpleDateFormat("MM/dd/yyyy");;
  Date d = (Date) f.parse(mDate);
  
  Milestone m = new Milestone();
  Teams team = userBean.getTeam();
  Projects proj = userBean.getTeamProject(team.getTeamId());
  
  m.setDescription(mDesc);
  m.setDueDate((Date) f.parse(mDate));
  m.setMilestoneId(Integer.parseInt(mId));
  m.setMilestoneStatus(mStatus);
  m.setMilestoneName(mName);
  m.setProjectId(proj.getProjectId());
  
  // Name Validation
  if(!mName.matches("[A-Za-z\\s]{7,70}")){
    session.setAttribute("editErrors", "Error. Milestone name must be between 7 and 70 alphanumeric characters.");
    session.setAttribute("mId", mId);
    session.setAttribute("edit", "whatever");
    response.sendRedirect("../Team/updateMilestone.jsp");
  }
  
  // Description Validation
  else if(!mDesc.matches("[A-Za-z\\s.]{10,125}")){
    session.setAttribute("editErrors", "Error. Milestone description must be between 10 and 125 alphanumeric characters.");
    session.setAttribute("mId", mId);
    session.setAttribute("edit", "whatever");
    response.sendRedirect("../Team/updateMilestone.jsp");     
  }
  
  // Date Validation
  else if(d.before(new Date())){
    session.setAttribute("editErrors", "Error. Milestone date can't be set to the past.");
    session.setAttribute("mId", mId);
    session.setAttribute("edit", "whatever");
    response.sendRedirect("../Team/updateMilestone.jsp");           
  }   
  else if(!userBean.updateMilestone(m)){
    session.setAttribute("editErrors", "Error. Milestone couldn't be updated.");
    session.setAttribute("mId", mId);
    session.setAttribute("edit", "whatever");
    response.sendRedirect("../Team/updateMilestone.jsp");
  }
  else {
    session.setAttribute("milestoneSuccess", "Milestones successfully edited.");
    session.removeAttribute("mId");
    session.removeAttribute("edit");
    response.sendRedirect("../Team/manageMilestones.jsp");    
  }     
}
%>
