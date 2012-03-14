<%-- 
    Document   : ProjectDetails
    Created on : Mar 13, 2012, 11:06:04 PM
    Author     : matthewschranz
--%>

<%@page import="seneca.projectManagement.utils.ProjectSorting"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8" import="seneca.projectManagement.entity.*"%>
<%
    if(userBean.isLogged() == true && userBean != null) {
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRJ566 - Available Project Details</title>
    </head>
    <body>
    <table> 
      <tr>
        <td colspan="2">
          <table width="100%">
            <tr>
              <td width="402" style="background-image: url('../resources/images/header_left.jpg'); background-repeat: no-repeat;">&nbsp;</td>
              <td style="background-image: url('../resources/images/header_bg.jpg'); background-repeat: repeat;" width="800">
                <a href="/PRJ666-Implementation/pages/Home.jsp" style="color: black;"><center><h2>WELCOME TO PRJ566<br/> Project Planning and Management</h2></center></a>
              </td>
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
            <li><a href="/PRJ666-Implementation/pages/Team/teamHome.jsp">Team<br/>Home</a></li>
		        <li><a href="/PRJ666-Implementation/pages/Team/manageTeamPage.jsp">Manage<br/>Team<br/>Page</a></li>
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
                <%
                    String s = request.getParameter("Project");
                    Projects p = null;
                    try {
                        p = userBean.getProject(new Integer(s));
                    } catch (Exception e) {}
                    if(p == null)
                        return;
                    Company c = userBean.getCompanyByID(p.getCompanyId());
                %>
                <h1><%= p.getPrjName() %> Project Details</h1>
                <form name="form1">
                <div style="width: 900px">
                    <div style='font-weight: bold; color: white; background-color: #6F93C9; padding: 5px;'>
                        <div style="float: left">Project Information:</div>
                        <div style="clear: both"></div>
                    </div>
                    <div style='background-color: skyblue; padding: 10px' id="_0">
                        <div style="float: left; width: 150px"><b>Project Name:</b></div>
                            <div style="float: left; width: 730px"><%= p.getPrjName() %></div>
                            <div style="clear: both"></div>
                        <div style="float: left; width: 150px"><b>Description:</b></div>
                            <div style="float: left; width: 730px"><%= p.getDescription() %></div>
                            <div style="clear: both"></div>
                        <div style="float: left; width: 150px"><b>Constraints:</b></div>
                            <div style="float: left; width: 730px"><%= p.getPrjConstraints() %></div>
                            <div style="clear: both"></div>
                    </div>
                </div>
                </form>
        </td>
      </tr>          
    </table>
  </body>
</html>
