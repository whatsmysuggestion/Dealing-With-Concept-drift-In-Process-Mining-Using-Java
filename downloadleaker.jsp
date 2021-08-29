<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>

<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
// check anomaly
		String agentid=(String)session.getAttribute("agentid");
		String agentname=(String)session.getAttribute("agentname");
		String agentemail=(String)session.getAttribute("agentemail");

			int download1=0,compose1=0;
	int download2=0,compose2=0;
	String date2=null,date1=null;
 	Connection con1=null;
	Statement st1=null;	
	ResultSet rs1=null;	
	String sql1="select *  from detect where agentid='"+agentid+"'  order by id DESC";
	try
	{
		con1=databasecon.getconnection();
		st1=con1.createStatement();
		rs1=st1.executeQuery(sql1);
		if(rs1.next()){
			
			download1=rs1.getInt("download");
			
			compose1=rs1.getInt("compose");
			
				if(rs1.next()){
			
					download2=rs1.getInt("download");
			
					compose2=rs1.getInt("compose");
					if((download2)==(download1) | (download2)>(download1)){
						response.sendRedirect("userview.jsp");
					}
					else{
						//mail part
						//String agentname=(String)session.getAttribute("agentname");
						//String newagent=(String)session.getAttribute("newagent");		
					//	String emailid="mailfromchennaisunday@gmail.com";
						String skey=(String)session.getAttribute("skey");
						String filename=(String)session.getAttribute("filename");

						String host="", user="", pass="";

						host ="smtp.gmail.com"; //"smtp.gmail.com";

						user ="mailfromchennaisunday@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

						pass ="23chennai"; //Your gmail password

						String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

						String to =agentemail; // out going email id

						String from ="mailfromchennaisunday@gmail.com"; //Email id of the recipient

						String subject ="Data Leakers";

						String messageText ="<b>"+agentname+"</b> trying to download "+filename+" file on "+strDateNew+"</b>";

						//session.setAttribute("userid",userid);
						//session.setAttribute("password",c);
						session.setAttribute("agentemail",agentemail);
							boolean sessionDebug = true;

						Properties props = System.getProperties();
						props.put("mail.host", host);
						props.put("mail.transport.protocol.", "smtp");
						props.put("mail.smtp.auth", "true");
						props.put("mail.smtp.", "true");
						props.put("mail.smtp.port", "465");
						props.put("mail.smtp.socketFactory.fallback", "false");
						props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
						Session mailSession = Session.getDefaultInstance(props, null);
						mailSession.setDebug(sessionDebug);
						Message msg = new MimeMessage(mailSession);
						msg.setFrom(new InternetAddress(from));
						InternetAddress[] address = {new InternetAddress(to)};
						msg.setRecipients(Message.RecipientType.TO, address);
						msg.setSubject(subject);
						msg.setContent(messageText, "text/html"); // use setText if you want to send text
						Transport transport = mailSession.getTransport("smtp");
						transport.connect(host, user, pass);
						try {
							transport.sendMessage(msg, msg.getAllRecipients());
							//out.println("message successfully sended"); // assume it was sent
							response.sendRedirect("userview.jsp");
						}
						catch (Exception err) {

						out.println("message not successfully sended"); // assume it’s a fail
						}
						transport.close();

					//end mail part
					}
		
				}
		}
		
			response.sendRedirect("userview.jsp");

	}
catch(Exception e1)
	{
		System.out.println(e1);
	}

 





%>

