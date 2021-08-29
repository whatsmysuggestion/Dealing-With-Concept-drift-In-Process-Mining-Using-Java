<%@ page contentType="text/html; charset=" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="databaseconnection.*"%>
<%

 Connection con=null;
	Statement st=null;
	
	ResultSet rs=null;
	
	
	String sql="select *  from profile ";
	try
	{
		con=databasecon.getconnection();
		st=con.createStatement();
		rs=st.executeQuery(sql);
		
	%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sequential Anomaly Detection</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_400-Myriad_Pro_700-Myriad_Pro_italic_400-Myriad_Pro_italic_700.font.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.easing.compatibility.js"></script>
<script type="text/javascript" src="js/jcarousellite.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/general.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
</head>
<body>
	
<div id="wrapper"> 
  <div id="header"> 
    <h2><font color="#00FFFF" size="+2">Sequential Anomaly Detection in the Presence 
      of &nbsp;<strong>Noise and Limited Feedback</strong></font></h2>
  </div>
  <div id="nav"> 
    <div class="inner"> 
      <ul>
        <li><a href="agenthome.jsp" class="current"><span class="link">HOME</span></a></li>
        <li><a href="Agentdistributorfiles.jsp"><span class="link">Distributor Files</span></a></li>
        <li><a href="viewkey.jsp"><span class="link">View Key</span></a></li>
        <li><a href="agentfile.jsp"><span class="link">Agent Files</span></a></li>
		<li><a href="agentsend.jsp"><span class="link">Compose</span></a></li>
        <li><a href="home.html"><span class="link">LogOut</span></a></li>
      </ul>
    </div>
  </div>
  <div id="hold"> 
    <div id="content"> 
      <div id="leftcolumn"> 
        <h2>User Details</h2>

		<!--table-->
			<form action="submitemail.php" id="submitform" method="post">
          <ul>
            <li class="forminput"> 
              <ul>
                <li class="formleft">Name:</li>
                <li class="formright"><%=rs.getString("name")%></li>
              </ul>
            </li>
            <li class="forminput"> 
              <ul>
                <li class="formleft">Email:</li>
                <li class="formright"><%=rs.getString("email")%></li>
              </ul>
            </li>
            <li class="forminput"> 
              <ul>
                <li class="formleft">Phone:</li>
                <li class="formright"><%=rs.getString("phone")%></li>
              </ul>
            </li>
            <li class="forminput"> 
              <ul>
                <li class="formleft">Message:</li>
                <li class="formright"><%=rs.getString("message")%></li>
              </ul>
            </li>
     
          </ul>
        </form>
		<!--close table-->
      </div>
      <div id="rightcolumn"> 
        <h3>User Profile</h3>
        <ul class="blog-entries">
          <img src="images/user.png"> 
        </ul>
      </div>
      <div class="clear"></div>
    </div>
    <div id="copyright"> 
      <p align="center">Sequential Anomaly Detection in the Presence of Noise 
        and Limited Feedback</p>
    </div>
  </div>
</div>
<%
}
catch(Exception e)
	{
		System.out.println(e);
	}
	  finally
	{
		con.close();
		
		st.close();
	}
 
  %>
</body>
</html>
