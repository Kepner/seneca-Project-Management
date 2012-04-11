<%-- 
    Document   : ViewTeams
    Created on : Mar 13, 2012, 4:48:15 PM
    Author     : Edouard
--%>
<%@page import="seneca.projectManagement.entity.*"%>
<%@page import="java.util.List"%>
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
%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/pageStuff.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <title>Instructor - Team List</title>
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
          <h3>List of Teams</h3>
              <% 
                List<Teams> teams = userBean.getAllTeams();
                Teams t = null;
                if( teams.size() > 0 ){
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
                    for(int i = beg; i < beg + items && i < teams.size() ; i++) {
                        t = teams.get(i);
                        %>
                        <div style='font-weight: bold; color: white; background-color: #6F93C9; padding: 5px;'>
                            <div style='float: left'><%=t.getTeamName()%></div>
                            <div style='float: right'><input type='button' value='Expand' name='btnTeams' onclick='collapse(this, "_<%=i%>" )'/></div>
                            <div style='clear: both'></div>
                        </div>
                        <div style='background-color: skyblue; padding: 10px; display:none' id='_<%=i%>'>
                            <b>Team Description:</b><br/><%=t.getTeamDescription()%><br/><br/>
                            <b>Team Constraints:</b><br/><%=t.getTeamConstraints()%><br/>
                            <br /><a href='mailto:<%=t.getTeamEmail()%>'>Send email</a><br/><br/>
                        </div>
                        <%
                    }
                        %>
                        <div style='float: left'><input type='hidden' name='Client' /></div>
                        <div style='float: right'>
                        <%
                        int pages = (int) Math.ceil( (double) teams.size() / items);
                        %> Page(s): <%
                        for(int i = 0; i < pages; i++) {
                            out.println("<a href='ViewTeams.jsp?beg=" + i + "&items=" + items + "'>"+ (i + 1) + "</a> | ");
                        }%>
                        <a href='ViewTeams.jsp?items=<%=teams.size()%>'>View All</a>
                        </div>
                        <div style='clear: both'></div>     
                        <%
                }else{
                    out.println("<p>There are currently no clients</p>");
                }              
              %>
        </td>
      </tr>             
    </table>
  </body>
</html>                        
