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
	
	
	String sql="select *  from file where name='"+agentname+"' ";
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
        <li><a href="agenthome.jsp"><span class="link">HOME</span></a></li>
        <li><a href="Agentdistributorfiles.jsp" class="current"><span class="link">Distributor 
          Files</span></a></li>
        <li><a href="viewkey.jsp"><span class="link">View Key</span></a></li>
        <li><a href="agentfile.jsp"><span class="link">Agent Files</span></a></li>
        <li><a href="agentsend.jsp"><span class="link">Compose</span></a></li>
        <li><a href="home.html"><span class="link">LogOut</span></a></li>
      </ul>
    </div>
  </div>
  <div id="hold"> 
    <div id="content"> 
      <div id="subheader"> 
        <h2>VIEW FILES SENT BY DISTRIBUTOR</h2>
      </div>
      <div id="leftcolumn"> 
        <table>
          <tr> 
            <th width="50px">File</th>
            <th width="150px">Subject</th>
            <th width="150px">Date</th>
            <th width="150px">Details</th>
          </tr>
          <%while(rs.next()){%>
          <tr> 
            <td> 
              <%=rs.getString("filename")%>
            </td>
            <td> 
              <%=rs.getString("subject")%>
            </td>
            <td> 
              <%=rs.getString("date")%>
            </td>
            <td> <a href="filedownload.jsp?id=<%=rs.getString("id")%>">Details</a> 
            </td>
          </tr>
          <%}%>
        </table>
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
          <img src="images/receive.jpg"> 
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
          <li><a href="">View Key&nbsp;&nbsp;( 
            <%=viewkey1%>
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
          <li><a href="">View Key&nbsp;&nbsp;( 
            <%=viewkey2%>
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
        <h3>Noise and Feedback</h3>
        <%
		if((Integer.parseInt(distributorfile2))==(Integer.parseInt(distributorfile1)) | (Integer.parseInt(distributorfile2))>(Integer.parseInt(distributorfile1))){
			image="images/authority.png";
		}
		else if((Integer.parseInt(login2))==(Integer.parseInt(login1)) | (Integer.parseInt(login2))>(Integer.parseInt(login1))){
			image="images/authority.png";
		}
		else if((Integer.parseInt(download2))==(Integer.parseInt(download1)) | (Integer.parseInt(download2))>(Integer.parseInt(download1))){
			image="images/authority.png";
		}
		else if((Integer.parseInt(viewkey2))==(Integer.parseInt(viewkey1)) | (Integer.parseInt(viewkey2))>(Integer.parseInt(viewkey1))){
			image="images/authority.png";
		}
		else if((Integer.parseInt(agentfile2))==(Integer.parseInt(agentfile1)) | (Integer.parseInt(agentfile2))>(Integer.parseInt(agentfile1))){
			image="images/authority.png";
		}
		else if((Integer.parseInt(compose2))==(Integer.parseInt(compose1)) | (Integer.parseInt(compose2))>(Integer.parseInt(compose1))){
			image="images/authority.png";
		}
		else if((Integer.parseInt(logout2))==(Integer.parseInt(logout1)) | (Integer.parseInt(logout2))>(Integer.parseInt(logout1))){
			image="images/authority.png";
		}
		else
			image="images/noise.png";
		%>
        <blink><img src="<%=image%>"></blink> </div>
      <div class="clear"></div>
    </div>
    <div id="copyright"> 
      <p align="center">Sequential Anomaly Detection in the Presence of Noise 
        and Limited Feedback</p>
    </div>
  </div>
</div>

</body>
</html>
