<%-- 
    Document   : manageMilestones
    Created on : Mar 3, 2012, 10:05:52 AM
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
    <link rel="stylesheet" type="text/css" href="../resources/css/ui-lightness/jquery-ui-1.8.18.custom.css"/>
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <script type="text/javascript" src="../resources/js/pageStuff.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-ui-1.8.18.custom.min.js"></script>
    <script>
      $(function() {
		    $( "#datepicker" ).datepicker();
	    }); 
    </script>
    <title>PRJ566 - Create Milestone</title>
  </head>
  <body>
    <%
      if(session.getAttribute("createSuccess") != null){
        request.removeAttribute("milestoneDescription");
        request.removeAttribute("milestoneName");
        request.removeAttribute("milestoneDate");
        request.removeAttribute("milestoneStatus");
      }
    %>
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
        <td style="background-image: url('../resources/images/header_bg.jpg'); height: 1px;">
          <ul>
            <li><a href="/PRJ666-Implementation/pages/Team/teamHome.jsp">Team<br/>Home</a></li>
		        <li><a href="/PRJ666-Implementation/pages/Team/manageTeamPage.jsp">Manage<br/>Team<br/>Page</a></li>
            <li><a href="/PRJ666-Implementation/pages/Team/viewProjects.jsp">View<br/>Projects</a></li>
            <li><a href="/PRJ666-Implementation/pages/Team/teamProject.jsp">View<br/>Your<br/>Project</a></li>
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
          <h1>Milestone Management</h1>
          <form action="../Team/updateMilestone.jsp" method="post">
          <%
            Integer beg = 0;
            Integer items = 10;
            Integer color = 0;
            Teams team = userBean.getTeam();
            Projects proj = userBean.getTeamProject(team.getTeamId());
            List<Milestone> milestones = userBean.getProjectMilestones(proj.getProjectId());
            Milestone m = null;
            if(milestones.size() > 0) {
                try {
                    items = new Integer(request.getParameter("items"));
                }
                catch (Exception e) {}
                try {
                    beg = new Integer(request.getParameter("beg")) * items;
                }
                catch (Exception e) {}
                out.println("<div style='width: 930px;'>");
                out.println("<div style='float: left; padding: 2px; width: 30px; text-align: center'>&nbsp;</div>");
                out.println("<div style='float: left; padding: 2px; width: 250px'>Name</div>");
                out.println("<div style='float: left; padding: 2px; width: 150px'>Description</div>");
                out.println("<div style='float: left; padding: 2px; width: 150px'>Status</div>");
                out.println("<div style='float: left; padding: 2px; width: 100px'>Due Date</div>");
                out.println("<div style='clear: both'></div>");
                for(int i = beg; i < beg + items && i < milestones.size(); i++) {
                    m = milestones.get(i);
                    out.print("<div style='font-weight: bold; padding: 5px; color: white; background-color: ");
                    if(color == 0) {
                        out.print("#6F93C9");
                        color = 1;
                    } else {
                        out.print("skyblue");
                        color = 0;
                    }
                    out.println("'>");
                        out.println("<div style='float: left; padding: 1px; width: 30px; text-align: center'>");
                            out.println("<input type='radio' name='mId' value=" + m.getMilestoneId() + " />");
                        out.println("</div>");
                        out.println("<div style='float: left; padding: 1px; width: 250px'>" + m.getMilestoneName() + "</div>");
                        out.println("<div style='float: left; padding: 1px; width: 150px'>" + m.getDescription() + "</div>");
                        out.println("<div style='float: left; padding: 1px; width: 150px'>" + m.getMilestoneStatus() + "</div>");
                        out.println("<div style='float: left; padding: 2px; width: 100px'>" + new SimpleDateFormat("MM/dd/yyyy").format(m.getDueDate()) + "</div>");
                        out.println("<div style='clear: both'></div>");
                    out.println("</div>");
                }
                out.println("<div style='float: left'><input type='submit' value='Create New Milestone' name='create' /></div>");
                out.println("<div style='float: left'><input type='submit' value='Edit Selected Milestone' name='edit' /></div>");
                out.println("<div style='float: right'>");
                int pages = (int) Math.ceil( (double) milestones.size() / items);
                out.println(" Page(s): ");
                for(int i = 0; i < pages; i++) {
                    out.println("<a href='manageMilestones.jsp?beg=" + i + "&items=" + items + "'>"+ (i + 1) + "</a> | ");
                }
                out.println("<a href='manageMilestones.jsp?items=" + milestones.size() + "'>View All</a>");
                out.println("</div>");
                out.println("<div style='clear: both'></div>");
                if(session.getAttribute("Error") != null) {
                  out.println("<span style='color: red'>" + session.getAttribute("Error") + "</span>");
                  session.removeAttribute("Error");
                }
                else if(session.getAttribute("milestoneSuccess") != null){
                  out.println("<span style='color: green'>" + session.getAttribute("milestoneSuccess") + "</span>");
                  session.removeAttribute("milestoneSuccess");                 
                }
                out.println("</div>");
            } else {
                out.println("No accounts to display!");
            }
          %>
          </form>  
        </td>
      </tr>
    </table>
  </body>
</html>
