<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>

<%

		
		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		
	try{
		
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select max(id) from profile";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
	

	
	
		String name=null,birth=null,gender=null,email=null,password=null,phone=null;
	
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
	name=request.getParameter("name");
	email=request.getParameter("email");
	password=request.getParameter("password");
	phone=request.getParameter("phone");		
	String message="This is"+" "+name;
		try {
			
			

			
			
			
				Connection con1=databasecon.getconnection(); 

			PreparedStatement ps=con1.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?,?)");
				ps.setInt(1,id);
               	ps.setString(2,name);
				ps.setString(3,email);	
       			ps.setString(4,password);
       			ps.setString(5,phone);
			    ps.setString(6,strDateNew);
				ps.setString(7,message);
			   
	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("home.html?message=success");
			}
			else
			{
				response.sendRedirect("home.html?message=fail");
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