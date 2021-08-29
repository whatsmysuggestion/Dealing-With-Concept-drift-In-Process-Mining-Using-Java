<%
	String login1=null,distributorfile1=null,download1=null,viewkey1=null,agentfile1=null,compose1=null,logout1=null;
	String login2=null,distributorfile2=null,download2=null,viewkey2=null,agentfile2=null,compose2=null,logout2=null;
 	Connection con1=null;
	Statement st1=null;
	
	ResultSet rs1=null;
	
	
	String sql1="select *  from detect where id='"+agentid+"' order by id DESC ";
	try
	{
		con1=databasecon.getconnection();
		st1=con1.createStatement();
		rs1=st1.executeQuery(sql1);
		if(rs1.next()){
			login1=rs1.getString("login");
			distributorfile1=rs1.getString("distributorfile");
			download1=rs1.getString("download");
			viewkey1=rs1.getString("viewkey");
			agentfile1=rs1.getString("agentfile");
			compose1=rs1.getString("compose");
			login1=rs1.getString("login");
		}
		if(rs1.next()){
			login2=rs1.getString("login");
			distributorfile2=rs1.getString("distributorfile");
			download2=rs1.getString("download");
			viewkey2=rs1.getString("viewkey");
			agentfile2=rs1.getString("agentfile");
			compose2=rs1.getString("compose");
			login2=rs1.getString("login");
		}
	%>
<%
}
catch(Exception e1)
	{
		System.out.println(e1);
	}

 
  %>
8870594450