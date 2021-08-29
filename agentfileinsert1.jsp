<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>

<%
		
		String agentid=(String)session.getAttribute("agentid");
		String agentname=(String)session.getAttribute("agentname");
		String agentemail=(String)session.getAttribute("agentemail");
		String anomaly=(String)session.getAttribute("anomaly");
		Statement st = null;
		ResultSet rs1=null;
		int count=0;
		
	try{
		
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select * from detect where id='"+anomaly+"' ";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				count=rs1.getInt("compose")+1;
			
		String status="processing";
		try {
		
			Connection con1=databasecon.getconnection(); 
			PreparedStatement ps=con1.prepareStatement("update detect set compose=? where id='"+anomaly+"'");
				ps.setInt(1,count);
              
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("sendleaker.jsp?message=success");
			}
			else
			{
				response.sendRedirect("sendleaker.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
			}	
	}
	catch (Exception eq) 
		{
			out.println(eq.getMessage());
		}
		
	
 %>

	
 %>
</body>
</html>