<%-- 
    Document   : AddProjectFile
    Created on : Feb 29, 2012, 5:42:53 PM
    Author     : Edouard
--%>

<%@page import="java.util.List"%>
<%@page import="seneca.projectManagement.entity.*"%>
<jsp:useBean id="userBean" class="seneca.projectManagement.entity.UserSession" scope="session" />
<jsp:setProperty name="userBean" property="*" />
<%
    if(userBean.isLogged() == true && userBean != null) {
        if(userBean.getLoggedUser().getUserRole().equals("CR") == false) {
            session.setAttribute("Error", "You don't have permission to access the company page.");
            response.sendRedirect("/PRJ666-Implementation/pages/login.jsp");
        }            
    }
    else {
        response.sendRedirect("/PRJ666-Implementation/pages/Home.jsp");
    }
    
    String id = request.getParameter("id");
    Projects proj =  new Projects();
    Projectfile projFile = new Projectfile();
    if( id!=null && !id.equals("")){
        proj = userBean.getProject(Integer.parseInt(id));
        if( proj != null && proj.getProjectId() > 0){
            projFile.setProjectId(Integer.parseInt(id));
        }else{ id=""; }                         
    }else{ id=""; }
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/pageStuff.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
        <title>Add Project File</title>
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
              Company temp_c = userBean.getCompany();
              out.print("Hello, Company " + temp_c.getCompanyName());
              out.println("<hr width='95%' align='left'/>");
            }
          }
          %>
          <div style="text-align: center;">
            <ul>
              <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Company/HomeCompany.jsp">Company<br/>Home</a></li>
              <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Company/ProjectAgreementForm.jsp">Create<br/>New<br/>Project</a></li>
              <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Company/ViewCompanyProjects.jsp">Your<br/>Projects</a></li>
              <li class="roleLinks"><a href="/PRJ666-Implementation/pages/Company/ManageCompanyInfo.jsp">Edit<br/>Company<br/>Info</a></li>
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
        <%if(id.equals("x")){
            %><h1>You do not have permission to access this page.</h1><%
         }else if(!id.equals("")){%>
        <h1>Enter file information below:</h1>
        <p><strong>Please note:</strong><br/> Files are not hosted on our servers and must be hosted at your leisure 
            somewhere appropriate.<br/> If files contain sensitive information considering encrypting them.</p>
            <strong style="color:red;">
                <%
                    if(request.getParameter("filefailed")!=null){
                        if(request.getParameter("filefailed").equals("1")){
                            %>There was an error when adding the file.<%
                        }
                    }
                %>                               
            </strong>
        <form method="post" action="../validation/processFile.jsp">
            <input type="hidden" name="projectId" value="<%=proj.getProjectId()%>" />
            <input type="hidden" name="AddProjectFile" value="true" />
            <table>
                <tr style="vertical-align: top;">
                    <td>File Name:</br><em style="color: gray; font-size: 12px;">Database Connection Info</em></td>
                    <td><input style="vertical-align: top;" type="text" size="40" name="projectfileName" /></td>
                    <td>
                        <strong style="color:red;">
                            <%
                                if(request.getParameter("fname")!=null){
                                    if(request.getParameter("fname").equals("1")){
                                        %>File name field can't be empty!<%
                                    }else if (request.getParameter("fname").equals("2")){
                                        %>File name can't exceed 40 characters in length!<%
                                    }
                                }
                            %>                               
                        </strong>
                    </td>                    
                </tr>
                <tr style="vertical-align: top;">
                    <td>Description:</br><em style="color: gray; font-size: 12px;">Contains database connection <br/>information for our prj system.</em></td>
                    <td><textarea rows="3" cols="40" name="projectfileDescription" style="vertical-align: top;" /></textarea></td>
                    <td>
                        <strong style="color:red;">
                            <%
                                if(request.getParameter("fdesc")!=null){
                                    if(request.getParameter("fdesc").equals("1")){
                                        %>Description field can't be empty!<%
                                    }else if (request.getParameter("fdesc").equals("2")){
                                        %>Description can't exceed 65000 characters in length!<%
                                    }
                                }
                            %>
                        </strong>
                    </td>                    
                </tr>
                <tr style="vertical-align: top;">
                    <td>File Location:</br><em style="color: gray; font-size: 12px;">The full URL of the file.<br/>http://web.com/files/conn.doc</em></td>
                    <td style="vertical-align: top;"><input type="text" size="40" name="projectfileTheFile" value="http://" /></td>
                    <td>
                        <strong style="color:red;">
                            <%
                                if(request.getParameter("ffile")!=null){
                                    if(request.getParameter("ffile").equals("1")){
                                        %>File Location field can't be empty!<%
                                    }else if (request.getParameter("ffile").equals("2")){
                                        %>File Location field can't exceed 65000 characters in length!<%
                                    }
                                }
                            %>                                
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Add File" />
                    </td>
                </tr>
            </table>
        </form>
        <%
         }else{
            %><h1>This project does not appear to be valid or does not exist.</h1><%
         }%>
       </td>
      </tr>             
    </table>        
    </body>
</html>
