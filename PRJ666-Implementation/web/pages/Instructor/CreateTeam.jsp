<%-- 
    Document   : CreateTeam
    Created on : Mar 12, 2012, 2:11:02 PM
    Author     : KepneR
--%>

<%@page import="seneca.projectManagement.utils.Validation"%>
<%@page import="seneca.projectManagement.entity.*"%>
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
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/pageStuff.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <title>Instructor</title>
  </head>
  <body>
    <table> 
      <tr>
        <td width="355px"style="background-image: url('../resources/images/header_left.jpg'); background-repeat: no-repeat;">&nbsp;</td>
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
            <h1>Create Team Account</h1>
            <form method="POST" action="newAccounts.jsp">
            <div style="width: 600px">
            <div style="padding: 5px; background-color: #D5E7E9">
                Account Information
            </div>
            <div style="padding: 5px">
                <div style="float: left; width: 150px">Section:</div>
                <div style="float: left">
                    <select name="id_section">
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="E">E</option>
                        <option value="F">F</option>
                        <option value="G">G</option>
                        <option value="H">H</option>
                    </select>
                </div>
                <div style="clear: both;"></div>
                <div style="float: left; width: 150px">First Name:</div>
                <div style="float: left">
                    <input type="text" name="id_fname" value="${param.id_fname}" />
                </div>
                    <% 
                        if(session.getAttribute("fname") != null) {
                            out.println("<div style='color: red; float: left; max-width: 395px; padding-left: 5px;'>* " 
                                    + session.getAttribute("fname").toString() + "</div>");
                            session.removeAttribute("fname");
                        }
                    %>
                <div style="clear: both"></div>
                <div style="float: left; width: 150px">Last Name:</div>
                <div style="float: left">
                    <input type="text" name="id_lname" value="${param.id_lname}" />
                </div>
                    <% 
                        if(session.getAttribute("lname") != null) {
                            out.println("<div style='color: red; float: left; max-width: 395px; padding-left: 5px;'>* " 
                                    + session.getAttribute("lname").toString() + "</div>");
                            session.removeAttribute("lname");
                        }
                    %>
                <div style="clear: both;"></div>
                <div style="float: left; width: 150px">Email:</div>
                <div style="float: left">
                    <input type="text" name="id_email" id="id_email" value="${param.id_email}" />
                </div>
                    <% 
                        if(session.getAttribute("email") != null) {
                            out.println("<div style='color: red; float: left; max-width: 395px; padding-left: 5px;'>* " 
                                    + session.getAttribute("email").toString() + "</div>");
                            session.removeAttribute("email");
                        }
                    %>
                <div style="clear: both"></div>
            </div>
            <div style="background-color: #D5E7E9; padding: 5px; text-align: right">
                <input type="submit" value="Create">
            </div>
            </div>
          </form>
        </td>
      </tr>             
    </table>
  </body>
</html>
