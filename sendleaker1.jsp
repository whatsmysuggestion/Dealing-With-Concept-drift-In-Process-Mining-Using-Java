	<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%
		
		String agentid=(String)session.getAttribute("agentid");
		String agentname=(String)session.getAttribute("agentname");
		String agentemail=(String)session.getAttribute("agentemail");
		String filename=(String)session.getAttribute("filename");
		String subject=(String)session.getAttribute("subject");
		String newagent=(String)session.getAttribute("newagent");

			
		String status="Leaker";
		try {
		
			Connection con1=databasecon.getconnection(); 
			PreparedStatement ps=con1.prepareStatement("update agentfile set status=? where username='"+newagent+"' and subject='"+subject+"' and filename='"+filename+"' and sender='"+agentname+"' ");
				ps.setString(1,status);
              
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("agentsend.jsp?message=success");
			}
			else
			{
				response.sendRedirect("agentsend.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
			

		
	
 %>

	
 %>
