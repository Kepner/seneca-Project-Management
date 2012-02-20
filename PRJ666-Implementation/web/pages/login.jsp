<%-- 
    Document   : login
    Created on : Jan 26, 2012, 10:29:09 PM
    Author     : matthewschranz
--%>
<jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession"
               scope="session" />
<jsp:setProperty name="userBean" property="*" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
      <jsp:include page="/pages/headers/loginHeader.jsp" />
      <%
        if(userBean.getIsLogged() == false) {
      %>
        <form method="POST" action="/PRJ666-Implementation/pages/validation/redirect.jsp">
            Username: <input id="username" name="username" type="text" value="evan.weaver" /><br/>
            Password: <input id="password" name="password" type="password" value="12345" /><br/>
            <input type="submit" value="Login Now!" />
        </form>
        
      <%
            if(session.getAttribute("Error") != null) {
                out.print("<font color=\"red\">" + session.getAttribute("Error").toString() + "</font>");
                userBean.logout();
                session.invalidate();
            }
        } else {
            if(session.getAttribute("Error") != null) {
                out.print("<font color=\"red\">" + session.getAttribute("Error").toString() + "</font><br/>");
            }
            String roleFilter = userBean.getLoggedUser().getUserrole();
            
            if(roleFilter.equals("AD")) {
              response.sendRedirect("/PRJ666-Implementation/pages/Admin/HomeAdmin.jsp");
            }
            else if(roleFilter.equals("CR")) {
              response.sendRedirect("/PRJ666-Implementation/pages/Company/HomeCompany.jsp");
            }
            else if(roleFilter.equals("IN")) {
              response.sendRedirect("/PRJ666-Implementation/pages/Instructor/HomeInstructor.jsp");
            }
            else if(roleFilter.equals("SU")) {
              response.sendRedirect("/PRJ666-Implementation/pages/Supervisor/HomeSupervisor.jsp");
            }
            else if(roleFilter.equals("TL")) {
              if(userBean.getHasRegistered() == 0) {
                response.sendRedirect("/PRJ666-Implementation/pages/Team/publishTeamPage.jsp");
              }
              else {
                response.sendRedirect("/PRJ666-Implementation/pages/Team/teamHome.jsp");
              }
            }
        }
      %>
  </body>
</html>
