<%-- 
    Document   : viewProjects
    Created on : Feb 26, 2012, 10:05:52 AM
    Author     : matthewschranz
--%>

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
    <script language="JavaScript">
      function setProject(x) {
        document.form1.Project.value = x;
        document.form1.submit();
      }
    </script>
    <title>PRJ566 - Team View Available Projects</title>
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
          <h3 class="title">Available Projects</h3>
            <form name="form1" method="POST" action="ProjectDetails.jsp">
            <%
              Projects p = null;
              Company c = null;
              //List<Projects> projects = userBean.getAllProjects();
              List<Projects> projects = userBean.getAllProjects("AV");
                if(projects.size() > 0) {
                  Integer beg = 0;
                  Integer items = 5;
                  
                  try {
                    items = new Integer(request.getParameter("items"));
                  }
                  catch (Exception e) {}
                  
                  try {
                    beg = new Integer(request.getParameter("beg")) * items;
                  }
                  catch (Exception e) {}
                  
                  for(int i = beg; i < beg + items && i < projects.size() ; i++) {
                    p = projects.get(i);
                    c = userBean.getCompanyByID(p.getCompanyId());
                    out.print("<div style='font-weight: bold; color: white; background-color: #6F93C9; padding: 5px;'>");
                      out.println("<div style='float: left'>");
                        out.println(p.getPrjName());
                      out.print("</div>");
                      out.println("<div style='float: right'>");
                        out.println("<input type='button' value='View Project Details' onclick='setProject(" + p.getProjectId() + ")' />");
                      out.print("</div>");
                      out.print("<div style='clear: both'></div>");
                    out.print("</div>");
                    out.println("<div style='background-color: skyblue; padding: 10px'>");
                      out.println("<div style='float: left; width: 150px'><b>Company Name:</b></div>");
                      out.println("<div style='float: left; width: 650px'>" + c.getCompanyName() + "</div>");
                      out.print("<div style='clear: both'></div>");
                      out.println("<div style='float: left; width: 150px'><b>Project Name:</b></div>");
                      out.println("<div style='float: left; width: 650px'>" + p.getPrjName() + "</div>");
                      out.print("<div style='clear: both'></div>");
                    out.println("</div>");
                  }
                %>
                <div style="border-style: solid; border-color: #6F93C9"> </div>
                <%
                  out.println("<div style='float: left'><input type='hidden' name='Project' /></div>");
                  out.println("<div style='float: right'>");
                  int pages = (int) Math.ceil( (double) projects.size() / items);
                  out.println(" Page(s): ");
                  for(int i = 0; i < pages; i++) {
                  out.println("<a href='viewProjects.jsp?beg=" + i + "&items=" + items + "'>"+ (i + 1) + "</a> | ");
                }
                out.println("<a href='viewProjects.jsp?items=" + projects.size() + "'>View All</a>");
                out.println("</div>");
                out.print("<div style='clear: both'></div>");
                
                if(session.getAttribute("Error") != null) {
                  out.println("<span style='color: red'>" + session.getAttribute("Error") + "</span>");
                    session.removeAttribute("Error");
                }
              } else {
                out.println("<h1>No projects to display.</h1>");
              }
            %>
          </form>
        </td>
      </tr>
    </table>
  </body>
</html>
