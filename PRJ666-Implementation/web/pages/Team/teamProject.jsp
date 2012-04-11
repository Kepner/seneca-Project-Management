<%-- 
    Document   : teamProject
    Created on : Mar 11, 2012, 1:11:43 PM
    Author     : matthewschranz
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="seneca.projectManagement.entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession"
               scope="session" />
  <jsp:setProperty name="userBean" property="*" />
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
    <title>PRJ566 - Team Project</title>
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
              Teams temp_t = userBean.getTeam();
              out.print("Hello, Team " + temp_t.getTeamName());
              out.println("<hr width='95%' align='left'/>");
            }
          }
          %>
          <div style="text-align: center;">
              <ul>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Team/teamHome.jsp">Team<br/>Home</a></li> 
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Team/manageTeamPage.jsp">Manage<br/>Team Page</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Team/viewProjects.jsp">View<br/>Available<br/>Projects</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Team/teamProject.jsp">View<br/>Your<br/>Project</a></li> 
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
            Teams t = userBean.getTeam();
            Projects p = userBean.getTeamProject(t.getTeamId());
            
            if(p != null){
              Company c = userBean.getCompanyByID(p.getCompanyId());
              Accounts a = userBean.getAccount(c.getUserId());
              List<Projectfile> pfs = userBean.getProfileFiles(p.getProjectId());
              Projectfile pf = null;
            %>
            <h3 class="title">Company Info</h3>
            <span class="teamHeaders">Company Name:&nbsp;</span><%= c.getCompanyName() %> <br/>
            <span class="teamHeaders">Email:&nbsp;</span><%= a.getUserEmail() %><br/>
            <span class="teamHeaders">Contact Person:&nbsp;</span><%= a.getUserFName() + " " + a.getUserLName() %><br/>
            <br/>
            <h3 class="title">Project Info</h3>
            <span class="teamHeaders">Name:&nbsp;</span><%= p.getPrjName() %><br/>
            <span class="teamHeaders">Matched Date:&nbsp;</span><%= new SimpleDateFormat("MM/dd/yyyy").format(p.getAgreementDate()) %><br/>
            <span class="teamHeaders">Status:&nbsp;</span><%= p.getStatus() %><br/><br/>
            <span class="teamHeaders">Constraints:&nbsp;</span><p class="description"><%= p.getPrjConstraints() %></p>
            <span class="teamHeaders">Description:&nbsp;</span><p class="description"><%= p.getDescription() %></p>
            <br/>
            <h3 class="title">Project Files</h3>
            <%
              for(int i = 0; i < pfs.size(); i++){
                pf = pfs.get(i);
                out.println("<a href='" + pf.getTheFile() + "' target='_blank'>" + pf.getFileName() + "</a><br/>");
              }
            %>
            <%
            }
            else {
              out.println("<h3>Your team does not have a project associated with it! :(</h3>");
            }
          %>
          
        </td>
      </tr>
    </table>
  </body>
</html>
