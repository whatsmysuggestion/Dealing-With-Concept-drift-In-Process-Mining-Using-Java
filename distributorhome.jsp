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
<title>Dealing with Concept Drift</title>
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
    <h2><font color="#00FFFF" size="+2">Dealing With Concept Drifts in Process Mining
     </strong></font></h2>
  </div>
  <div id="nav"> 
    <div class="inner"> 
      <ul>
        <li><a href="distributorhome.jsp" class="current"><span class="link">HOME</span></a></li>
        <li><a href="distributorsend.jsp"><span class="link">Send Files</span></a></li>
        <li><a href="distributorviewfiles .jsp"><span class="link">View Files</span></a></li>
        <li><a href="change_point.jsp?agentid=0"><span class="link">Change Point</span></a></li>
        <li><a href="home.html"><span class="link">LogOut</span></a></li>
      </ul>
    </div>
  </div>
  <div id="hold"> 
    <div id="content"> 
      <div id="leftcolumn"> 
        <h2>User Details</h2>
		<fieldset style="border: 2px solid #CC6600 ;
border-radius: 10px ;
-moz-border-radius: 10px ;
-webkit-border-radius: 10px ; width:500px;  margin: 0px  10px;">
        <table>
          <tr> 
            <th width="50px">Id</th>
            <th width="150px">Name</th>
            <th width="150px">Email</th>
            <th width="150px">Phone</th>
          </tr>
          <%while(rs.next()){%>
          <tr> 
            <td> 
            <font color="#000000"> <%=rs.getString("id")%></font> 
            </td>
            <td> 
               <font color="#000000"> <%=rs.getString("name")%></font> 
            </td>
            <td> 
              <font color="#000000">  <%=rs.getString("email")%></font> 
            </td>
            <td> 
             <font color="#000000">  <%=rs.getString("phone")%></font> 
            </td>
          </tr>
          <%}%>
        </table>
		 </fieldset>
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
      <p align="center">Dealing with Concept 
        Drift</p>
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
