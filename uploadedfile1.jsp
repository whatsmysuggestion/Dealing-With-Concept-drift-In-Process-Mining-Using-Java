<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>

<html>
<head>
</head>
<body >
<form action="">
<%


ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Documents\\");
		String paramname=null;
		String user=null,subject=null,datafile=null;
		String id[]=null;
		//int id=0;
		String fname=null;
		File file1 = null;
		int y= 1000 + (int)(Math.random()*9000);
		
		
	java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;		
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("name"))
				{
					name=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("filename"))
				{
					fname=multi.getParameter(paramname);
				}
			
				if(paramname.equalsIgnoreCase("subject"))
				{
					subject=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("datafile"))
				{
					datafile=multi.getParameter(paramname);
				}
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			datafile = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Documents\\"+datafile);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
			id=name.split(",",2);
	
	        FileInputStream fs1 = null;

			Connection con=databasecon.getconnection(); 
      	  
			PreparedStatement ps=con.prepareStatement("insert into file values(?,?,?,?,?,?,?,?)");
           	
       			ps.setString(1,id[1]);
				ps.setString(2,subject);				
       			ps.setString(3,datafile);
				ps.setString(4,fname);
				ps.setInt(5,id[0]);
				ps.setString(6,strDateNew);
				ps.setInt(7,y);
				ps.setString(8,"unlock");
			
       if(f == 0)
			ps.setObject(3,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(3,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("distributorhome.jsp?message=success");
			}
			else
			{
				response.sendRedirect("Error.jsp");
			}
  
     
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
 </form>
</body>
</html>