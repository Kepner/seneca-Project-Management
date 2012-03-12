<%-- 
    Document   : HomeSupervisor
    Created on : Feb 7, 2012, 3:34:03 PM
    Author     : KepneR
--%>

<%@page import="seneca.projectManagement.utils.ProjectSorting"%>
<%@page import="java.util.Collections"%>
<%@page import="seneca.projectManagement.utils.Validation"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="seneca.projectManagement.entity.*" %>
<jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession" scope="session" />
<%
    session.setAttribute("First", 1);
    if(userBean.isLogged() == true) {
        if(userBean.getLoggedUser().getUserRole().equals("SU") == false) {
            session.setAttribute("Error", "You don't have permission to access the supervisor page.");
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
    <title>Supervisor</title>
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
        <td style="background-image: url('../resources/images/header_bg.jpg')">
          <ul>
                <li><a href="ProjectUpdate.jsp">Change Project Status to Past</a></li>
                <li><a href="AvailableProjects.jsp">Current Semester Available Projects</a></li>
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
            <h1>List of Proceeded Projects (<%= Validation.getSemesterToday() %>)</h1>
            <form method="POST" action="ProjectSetPast.jsp">
            <%
                Projects p = null;
                Company c = null;
                List<Projects> projects = userBean.getAllProjects("PR", Validation.getSemesterToday());
                //List<Projects> projects = userBean.getAllProjects("PR");
                if(projects.size() > 0) {
                    Collections.sort(projects, new ProjectSorting());
                    Integer beg = 0;
                    Integer items = 5;
                    try {
                        items = new Integer(request.getParameter("items"));
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                    try {
                        beg = new Integer(request.getParameter("beg")) * items;
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                    for(int i = beg; i < beg + items && i < projects.size() ; i++) {
                        p = projects.get(i);
                        c = userBean.getCompanyByID(p.getCompanyId());
                        out.print("<div style='font-weight: bold; color: white; background-color: #6F93C9; padding: 5px;'>");
                            out.println("<div style='float: left'>");
                                out.println("<input type='checkbox' name='projects' value=" + p.getProjectId() + " />");
                                out.println(p.getPrjName());
                            out.print("</div>");
                            out.println("<div style='float: right'>");
                                out.println("Company: " + c.getCompanyName());
                            out.print("</div>");
                            out.print("<div style='clear: both'></div>");
                        out.print("</div>");
                        out.println("<div style='background-color: skyblue; padding: 10px'>");
                            out.println("<b>Project Description:</b> <br/>" + p.getDescription());
                        out.println("</div>");
                    }
            %>
            <div style="border-style: solid; border-color: #6F93C9"> </div>
            <%
                    out.println("<div style='float: left'>");
                    out.println("<input type='submit' value='Change Selected Project Status to Past' />");
                    out.println("</div>");
                    out.println("<div style='float: right'>");
                    int pages = (int) Math.ceil( (double) projects.size() / items);
                    out.println(" Page(s): ");
                    for(int i = 0; i < pages; i++) {
                        out.println("<a href='ProjectUpdate.jsp?beg=" + i + "&items=" + items + "'>"+ (i + 1) + "</a> | ");
                    }
                    out.println("<a href='ProjectUpdate.jsp?items=" + projects.size() + "'>View All</a>");
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
