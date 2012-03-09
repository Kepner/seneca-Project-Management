<%-- 
    Document   : teamHome
    Created on : Feb 1, 2012, 10:05:52 AM
    Author     : matthewschranz
--%>

<%@page import="java.util.List"%>
<%@page import="seneca.projectManagement.entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession"
               scope="session" />
  <jsp:setProperty name="userBean" property="*" />
<%
    if(userBean.isLogged() == true) {
        if(userBean.getLoggedUser().getUserRole().equals("TL")) {
          if(userBean.getTeam().getHasRegistered() != 1)
            response.sendRedirect("publishTeamPage.jsp");
        }
        else if(userBean.getLoggedUser().getAccountStatus() != 1) {
          session.setAttribute("Error", "Account has not been activated yet.");
          response.sendRedirect("/PRJ666-Implementation/pages/login.jsp");
        }
    }
    else {
        response.sendRedirect("/PRJ666-Implementation/pages/Home.jsp");
    }
%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/pageStuff.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <title>PRJ566 - Team Home</title>
  </head>
  <body>
    <table> 
      <tr>
        <td colspan="2">
          <table width="100%">
            <tr>
              <td width="402" style="background-image: url('../resources/images/header_left.jpg'); background-repeat: no-repeat;">&nbsp;</td>
              <td style="background-image: url('../resources/images/header_bg.jpg'); background-repeat: repeat;" width="800"><center><h2>WELCOME TO PRJ566<br/> Project Planning and Management</h2></center></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr valign="top">
        <td rowspan="5" align="left" width="200"> 
          <img src="../resources/images/seneca_logo.gif" title="Seneca logo"/>
          <br/>
          <img src="../resources/images/ICT_Logo.png" title="ICT Logo"/>
          <br/>
          <div style="margin:2px; width:200px;">
            <script type="text/javascript"> 
		          new TWTR.Widget( {
  		          version: 2,
  		          type: "profile",
  		          rpp: 5,
 		            interval: 6000,
  		          width: "auto",
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
            <li><a href="/PRJ666-Implementation/pages/Home.jsp">Home<br/>Page</a></li>
		        <li><a href="/PRJ666-Implementation/pages/Team/manageTeamPage.jsp">Manage<br/>Team Page</a></li>
            <li><a href="/PRJ666-Implementation/pages/Team/manageMilestones.jsp">Manage<br/>Project<br/>Milestones</a></li>
            <li><a href="/PRJ666-Implementation/pages/Team/viewProjects.jsp">View<br/>Projects</a></li>
		      </ul>
          <div style="float: right;">
            <ul>
              <li><a href="../logout.jsp">Logout</a></li>
            </ul>
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <div style="color: green;">
          <%
            if(session.getAttribute("editSuccess") != null) {
              out.println(session.getAttribute("editSuccess").toString());
              session.removeAttribute("editSuccess");              
            }
          %>
          </div>
          <br/>
          <%
            Teams team = userBean.getTeam();
            List<Teammember> members = userBean.getTeamMembers(team.getTeamId());
            Teammember leader = userBean.getLeader(team.getTeamId());
          %>
          <div style="width: 700px; background-color: #D5E7E9; padding: 5px;">
            <h3><%= team.getTeamName() %></h3>
          </div>
          <div style="width: 700px; padding: 5px;">
            <img src="<%= team.getTeamLogo() %>" alt="<%= team.getTeamName() %>" 
                 style="max-width: 230px; max-height: 180px;"/>
            <div>
              <a href="mailto:<%= team.getTeamEmail() %>" >Email The Team</a>
              <br/><br/>
              Description: <br/>
              <%= team.getTeamDescription() %>
              <br/><br/>
              Constraints: <br/>
              <%= team.getTeamConstraints() %>
            </div>
          </div>
          <div style="width: 700px; background-color: #D5E7E9; padding: 5px;">
            <h3>Team Leader</h3> 
          </div>
          <div style="width: 700px; padding: 5px;">
            <img src="<%= leader.getMemberImage() %>" alt="<%= leader.getFirstName() + " " + leader.getLastName() %>"
                 style="max-width: 450px; max-height: 300px;"/>
            <div>
              Name: <%= leader.getFirstName() + " " + leader.getLastName() %>
              <br/>
              Email: <%= leader.getEmail() %>
              <br/> <br/>
              Description: <br/>
              <%= leader.getDescription() %>
            </div>
          </div>
          <div style="width: 700px; background-color: #D5E7E9; padding: 5px;">
            <h3>Team Members</h3> 
          </div>
          <%
            for(int i = 0, len = members.size(); i < len; i++){
              leader = members.get(i);
          %>
          <div style="width: 700px; padding: 5px;">
            <img src="<%= leader.getMemberImage() %>" alt="<%= leader.getFirstName() + " " + leader.getLastName() %>"
                 style="max-width: 450px; max-height: 300px;"/>
            <div>
              Name: <%= leader.getFirstName() + " " + leader.getLastName() %>
              <br/>
              Email: <%= leader.getEmail() %>
              <br/> <br/>
              Description: <br/>
              <%= leader.getDescription() %>
            </div>
          </div>
          <% } %>
        </td>
      </tr>
    </table>
  </body>
</html>
