<%-- 
    Document   : ProjectSetApproved
    Created on : Mar 12, 2012, 1:11:36 PM
    Author     : KepneR
--%>

<%@page import="javax.mail.Message"%>
<%@page import="seneca.projectManagement.utils.Email"%>
<%@page import="java.util.List"%>
<%@page import="seneca.projectManagement.entity.*" %>
<jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession" scope="session" />
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
    
    if(session.getAttribute("Second") == null) {
        response.sendRedirect("PendingProjects.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/pageStuff.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <title>Instructor</title>
    <script language="JavaScript">
        function collapse(x, y) {
            if(x.value == "Collapse") {
                document.getElementById(y).style.display = "none";
                x.value = "Expand";
            } else {
                document.getElementById(y).style.display = "block";
                x.value = "Collapse";
            }
        }
    </script>
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
          <div style="text-align: center;">
              <ul>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/HomeInstructor.jsp">Instructor<br/>Home</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/CreateTeam.jsp">Create<br/>Team<br/>Accounts</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/matching.jsp">Match<br/>Teams<br/>Projects</a></li>
		<li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/PendingProjects.jsp">Pending<br/>Projects</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/ApprovedProjects.jsp">Approved<br/>Projects</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/updateProjects.jsp">Change<br/>Project<br/>Status</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/manageTeamMembers.jsp">Manage<br/>Team<br/>Members</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/postNews.jsp">Post<br/>News</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/ViewClients.jsp">View<br/>All<br/>Clients</a><li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/ViewProjects.jsp">View<br/>All<br/>Projects</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Instructor/ViewTeams.jsp">View<br/>All<br/>Teams</a></li>
              </ul>
          </div>
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
        <td>
          <ul style="float: right;">
            <li class="normalLinks"><a href="/PRJ666-Implementation/pages/archived.jsp">Archived<br/>Projects</a></li>
            <li class="normalLinks"><a href="/PRJ666-Implementation/pages/About.jsp">About</a></li>
            <li class="normalLinks"><a href="/PRJ666-Implementation/pages/logout.jsp">Logout</a></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
            <hr>
            <%
                Projects p = (Projects) session.getAttribute("project");
                session.removeAttribute("project");
                
                p.setInstructorId(userBean.getLoggedUser().getUserId());
                p.setStatus("AP");
                if(!userBean.updateProject(p)) {
                    out.print("An unexpected error has occured while updating the project!");
                } else {
                  Email emailer = new Email();
                  Accounts c = userBean.getAccount(userBean.getCompanyByID(p.getCompanyId()).getUserId()),
                           in = userBean.getLoggedUser();
                  
                  emailer.addRecipient(Message.RecipientType.TO, c.getUserEmail());
                  emailer.sendEmail(in.getUserEmail(), "Seneca Project Management - Project Approved", 
                    "Greetings,\n\nYour project, " + p.getPrjName() + " has been approved! Soon it will be available for teams to "
                    + "be matched with. You will receive additional notification when this happens.\n\n- " + in.getUserFName() + " " + in.getUserLName());
                  session.setAttribute("approveSuccess", "Project " + p.getPrjName() + " has been approved!");
                }
            %>
        </td>
      </tr>             
    </table>
  </body>
</html>
