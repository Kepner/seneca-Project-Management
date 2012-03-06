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
        response.sendRedirect("ManageAccounts.jsp");
    } else {
        session.setAttribute("Second", 1);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/pageStuff.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <title>PRJ566 - Administrator Home</title>
    <style type="text/css">
        input[type=text], textArea, input[type=password] {
            width: 300px;
        }
    </style>
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
            <li><a href="PendingComments.jsp">Pending Comments</a></li>
            <li><a href="#">Available Projects</a></li>
            <li><a href="ProjectUpdate.jsp">Change Project Status to Past</a></li>
            <li><a href="ManageAccounts.jsp">Manage Site Accounts</a></li>
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
                Accounts a = null;
                String s = request.getParameter("accounts");
                /**************************************************************
                Create new account
                **************************************************************/
                if(request.getParameter("create") != null) {
                    out.println("<h1>Create Account</h1>");
                /**************************************************************
                Edit account
                **************************************************************/
                } else if (request.getParameter("edit") != null) {
                    out.println("<h1>Edit Account</h1>");
                    if(s != null) {
                        a = userBean.getAccount(s);
                        %>
                        <form method="POST" action="EditAccounts.jsp">
                            <div style="width: 900px">
                                <div style="padding: 5px; background-color: #D5E7E9">
                                    Account Information
                                </div>
                                <div style="padding: 5px">
                                    <div style="float: left; width: 150px">First Name:</div>
                                    <div style="float: left"><input type="text" name="id_fname" value="<%= a.getUserFName() %>" /></div>
                                    <div style="clear: both"></div>
                                    <div style="float: left; width: 150px">Last Name:</div>
                                    <div style="float: left"><input type="text" name="id_lname" value="<%= a.getUserLName() %>" /></div>
                                    <div style="clear: both"></div>
                                    <div style="float: left; width: 150px">Email:</div>
                                    <div style="float: left"><input type="text" name="id_email" value="<%= a.getUserEmail() %>" /></div>
                                    <div style="clear: both"></div>
                                    <div style="float: left; width: 150px">Role:</div>
                                    <div style="float: left">
                                        <select name="id_role">
                                            <option value="AD" <%= a.getUserRole().equals("AD") ? "selected" : "" %>>Administrator</option>
                                            <option value="CR" <%= a.getUserRole().equals("CR") ? "selected" : "" %>>Company Representative</option>
                                            <option value="IN" <%= a.getUserRole().equals("IN") ? "selected" : "" %>>Instructor</option>
                                            <option value="SU" <%= a.getUserRole().equals("SU") ? "selected" : "" %>>Supervisor</option>
                                            <option value="TL" <%= a.getUserRole().equals("TL") ? "selected" : "" %>>Team Leader</option>
                                        </select>
                                    </div>
                                    <div style="clear: both"></div>
                                    <div style="float: left; width: 150px">Status:</div>
                                    <div style="float: left">
                                        <select name="id_status">
                                            <option value="1" <%= a.getAccountStatus() == 1 ? "selected" : "" %>>Active</option>
                                            <option value="0" <%= a.getAccountStatus() == 0 ? "selected" : "" %>>Inactive</option>
                                        </select>
                                    </div>
                                    <div style="clear: both"></div>
                                </div>
                                <div style="background-color: #D5E7E9; padding: 5px; text-align: right">
                                    <input type="submit" value="Modify">
                                </div>
                            </div>
                        </form>
                        <%
                    } else {
                        session.setAttribute("Error", "No account selected!");
                        response.sendRedirect("ManageAccounts.jsp");
                    }
                /**************************************************************
                Remove account
                **************************************************************/
                } else if (request.getParameter("remove") != null) {
                    out.println("<h1>Remove Account</h1>");
                    if(s != null) {
                        a = userBean.getAccount(s);
                        out.println(a.getUserFName() + " " + a.getUserLName());
                    } else {
                        session.setAttribute("Error", "No account selected!");
                        response.sendRedirect("ManageAccounts.jsp");
                    }
                } else {
                    response.sendRedirect("ManageAccounts.jsp");
                }
                session.removeAttribute("First");
            %>
        </td>
      </tr>             
    </table>
  </body>
</html>