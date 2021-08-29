<%@ page contentType="text/html; charset=" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="databaseconnection.*"%>
<%
String status="Leaker";
 Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="select * from agentfile where status='"+status+"'";
	try
	{
		con=databasecon.getconnection();
		st=con.createStatement();
		rs=st.executeQuery(sql);
		//session.setAttribute( "id", n );
		

	
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
<script type="text/javascript">


function valid()
{
var a = document.form.filename.value;
var b = document.form.subject.value;
var c = document.form.datafile.value;

if(document.form.user.selectedIndex==0)
{
alert("Select User");

document.form.user.focus();

return false;
}
if(b=="")
{
alert("Enter Subject");
document.form.subject.focus();
return false;
}
if(a=="")
{
alert("Enter FileName");
document.form.filename.focus();
return false;
}

if(c=="")
{
alert("Select File to Uploads");
document.form.datafile.focus();
return false;
}

}


</script>
</head>
<body>
	<form name="form" enctype="multipart/form-data" action="uploadedfile.jsp" onSubmit="return valid();" method="post"  >
  <div id="wrapper"> 
    <div id="header"> 
      <h2><font color="#00FFFF" size="+2">Dealing With Concept Drifts in Process 
        Mining</font></h2>
    </div>
    <div id="nav"> 
      <div class="inner"> 
        <ul>
          <li><a href="distributorhome.jsp"><span class="link">HOME</span></a></li>
          <li><a href="distributorsend.jsp"><span class="link">Send Files</span></a></li>
          <li><a href="distributorviewfiles .jsp"><span class="link">View Files</span></a></li>
          <li><a href="anomaly.jsp" class="current"><span class="link">Data Leaker</span></a></li>
          <li><a href="home.html"><span class="link">LogOut</span></a></li>
        </ul>
      </div>
    </div>
    <div id="hold"> 
      <div id="content"> 
        <div id="leftcolumn"> 
          <h2>LEAK FILES</h2>
          <fieldset style="border: 2px solid #CC6600 ;
border-radius: 10px ;
-moz-border-radius: 10px ;
-webkit-border-radius: 10px ; width:500px;  margin: 0px  10px;">
          <table>
            <tr> 
              <th width="150px">Leaker</th>
              <th width="150px">Data</th>
              <th width="150px">User Name</th>
              <th width="150px">Date</th>
            </tr>
            <%while(rs.next()){%>
            <tr> 
              <td><font color="#FF0000"> 
                <%=rs.getString("sender")%>
                </font> </td>
              <td><font color="#FF00FF"> 
                <%=rs.getString("filename")%>
                </font> </td>
              <td> <font color="#000000"> 
                <%=rs.getString("username")%>
                </font> </td>
              <td> <font color="#000000"> 
                <%=rs.getString("date")%>
                </font> </td>
            </tr>
            <%}%>
          </table>
          </fieldset>
        </div>
        <div id="rightcolumn"> 
          <h3>Leakers</h3>
          <ul class="blog-entries">
            <img src="images/hack.png"> 
          </ul></ul>
          </div>
        <div class="clear"></div>
      </div>
      <div id="copyright"> 
        <p align="center"> Dealing with Concept Drift</p>
      </div>
    </div>
  </div>
<%
}
catch(Exception e)
	{
		System.out.println(e);
	}
	 
 
  %>
</form>
</body>
</html>
