<%-- 
    Document   : changeProjectStatus
    Created on : Mar 22, 2012, 10:02:24 PM
    Author     : matthewschranz
--%>

<%@page import="java.util.Calendar"%>
<%@page import="seneca.projectManagement.entity.Projects"%>
<%@page import="seneca.projectManagement.entity.Accounts"%>
<jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession" scope="session" />
<jsp:setProperty name="userBean" property="*" />
<%
    if(userBean.isLogged() == true && userBean != null) {
        if(userBean.getLoggedUser().getUserRole().equals("IN") == false) {
            session.setAttribute("Error", "You don't have permission to access the instructor page.");
            response.sendRedirect("/PRJ666-Implementation/pages/login.jsp");
        }
    }
    else {
        response.sendRedirect("/PRJ666-Implementation/pages/Home.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/pageStuff.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <title>Instructor - Update Project</title>
  </head>
  <body>
    <table> 
      <tr>
        <td width="355px" style="background-image: url('../resources/images/header_left.jpg'); background-repeat: no-repeat;">&nbsp;</td>
        <td width="900px" style="background-image: url('../resources/images/header_bg.jpg'); background-repeat: repeat;">
          <a href="/PRJ666-Implementation/pages/Home.jsp" style="color: black;"><center><h2>WELCOME TO PRJ566<br/> Project Planning and Management</h2></center></a>
        </td>
      </tr>
      <tr valign="top">
        <td rowspan="5" align="left" width="200"> 
          <img src="../resources/images/seneca_logo.gif" title="Seneca logo"/>
          <br/>
          <img src="../resources/images/ICT_Logo.png" title="ICT Logo"/>
          <br/>
          <%
          if(userBean != null) {
            if(userBean.isLogged() == true) {
              Accounts temp_a = userBean.getLoggedUser();
              out.println("<hr width='95%' align='left'/>");
              out.print("Hello Instructor, " + temp_a.getUserFName() + " " + temp_a.getUserLName());
              out.println("<hr width='95%' align='left'/>");
            }
          }
          %>
          <div style="margin:2px; width:350px;">
            <script type="text/javascript"> 
		          new TWTR.Widget( {
  		          version: 2,
  		          type: "profile",
  		          rpp: 5,
 		            interval: 6000,
  		          width: 350,
  		          height: 300,
  		          theme: {
    		          shell: {
      		          background: "#d5e7e9",
      		          color: "#000000"
    		          },
    		          tweets: {
      		          background: "#fffaff",
     		            color: "#000000",
      		          links: "#0772eb"
    		          }
  		          },	
  		          features: {
    		          scrollbar: false,
    		          loop: false,
    		          live: false,
    		          hashtags: true,
    		          timestamp: true,
    	    	      avatars: false,
    		          behavior: "all"
  		          }
		          } ).render().setUser( "Seneca_College" ).start();
		        </script>
		      </div>
        </td>
        <td style="background-image: url('../resources/images/header_bg.jpg'); height: 1px;">
          <ul>
            <li><a href="/PRJ666-Implementation/pages/Instructor/HomeInstructor.jsp">Instructor<br/>Home</a></li>
            <li><a href="/PRJ666-Implementation/pages/Instructor/CreateTeam.jsp">Create<br/>Team<br/>Accounts</a></li>
            <li><a href="/PRJ666-Implementation/pages/Instructor/matching.jsp">Match<br/>Teams<br/>Projects</a></li>
		        <li><a href="/PRJ666-Implementation/pages/Instructor/PendingProjects.jsp">Pending<br/>Projects</a></li>
            <li><a href="/PRJ666-Implementation/pages/Instructor/ApprovedProjects.jsp">Approved<br/>Projects</a></li>
            <li><a href="/PRJ666-Implementation/pages/Instructor/updateProjects.jsp">Change<br/>Project<br/>Status</a></li>
            <li><a href="/PRJ666-Implementation/pages/Instructor/manageTeamMembers.jsp">Manage<br/>Team<br/>Members</a></li>
            <li><a href="/PRJ666-Implementation/pages/Instructor/postNews.jsp">Post<br/>News</a></li>
            <li><a href="../logout.jsp">Logout</a></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
          <%
            String pId = request.getParameter("Project") != null ? request.getParameter("Project") : session.getAttribute("Project").toString();
            Projects p = userBean.getProject(new Integer(pId));
            System.out.println("got project");
            if(p.getStatus().equals("AP")){
              p.setStatus("AV");
              
              if(userBean.updateProject(p)){
                session.setAttribute("updateSuccess", "Successfully updated the status of project " + p.getPrjName() + ".");
                response.sendRedirect("updateProjects.jsp");
              }
              else {
                session.setAttribute("updateFail", "Updated failed. Please try changing it manually.");
                response.sendRedirect("updateProjects.jsp");
              }
            }
            else if(p.getStatus().equals("MA")){
              System.out.println(pId);
          %>
          <form action="../validation/processInstructor.jsp" method="post">
            <h3 class="title">Set Year and Semester for Implementation Date</h3>
            <div style="padding: 5px">
              <div style="float: left; width: 150px">Semester Period: </div>
              <div style="float: left">
                <select name="semesterPeriod">
                  <option value="0" selected>Select a Period</option>
                  <option value="FALL">Fall</option>
                  <option value="SUM">Summer</option>
                  <option value="WIN">Winter</option>
                </select>
              </div>
              <div style="clear: both"></div>
              <div style="float: left; width: 150px">Year: </div>
              <div style="float: left">
                <select name="year">
                  <option value="0">Select a Year</option>
                  <%
                    Calendar cal = Calendar.getInstance();
                    int year = 0;
                 
                    for(int i = 0; i < 5; i++){
                      year = cal.get(Calendar.YEAR) + i;
                      out.println("<option value='" + year + "'>" + year + "</option>");
                    }
                  %>
                </select>
              </div>
            </div>
            <%
              if(session.getAttribute("proceedFail") != null) {
                out.println("<br/><div style='color: red'>" + session.getAttribute("proceedFail") + "</div>");
                session.removeAttribute("proceedFail");
              }
            %>
            <br/>
            <input type="hidden" name="pId" value="<%= pId %>" />
            <input type="submit" name="proceedProject" value="Proceed the Project" />
          <%
            }
            else {
              out.println("Error. You obviously navigated to the page without going to Update Projects first. Click"
                      + "<a href='../Instructor/updateProjects.jsp'>this link</a> to go there.");  
            }
          %>
          </form>
        </td>
      </tr>             
    </table>
  </body>
</html>
