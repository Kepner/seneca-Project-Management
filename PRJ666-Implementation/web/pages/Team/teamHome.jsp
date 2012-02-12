<%-- 
    Document   : teamHome
    Created on : Feb 3, 2012, 10:05:52 AM
    Author     : matthewschranz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui-1.8.16.custom.css" />
    <script type="text/javascript" src="../resources/js/twitter.js"></script>
    <script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
    <title>PRJ566 - Home</title>
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
        <td>
          <a href="rankProjects.jsp">Rank Projects</a>
          &nbsp;&nbsp;&nbsp;
          <a href="manageTeamPage.jsp">Manage Team Page</a>
          &nbsp;&nbsp;&nbsp;
          <a href="manageMilestones.jsp">Manage Project Milestones</a>
          &nbsp;&nbsp;&nbsp;
          <a href="login.jsp">Login</a>
          &nbsp;&nbsp;&nbsp;
          <a href="register.jsp">Register</a>
          <hr/>
        </td>
      </tr>
      <tr>
        <td>Here is your Team Home Page, Insert User grabbing code here.</td>
      </tr>
    </table>
  </body>
</html>