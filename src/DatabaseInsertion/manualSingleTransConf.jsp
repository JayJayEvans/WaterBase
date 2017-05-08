<%@ page import="java.io.*" %>
 <%@ page language="java" %>
         <%@ page import="java.sql.*" %>
	          <%@ page import="java.sql.DriverManager.*" %>
		          <%@ page import="java.io.*" %>
			          <%@ page import="java.util.*" %>

<%     
PreparedStatement ps;
PreparedStatement ps1;
PreparedStatement ps2;
PreparedStatement ps3;
PreparedStatement ps4;
Connection conn;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");

Statement st=conn.createStatement();
%>

<%
boolean wellExists = false;
%>


<%
String token = "";
String sql = "INSERT INTO Transducers(TransID,TransType,TransName,WellID) VALUES(?,?,?,?)";
String tran ="";
try{

%>
<%
token = request.getParameter("TransID");

	ps = conn.prepareStatement (sql);
	ps2 = null;
	ResultSet rs=null;
				if(token.equals(" ")){//TransID
					ps.setNull(1,0);
				}
				else{
					tran=token;
					int tok = Integer.parseInt(token);
					ps.setInt(1,tok);
					
				}	
				
				token = request.getParameter("TransType");
						ps.setString(2,token);
		
				token = request.getParameter("TransName");
						ps.setString(3,token);	

				token = request.getParameter("WellID");
					int tok = Integer.parseInt(token);
						ps.setInt(4,tok);
				

		ps.executeUpdate();


	%>
	
 <Br><table border="2"><tr><td><b>You have successfully inserted a new transducer: </b>
                     <% out.println(tran); %>
  </td></tr></table>
 

	<%



}catch(Exception e){ 
	out.println(e);
	%>
	
  <Br><table border="2"><tr><td><b>Insertion failed due to incorrect format, or information contains duplicates that violate constraints</b>
                     <% out.println(token); %>
  </td></tr></table>


	<%
}
%>
