<%-- 
    Document   : showWhosLogin
    Created on : Mar 12, 2012, 11:18:56 AM
    Author     : KepneR
--%>

<%@page import="seneca.projectManagement.entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(userBean != null) {
        if(userBean.isLogged() == true) {
            Accounts temp_a = userBean.getLoggedUser();
            out.println("<hr width='95%' align='left'/>");
            if(temp_a.getUserRole().equals("AD")) {
                out.print("Hello Administrator, " + temp_a.getUserFName() + " " + temp_a.getUserLName());
            } else if(temp_a.getUserRole().equals("CR")) {
                Company temp_c = userBean.getCompany();
                out.print("Hello, Company " + temp_c.getCompanyName());
            } else if(temp_a.getUserRole().equals("IN")) {
                out.print("Hello Instructor, " + temp_a.getUserFName() + " " + temp_a.getUserLName());
            } else if(temp_a.getUserRole().equals("SU")) {
                out.print("Hello Supervisor, " + temp_a.getUserFName() + " " + temp_a.getUserLName());
            } else if(temp_a.getUserRole().equals("TL")) {
                Teams temp_t = userBean.getTeam();
                out.print("Hello, Team " + temp_t.getTeamName());
            }
            out.println("<hr width='95%' align='left'/>");
        }
    }
%>
