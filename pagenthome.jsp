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
		
		Statement st = null;
		ResultSet rs1=null;
		int id=0,login=1;
		
	try{
		
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select max(id) from detect";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0){
					
					id=1;
					session.setAttribute("anomaly",Integer.toString(id));
				}
				else{
					
					id=rs1.getInt(1)+1;
					session.setAttribute("anomaly",Integer.toString(id));
				}
	
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 	int count=0;		
	String status="processing";
		try {
		
			Connection con1=databasecon.getconnection(); 
			PreparedStatement ps=con1.prepareStatement("INSERT INTO detect VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setInt(1,id);
               	ps.setString(2,agentid);
				ps.setString(3,agentname);	
       			ps.setString(4,agentemail);
       			ps.setInt(5,login);
			    ps.setInt(6,count);
				ps.setInt(7,count);
			    ps.setInt(8,count);	
       			ps.setInt(9,count);
       			ps.setInt(10,count);
			    ps.setInt(11,count);
				ps.setString(12,status);
				ps.setString(13,strDateNew);

			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("agenthome.jsp?message=success");
			}
			else
			{
				response.sendRedirect("agenthome.jsp?message=fail");
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