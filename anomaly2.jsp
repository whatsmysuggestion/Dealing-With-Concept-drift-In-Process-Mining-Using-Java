<%@ page contentType="text/html; charset=" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="databaseconnection.*"%>
<%
 String id=request.getParameter("id");
String temp[]=null;
temp=id.split(",",2);
 Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="select * from detect where agentid='"+temp[0]+"' and status='"+temp[1]+"'";
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
      <h2><font color="#00FFFF" size="+2">DDD: A New Ensemble Approach
for Dealing with Concept Drift</font></h2>
    </div>
    <div id="nav"> 
      <div class="inner"> 
        <ul>
          <li><a href="distributorhome.jsp"><span class="link">HOME</span></a></li>
          <li><a href="distributorsend.jsp"><span class="link">Send Files</span></a></li>
          <li><a href="distributorviewfiles .jsp"><span class="link">View Files</span></a></li>
          <li><a href="anomaly.jsp" class="current"><span class="link">Anomaly</span></a></li>
          <li><a href="home.html"><span class="link">LogOut</span></a></li>
        </ul>
      </div>
    </div>
    <div id="hold"> 
      <div id="content"> 
        <div id="leftcolumn"> 
          <h2>Sequential Anomaly Detection</h2>
          <table>
            <tr> 
              <th width="50px">Id</th>
              <th width="150px">Agent Name</th>
              <th width="150px">Distributor File</th>
              <th width="150px">Download</th>
              <th width="150px">Agent File</th>
              <th width="150px">Compose</th>
              <th width="150px">Status</th>
              <th width="150px">Date</th>
            </tr>
            <%while(rs.next()){%>
            <tr> 
              <td> 
                <%=rs.getString("id")%>
              </td>
              <td><a href="anomaly1.jsp?id=<%=rs.getString("agentid")%>"> 
                <%=rs.getString("agentname")%>
                </a></td>
              <td> 
                <%=rs.getString("distributorfile")%>
              </td>
              <td> 
                <%=rs.getString("download")%>
              </td>
              <td> 
                <%=rs.getString("agentfile")%>
              </td>
              <td> 
                <%=rs.getString("compose")%>
              </td>
              <td> 
                <%=rs.getString("status")%>
              </td>
              <td> 
                <%=rs.getString("date")%>
              </td>
            </tr>
            <%}%>
          </table>
        </div>
        <div id="rightcolumn"> 
          <h3>Hackers</h3>
          <ul class="blog-entries">
            <img src="images/hack.png"> 
          </ul></ul>
          </div>
        <div class="clear"></div>
      </div>
      <div id="copyright"> 
        <p align="center">DDD: A New Ensemble Approach
for Dealing with Concept Drift</p>
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
</form>
</body>
</html>
