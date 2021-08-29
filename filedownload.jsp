<%@ page contentType="text/html; charset=" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="databaseconnection.*"%>
<%
	String agentid=(String)session.getAttribute("agentid");
		String agentname=(String)session.getAttribute("agentname");
		String agentemail=(String)session.getAttribute("agentemail");
String anomaly=(String)session.getAttribute("anomaly");
String id=request.getParameter("id");
session.setAttribute("filename",id);
String image=null;
 	Connection con=null;
	Statement st=null;
	
	ResultSet rs=null;
	
	
	String sql="select *  from file where filename='"+id+"' ";
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
    <h2><font color="#00FFFF" size="+2">Dealing With Concept Drifts in Process 
      Mining</font></h2>
  </div>
  <div id="nav"> 
    <div class="inner"> 
      <ul>
        <li><a href="agenthome.jsp"><span class="link">HOME</span></a></li>
        <li><a href="pagentdistributorfiles.jsp" class="current"><span class="link">Distributor 
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
        <h2>VIEW FILES SENT BY DISTRIBUTOR</h2>
      </div>
      <div id="leftcolumn"> 
        <fieldset style="border: 2px solid #CC6600 ;
border-radius: 10px ;
-moz-border-radius: 10px ;
-webkit-border-radius: 10px ; width:300px;  margin: 0px  100px;">
        <table align="center">
          <tr> </tr>
          <%while(rs.next()){%>
          <tr> 
            <td width="50px"><font color="#000000">File</font></td>
            <td width="150px"> <font color="#000000"> 
              <%=rs.getString("filename")%>
              </font> </td>
          </tr>
          <tr> 
            <td width="150px"><font color="#000000">Subject</font></td>
            <td width="150px"> <font color="#000000"> 
              <%=rs.getString("subject")%>
              </font> </td>
          </tr>
          <tr> 
            <td width="150px"><font color="#000000">Date</font></td>
            <td width="150px"> <font color="#000000"> 
              <%=rs.getString("date")%>
              </font> </td>
          </tr>
          <tr> 
            <td colspan="2" align="center"> <a href="filedownload1.jsp?id=<%=rs.getString("filename")%>">Download</a> 
            </td>
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
        <h3> 
          <%=agentname%>
        </h3>
        <ul class="blog-entries">
          <img src="images/download.jpg"> 
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
		if((download2)==(download1) | (download2)>(download1)){
			image="images/authority.png";
		}
		else
			image="images/noise.png";
		%>
      </div>
      <div class="clear"></div>
    </div>
    <div id="copyright"> 
      <p align="center">DDD: A New Ensemble Approach for Dealing with Concept 
        Drift</p>
    </div>
  </div>
</div>

</body>
</html>
