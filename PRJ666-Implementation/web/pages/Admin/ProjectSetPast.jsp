<%-- 
    Document   : HomeAdmin.jsp
    Created on : Feb 7, 2012, 3:32:57 PM
    Author     : KepneR
--%>

<%@page import="java.util.List"%>
<%@page import="seneca.projectManagement.entity.*"%>
<jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession" scope="session" />
<%
    if(userBean.isLogged() == true) {
        if(userBean.getLoggedUser().getUserRole().equals("AD") == false) {
            session.setAttribute("Error", "You don't have permission to access the administrator page.");
            response.sendRedirect("/PRJ666-Implementation/pages/login.jsp");
        }
    }
    else {
        response.sendRedirect("/PRJ666-Implementation/pages/Home.jsp");
    }
    
    if(session.getAttribute("First") == null) {
        response.sendRedirect("ProjectUpdate.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/pageStuff.css" />
    <link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui-1.8.16.custom.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
    <title>PRJ566 - Administrator Home</title>
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
        <td style="background-image: url('../resources/images/header_bg.jpg')">
          <ul>
			      <li><a href="#">Pending Comments</a></li>
		        <li><a href="#">Available Projects</a></li>
            <li><a href="ProjectUpdate.jsp">Change Project Status to Past</a></li>
            <li><a href="#">Manage Site Accounts</a></li>
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
          <h1>Archive Selected Project(s)</h1>
            <div style="clear: both"></div>
            <div>
            <%
                String[] s =  request.getParameterValues("projects");
                Integer id;
                Integer color = 0;
                if(s != null) {
                    for(String s1 : s) {
                        id = new Integer(s1);
                        Projects p = userBean.getProject(id);
                        out.print("<div style='font-weight: bold; width: 100%; padding: 5px; color: white; background-color: ");
                        if(color == 0) {
                            out.print("#6F93C9");
                            color = 1;
                        } else {
                            out.print("skyblue");
                            color = 0;
                        }
                        out.println("'>");
                        out.println(p.getPrjName());
                        out.println("</div>");
                        p.setStatus("PA");
                        userBean.updateProject(p);
                    }
                }
                //session.setAttribute("Error", "No project selected!");
                //response.sendRedirect("ProjectUpdate.jsp");
                session.removeAttribute("First");
            %>
            </div>
        </td>
      </tr>             
    </table>
  </body>
</html>