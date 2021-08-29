<%@ page contentType="text/html; charset=" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="databaseconnection.*"%>
<%
	String agentid=(String)session.getAttribute("agentid");
		String agentname=(String)session.getAttribute("agentname");
		String agentemail=(String)session.getAttribute("agentemail");

 	Connection con=null;
	Statement st=null;
	
	ResultSet rs=null;
	
	
	String sql="select *  from profile where id='"+agentid+"' ";
	try
	{
		con=databasecon.getconnection();
		st=con.createStatement();
		rs=st.executeQuery(sql);
		
	%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Dealing With Concept Drifts in Process Mining</title>
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
    <h2><font color="#00FFFF" size="+2"> Dealing With Concept Drifts in Process 
      Mining</font></h2>
  </div>
  <div id="nav"> 
    <div class="inner"> 
      <ul>
        <li><a href="agenthome.jsp" class="current"><span class="link">HOME</span></a></li>
        <li><a href="pagentdistributorfiles.jsp"><span class="link">Distributor 
          Files</span></a></li>
        <li><a href="pagentfile.jsp"><span class="link">Agent Files</span></a></li>
        <li><a href="pagentsend.jsp"><span class="link">Compose</span></a></li>
        <li><a href="phome.jsp"><span class="link">LogOut</span></a></li>
      </ul>
    </div>
  </div>
  <div id="hold"> 
    <div id="content"> 
      <div id="subheader"> 
        <h2>My Account Details</h2>
      </div>
      <div id="leftcolumn"> 
        <fieldset style="border: 2px solid #CC6600 ;
border-radius: 10px ;
-moz-border-radius: 10px ;
-webkit-border-radius: 10px ; width:300px;  margin: 0px  100px;">
        <table>
          <%while(rs.next()){%>
          <tr> 
            <td width="150" height="20"><font color="#000000">Id</font></td>
            <td width="200" height="20"> <font color="#000000"> 
              <%=rs.getString("id")%>
              </font> </td>
          </tr>
          <tr> 
            <td width="150" height="20"><font color="#000000">Name</font></td>
            <td width="200" height="20"> <font color="#000000"> 
              <%=rs.getString("name")%>
              </font> </td>
          </tr>
          <tr> 
            <td width="150" height="20"><font color="#000000">Email</font></td>
            <td width="200" height="20"> <font color="#000000"> 
              <%=rs.getString("email")%>
              </font> </td>
          </tr>
          <tr> 
            <td width="150" height="20"><font color="#000000">Phone</font></td>
            <td width="200" height="20"> <font color="#000000"> 
              <%=rs.getString("phone")%>
              </font> </td>
          </tr>
          <tr> 
            <td width="150" height="20"><font color="#000000">Message</font></td>
            <td width="200" height="20"> <font color="#000000"> 
              <%=rs.getString("message")%>
              </font> </td>
          </tr>
          <%}%>
        </table>
        </fieldset>
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
        <div id="error"></div>
      </div>
      <div id="rightcolumn"> 
        <h3>My Account</h3>
        <ul class="blog-entries">
          <img src="images/03d1dfb3decd8715d002d9523f6f2d6f.jpg" width="150"> 
        </ul>
      </div>
      <div class="clear"></div>
    </div>
    <div id="footer"> 
      <div class="box"> 
        <%
	String login1=null,distributorfile1=null,download1=null,viewkey1=null,agentfile1=null,compose1=null,logout1=null,date1=null;
	String login2=null,distributorfile2=null,download2=null,viewkey2=null,agentfile2=null,compose2=null,logout2=null,date2=null;
 	Connection con1=null;
	Statement st1=null;
	
	ResultSet rs1=null;
	
	
	String sql1="select *  from detect where agentid='"+agentid+"'  order by id DESC";
	try
	{
		con1=databasecon.getconnection();
		st1=con1.createStatement();
		rs1=st1.executeQuery(sql1);
		if(rs1.next()){
			login1=rs1.getString("login");
			distributorfile1=rs1.getString("distributorfile");
			download1=rs1.getString("download");
			viewkey1=rs1.getString("viewkey");
			agentfile1=rs1.getString("agentfile");
			compose1=rs1.getString("compose");
			logout1=rs1.getString("logout");
			date1=rs1.getString("date");
				if(rs1.next()){
			login2=rs1.getString("login");
			distributorfile2=rs1.getString("distributorfile");
			download2=rs1.getString("download");
			viewkey2=rs1.getString("viewkey");
			agentfile2=rs1.getString("agentfile");
			compose2=rs1.getString("compose");
			logout2=rs1.getString("logout");
			date2=rs1.getString("date");
		}
		}
		
	%>
        <%
}
catch(Exception e1)
	{
		System.out.println(e1);
	}

 
  %>
        <h3>Current Sequence</h3>
        <ul>
          <li><a href="">Login&nbsp;&nbsp;( 
            <%=login1%>
            )</a></li>
          <li><a href="">Distributor File&nbsp;&nbsp;( 
            <%=distributorfile1%>
            )</a></li>
          <li><a href="">Download&nbsp;&nbsp;( 
            <%=download1%>
            )</a></li>
          <li><a href="">Agent File&nbsp;&nbsp;( 
            <%=agentfile1%>
            )</a></li>
          <li><a href="">Compose&nbsp;&nbsp;( 
            <%=compose1%>
            )</a></li>
          <li><a href="">Logout&nbsp;&nbsp;( 
            <%=logout1%>
            )</a></li>
        </ul>
      </div>
      <div class="box"> 
        <h3>Previous Feedback</h3>
        <ul>
          <li><a href="">Login&nbsp;&nbsp;( 
            <%=login2%>
            )</a></li>
          <li><a href="">Distributor File&nbsp;&nbsp;( 
            <%=distributorfile2%>
            )</a></li>
          <li><a href="">Download&nbsp;&nbsp;( 
            <%=download2%>
            )</a></li>
          <li><a href="">Agent File&nbsp;&nbsp;( 
            <%=agentfile2%>
            )</a></li>
          <li><a href="">Compose&nbsp;&nbsp;( 
            <%=compose2%>
            )</a></li>
          <li><a href="">Logout&nbsp;&nbsp;( 
            <%=logout2%>
            )</a></li>
        </ul>
      </div>
      <div class="box2"> </div>
      <div class="clear"></div>
    </div>
    <div id="copyright"> 
      <p align="center"> Dealing with Concept Drift</p>
    </div>
  </div>
</div>

</body>
</html>
