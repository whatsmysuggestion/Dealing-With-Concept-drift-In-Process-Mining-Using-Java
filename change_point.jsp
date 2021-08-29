<%@ page import="java.sql.*" %>
<%@ page import="databaseconnection.*"%>
<%
String agentid=request.getParameter("agentid"); 
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
    <h2><font color="#00FFFF" size="+2">Dealing With Concept Drifts in Process 
      Mining </strong></font></h2>
  </div>
  <div id="nav"> 
    <div class="inner"> 
      <ul>
        <li><a href="distributorhome.jsp"><span class="link">HOME</span></a></li>
        <li><a href="distributorsend.jsp"><span class="link">Send Files</span></a></li>
        <li><a href="distributorviewfiles .jsp"><span class="link">View Files</span></a></li>
        <li><a href="anomaly.jsp" class="current"><span class="link">Change Point</span></a></li>
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
            <th width="150px">Change Detection</th>
          </tr>
          <%while(rs.next()){%>
          <tr> 
            <td> <font color="#000000"> 
              <%=rs.getString("id")%>
              </font> </td>
            <td> <font color="#000000"> 
              <%=rs.getString("name")%>
              </font> </td>
            <td> <font color="#000000"> 
              <%=rs.getString("email")%>
              </font> </td>
            <td> <font color="#000000"> 
              <%=rs.getString("phone")%>
              </font> </td>
            <td> <a href="?agentid=<%=rs.getString("id")%>"><font color="#000000">Detection</font> 
              </a> </td>
          </tr>
          <%}%>
        </table>
        <%
}
catch(Exception e)
	{
		System.out.println(e);
	}

 
  %>
        </fieldset>
        <%
		 //Change Point Detection Graph
		 
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
		
	
}
catch(Exception e1)
	{
		System.out.println(e1);
	}

 
  %>
        <%
		//Graph
		%>
        <table>
          <%if(agentid.equals("0")){%>
          <tr> 
            <td><font color="#660000" size="4">Current Event</font></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
          </tr>
          <tr> 
            <td><font color="#660000" size="4">Previous Event</font></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
            <td><img src="images/yellow.png"></td>
          </tr>
          <%}
			else{
			%>
          <tr> 
            <td><font color="#330000" size="3">Current Event</font></td>
            <%if(login1==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else if(login1==login2){
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/red.png"></td>
            <%
				}
				%>
            <%if(distributorfile1==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else if(distributorfile1==distributorfile2){
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/red.png"></td>
            <%
				}
				%>
            <%if(download1==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else if(download1==download2){
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/red.png"></td>
            <%
				}
				%>
            <%if(viewkey1==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else if(viewkey1==viewkey2){
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/red.png"></td>
            <%
				}
				%>
            <%if(agentfile1==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else if(agentfile1==agentfile2){
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/red.png"></td>
            <%
				}
				%>
            <%if(compose1==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else if(compose1==compose2){
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/red.png"></td>
            <%
				}
				%>
            <%if(logout1==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else if(logout1==logout2){
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/red.png"></td>
            <%
				}
				%>
          </tr>
          <tr> 
            <td><font color="#330000" size="3">Previous Event</font></td>
            <%if(login2==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				%>
            <%if(distributorfile2==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				%>
            <%if(download2==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				%>
            <%if(viewkey2==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				%>
            <%if(agentfile2==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				%>
            <%if(compose2==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				%>
            <%if(logout2==0){
				%>
            <td><img src="images/yellow.png"></td>
            <%
				}
				else{
				%>
            <td><img src="images/green.png"></td>
            <%
				}
				%>
          </tr>
          <%
			}
			%>
        </table>
      </div>
      <div id="rightcolumn"> 
        <h3>User Profile</h3>
        <ul class="blog-entries">
          <img src="images/user.png"> 
        </ul>
		<p><strong><font color="#660000" size="3">1.Login</font></strong></p>
	<p><strong><font color="#660000" size="3">2.Distributor File</font></strong></p>
	<p><strong><font color="#660000" size="3">3.Download</font></strong></p>
	<p><strong><font color="#660000" size="3">4.ViewKey</font></strong></p>
	<p><strong><font color="#660000" size="3">5.AgentFile</font></strong></p>
	<p><strong><font color="#660000" size="3">6.Compose</font></strong></p>
	<p><strong><font color="#660000" size="3">7.Logout</font></strong></p>
      </div>
      <div class="clear"></div>
    </div>
    <div id="copyright"> 
      <p align="center">Dealing with Concept Drift</p>
    </div>
  </div>
</div>

</body>
</html>
