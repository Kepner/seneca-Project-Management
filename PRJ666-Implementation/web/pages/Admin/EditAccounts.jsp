<%@page import="javax.mail.Message"%>
<%@page import="seneca.projectManagement.utils.Email"%>
<%@page import="seneca.projectManagement.utils.CryptoUtil"%>
<%@page import="java.util.List"%>
<%@page import="seneca.projectManagement.entity.*"%>
<jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession" scope="session" />
<%
    if(userBean.isLogged() == true && userBean != null) {
        if(userBean.getLoggedUser().getUserRole().equals("AD") == false) {
            session.setAttribute("Error", "You don't have permission to access the administrator page.");
            response.sendRedirect("/PRJ666-Implementation/pages/login.jsp");
        }
    }
    else {
        response.sendRedirect("/PRJ666-Implementation/pages/Home.jsp");
    }
    
    if(session.getAttribute("Second") == null) {
        response.sendRedirect("ManageAccounts.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/pageStuff.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <title>Administrator</title>
    <style type="text/css">
        input[type=text], textArea, input[type=password] {
            width: 300px;
        }
    </style>
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
              out.print("Hello Administrator, " + temp_a.getUserFName() + " " + temp_a.getUserLName());
              out.println("<hr width='95%' align='left'/>");
            }
          }
          %>
          <div style="text-align: center;">
              <ul>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Admin/HomeAdmin.jsp">Home<br/>Administrator</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Admin/PendingComments.jsp">Pending<br/>Comments</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Admin/AvailableProjects.jsp">Available<br/>Projects</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Admin/ProjectUpdate.jsp">Change<br/>Project<br/>Status<br/>to<br/>Past</a></li>
                <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Admin/ManageAccounts.jsp">Manage<br/>Site<br/>Accounts</a></li>
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
            <h3>Updated Accounts</h3>
            <%
                Accounts a = (Accounts) session.getAttribute("ModifyAccounts");
                Email emailer = new Email();
                
                boolean showNewPass = false;
                String fname = request.getParameter("id_fname");
                String lname = request.getParameter("id_lname");
                String email = request.getParameter("id_email");
                String role = request.getParameter("id_role");
                String status = request.getParameter("id_status");
                String sType = request.getParameter("sType");
                String pass = CryptoUtil.generateRandomPassword();
                
                a.setUserFName(fname);
                a.setUserLName(lname);
                a.setUserEmail(email);
                a.setUserRole(role);
                a.setAccountStatus(new Integer(status));
                
                String subject = "Seneca Project Management - Account Updated";
                Accounts i = userBean.getLoggedUser();
                
                if(sType.equals("Reset Password")){
                  a.setPasswordHashed(pass);
                  emailer.addRecipient(Message.RecipientType.TO, a.getUserEmail()); 
                  emailer.sendEmail(i.getUserEmail(), subject, "Greetings,\n\n Your password has been reset to the following below: "
                    + pass + "\n\nPlease keep in somewhere in your reconds.\n\n- " + i.getUserFName() + " " + i.getUserLName());
                }
                
                if(status.equals("0")){
                  emailer = new Email();
                  emailer.addRecipient(Message.RecipientType.TO, a.getUserEmail());
                  emailer.sendEmail(i.getUserEmail(), subject, "Greetings,\n\n Your account has been deactivated."
                    + "\n\nPlease contact the Admin if there are any complications.\n\n- " + i.getUserFName() + " " + i.getUserLName());
                }
                
                /*
                out.println(a.getUserId() + " " + a.getUserIdentifier());
                out.println("<br/> " + fname);
                out.println("<br/> " + lname);
                out.println("<br/> " + email);
                out.println("<br/> " + role);
                out.println("<br/> " + status);
                */
                
                if(userBean.updateAccounts(a)) {
                    out.println("Account for " + fname + " " + lname + " has been updated successfully and emailed.");
                    if(!sType.equals("Reset Password") && !status.equals("0")){
                      emailer.addRecipient(Message.RecipientType.TO, a.getUserEmail()); 
                      emailer.sendEmail(i.getUserEmail(), subject, "Greetings,\n\n Your account information has been updated."
                        + "\n\nPlease contact the admin if there are any complications.\n\n-" + i.getUserFName() + " " + i.getUserLName());
                    }
                } else {
                    out.println("An unexpected error has occured while updating the account!");
                }
                
                session.removeAttribute("ModifyAccounts");
                session.removeAttribute("Second");
            %>
        </td>
      </tr>             
    </table>
  </body>
</html>
