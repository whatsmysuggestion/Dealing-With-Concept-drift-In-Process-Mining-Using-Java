<%@ page import="java.sql.*,databaseconnection.*"%>

<%
Connection con=null;
Statement st = null;
ResultSet rs = null;
String id=null;
String name = request.getParameter("name");
String password = request.getParameter("password");
session.setAttribute("name",name);
session.setAttribute("password",password);
if((name.equals("admin"))&(password.equals("admin")))
	response.sendRedirect("distributorhome.jsp");	

try{
	 con=databasecon.getconnection();
	st = con.createStatement();
	String qry ="select * from profile where (email='"+name+"' AND password='"+password+"') OR (name='"+name+"' AND password='"+password+"') "; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
	out.println("Enter correct username, password");
	
	}
	else{
		id=rs.getString("id");
		session.setAttribute("agentid",id);
		session.setAttribute("agentname",rs.getString("name"));
		session.setAttribute("agentemail",rs.getString("email"));
		response.sendRedirect("pagenthome.jsp");	
	}
	con.close();
	st.close();
		System.out.print(id);
		
		
}
catch(Exception ex){
	out.println(ex);
}
%>


