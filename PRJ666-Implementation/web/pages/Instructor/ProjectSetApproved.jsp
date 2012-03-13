<%-- 
    Document   : ProjectSetApproved
    Created on : Mar 12, 2012, 1:11:36 PM
    Author     : KepneR
--%>

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
        <td colspan="2">
          <table width="100%">
            <tr>
              <td width="402" style="background-image: url('../resources/images/header_left.jpg'); background-repeat: no-repeat;"></td>
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
          <%@include file="/pages/validation/showWhosLogin.jsp" %>
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
            <li><a href="InstructorHome.jsp">Instructor<br/>Home</a></li>
            <li><a href="CreateTeam.jsp">Create Team Accounts</a></li>
            <li><a href="#">Deactivate Team Accounts</a></li>
            <li><a href="#">Match<br/>Teams<br/>Projects</a></li>
		        <li><a href="PendingProjects.jsp">Pending<br/>Projects</a></li>
            <li><a href="ApprovedProjects.jsp">Approved<br/>Projects</a></li>
            <li><a href="#">Proceed Projects</a></li>
            <li><a href="../logout.jsp">Logout</a></li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
            <%
                Projects p = (Projects) session.getAttribute("project");
                session.removeAttribute("project");
                
                p.setInstructorId(userBean.getLoggedUser().getUserId());
                p.setStatus("AP");
                if(userBean.updateProject(p) == false) {
                    out.print("An unexpected error has occured while updating the project!");
                } else {
                    out.print("<h1>Project " + p.getPrjName() + " has been approved!</h1>");
                }
            %>
        </td>
      </tr>             
    </table>
  </body>
</html>
            
