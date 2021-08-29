<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>

<%
		String id=request.getParameter("id");
		String status="Anomaly";
		try {
		
			Connection con1=databasecon.getconnection(); 
			PreparedStatement ps=con1.prepareStatement("update detect set status=? where id='"+id+"'");
				ps.setString(1,status);
              
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("anomaly.jsp?message=success");
			}
			else
			{
				response.sendRedirect("anomaly.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}

		
	
 %>


</body>
</html>