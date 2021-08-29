<%@ page import="java.sql.*, javax.sql.*, databaseconnection.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<html>
<head>
<title>Dealing with Concept Drift</title>
<script language="JavaScript">

</script>
</head>
<body background="Images/clouds_background.jpg">
<%
	
	String filename =(String)session.getAttribute("filename");
	String skey=request.getParameter("skey");
	System.out.print("my file name"+filename);
	System.out.print(skey);
	Blob file= null;
	
	Connection con1 = null;
	PreparedStatement ps1 = null;
	ResultSet rs1 = null;
		String sql1=null;

	 sql1 = "select datafile from file where filename ='"+filename+"' and skey='"+skey+"' ";
	
	try
	{
		con1 = databasecon.getconnection();
		ps1 = con1.prepareStatement(sql1);
		//ps1.setString(1,filename);
		rs1 = ps1.executeQuery();
		if(rs1.next()){
			file = rs1.getBlob(1);
			session.setAttribute("resumeBlob",file);
		    response.sendRedirect("filedownload2.jsp");
		}
		else
			out.println("Please enter the correct secret key");
	}
	
	catch(Exception e)
	{
		out.println("Exception :"+e);
	}
	finally
	{
		if(con1 != null)
			con1.close();
		if(ps1 != null)
			ps1.close();
		if(rs1 != null)
			rs1.close();
	}
	

%>


</body>
</html>