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
String sql2 = "INSERT INTO TransducerRecords(TransID,InputTime,Temperature,Conductivity,Pressure,Salinity,TDS) VALUES(?,?,?,?,?,?,?)";
try{
String query = "SELECT WellID FROM Transducers WHERE TransID='";

%>
<%
token = request.getParameter("TransID");

	ps = conn.prepareStatement (sql);
	ps1 = conn.prepareStatement(sql2);
	ps2 = null;
	ResultSet rs=null;
				if(token.equals(" ")){//TransID
					ps.setNull(1,0);
					ps1.setNull(1,0);
				}
				else{

					int tok = Integer.parseInt(token);
					//if(token == " " )
					//	ps.setNull(count,0);
					//else
					query+=token;
					query+="'";
					ps2 = conn.prepareStatement(query);
					rs = ps2.executeQuery();
					if(rs.next())
						wellExists = true;
					
					if(!wellExists)
						ps.setInt(1,tok);
					
					ps1.setInt(1,tok);
				}	
				
				token = request.getParameter("TransType");
					if(!wellExists)
						ps.setString(2,token);
		
				token = request.getParameter("TransName");
					if(!wellExists)
						ps.setString(3,token);	

				token = request.getParameter("WellID");
					int tok = Integer.parseInt(token);
					if(!wellExists)
						ps.setInt(4,tok);
				
				token = request.getParameter("Temperature");
					if(token.equals(" "))
						ps1.setNull(3,0);
					else
						ps1.setFloat(3,Float.parseFloat(token));

				token = request.getParameter("Conductivity");
					if(token.equals(" "))
						ps1.setNull(4,0);
					else
						ps1.setFloat(4,Float.parseFloat(token));

				token = request.getParameter("Pressure");
					if(token.equals(" "))
						ps1.setNull(5,0);
					else
						ps1.setFloat(5,Float.parseFloat(token));


				token = request.getParameter("Salinity");
					if(token.equals(" "))
						ps1.setNull(6,0);
					else
						ps1.setFloat(6,Float.parseFloat(token));
			
			
				token = request.getParameter("TDS");
					if(token.equals(" "))
						ps1.setNull(7,0);
					else
						ps1.setFloat(7,Float.parseFloat(token));
				
					
				java.util.Date date = new java.util.Date();
				java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
				ps1.setTimestamp(2, timestamp);



	if(!wellExists)
		ps.executeUpdate();

	ps1.executeUpdate();

	%>
	
 <Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b>
                     <% out.println(token); %>
  </td></tr></table>
 

	<%



}catch(Exception e){ 
	out.println(e);
	%>
	
  <Br><table border="2"><tr><td><b>Upload File has incorrect format, or information contains duplicates that violate constraints</b>
                     <% out.println(token); %>
  </td></tr></table>


	<%
}
%>
