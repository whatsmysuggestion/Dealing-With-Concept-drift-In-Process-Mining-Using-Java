<%@ page contentType="text/html; charset=" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="databaseconnection.*"%>
<%
	String agentid=(String)session.getAttribute("agentid");
		String agentname=(String)session.getAttribute("agentname");
		String agentemail=(String)session.getAttribute("agentemail");
String anomaly=(String)session.getAttribute("anomaly");
String image=null;
 	 Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	String sql="select * from file where name='"+agentname+"'";

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
	<form name="form" enctype="multipart/form-data" action="agentfileinsert.jsp" onSubmit="return valid();" method="post"  >
  <div id="wrapper"> 
    <div id="header"> 
      <h2><font color="#00FFFF" size="+2">Dealing With Concept Drifts in Process 
        Mining </font></h2>
    </div>
    <div id="nav"> 
      <div class="inner"> 
        <ul>
          <li><a href="agenthome.jsp"><span class="link">HOME</span></a></li>
          <li><a href="pagentdistributorfiles.jsp"><span class="link">Distributor 
            Files</span></a></li>
          <li><a href="pagentfile.jsp"><span class="link">Agent Files</span></a></li>
          <li><a href="pagentsend.jsp" class="current"><span class="link">Compose</span></a></li>
          <li><a href="phome.jsp"><span class="link">LogOut</span></a></li>
        </ul>
      </div>
    </div>
    <div id="hold"> 
      <div id="content"> 
        <div id="subheader"> 
          <h2>AGENT SEND FILES </h2>
        </div>
        <div id="leftcolumn"> 
          <fieldset style="border: 2px solid #CC6600 ;
border-radius: 10px ;
-moz-border-radius: 10px ;
-webkit-border-radius: 10px ; width:300px;  margin: 0px  100px;">
          <table width="400px" height="250px">
            <tr> 
              <td><font color="#660000" size="2"><strong>User:</strong></font></td>
              <td> <input name="user" type="textbox" style="border: 2px solid #CC6600"></td>
            </tr>
            <tr> 
              <td><font color="#660000" size="2"><strong>Subject:</strong></font></td>
              <td><input name="subject" type="textbox"style="border: 2px solid #CC6600" ></td>
            </tr>
            <tr> 
              <td><font color="#660000" size="2"><strong>FileName:</strong></font></td>
              <td><select name="filename" style="border: 2px solid #CC6600">
                  <option value="Select">--Select--</option>
                  <%
					  while(rs.next())
				     {
					 %>
                  <option value="<%=rs.getString("filename")%>"> 
                  <%=rs.getString("filename")%>
                  </option>
                  <%
					  }
					 
					  %>
                </select></td>
            </tr>
            <tr> 
              <td colspan="2" align="center"><input name="search" type="submit" value="Send" class="button" style="border: 2px solid #CC6600"> 
                &nbsp;&nbsp;&nbsp; <input name="search" type="reset" value="Reset" class="button" style="border: 2px solid #CC6600"></td>
            </tr>
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
          <h3> 
            <%=agentname%>
          </h3>
          <ul class="blog-entries">
            <img src="images/filesend.jpg"> 
          </ul>
        </div>
        <div class="clear"></div>
      </div>
      <div id="footer"> 
        <div class="box"> 
          <%
	int login1=0,distributorfile1=0,download1=0,viewkey1=0,agentfile1=0,compose1=0,logout1=0;
	int login2=0,distributorfile2=0,download2=0,viewkey2=0,agentfile2=0,compose2=0,logout2=0;
	String date2=null,date1=null;
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
			login1=rs1.getInt("login");
			distributorfile1=rs1.getInt("distributorfile");
			download1=rs1.getInt("download");
			viewkey1=rs1.getInt("viewkey");
			agentfile1=rs1.getInt("agentfile");
			compose1=rs1.getInt("compose");
			logout1=rs1.getInt("logout");
			date1=rs1.getString("date");
				if(rs1.next()){
			login2=rs1.getInt("login");
			distributorfile2=rs1.getInt("distributorfile");
			download2=rs1.getInt("download");
			viewkey2=rs1.getInt("viewkey");
			agentfile2=rs1.getInt("agentfile");
			compose2=rs1.getInt("compose");
			logout2=rs1.getInt("logout");
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
        <div class="box2"> 
          <%
		if((agentfile2)==(agentfile1) | (agentfile2)>(agentfile1)){
			image="images/authority.png";
		}

		else
			image="images/noise.png";
		%>
        </div>
        <div class="clear"></div>
      </div>
      <div id="copyright"> 
        <p align="center">Dealing With Concept Drifts in Process Mining </p>
      </div>
    </div>
  </div>
</form>
</body>
</html>
