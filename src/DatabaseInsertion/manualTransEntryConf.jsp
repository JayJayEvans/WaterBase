<%@ page import="java.io.*" %>
 <%@ page language="java" %>
         <%@ page import="java.sql.*" %>
	          <%@ page import="java.sql.DriverManager.*" %>
		          <%@ page import="java.io.*" %>
			          <%@ page import="java.util.*" %>

<%     
PreparedStatement ps;
PreparedStatement ps2;
PreparedStatement ps3;
PreparedStatement ps4;
Connection conn;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");

Statement st=conn.createStatement();
%>

<%
boolean success = true;


%>


<%
String tran = "";
String token = "";
String sql = "INSERT INTO TransducerRecords(TransID,Temperature,Conductivity,Pressure,Salinity,TDS,DateTime) VALUES(?,?,?,?,?,?,?)";
try{

token = request.getParameter("TransID");
String stamp = "";

	ps = conn.prepareStatement (sql);
	ps2 = null;
	ResultSet rs=null;
				if(token.equals(" ") || token == null || token.isEmpty()){//TransID
					ps.setNull(1,0);
				}
				else{
					tran=token;
					int tok = Integer.parseInt(token);
						ps.setInt(1,tok);
					
				}	

				token = request.getParameter("Date");
				try{
					if(!token.matches("([0-9]{4})-([0-9]{2})-([0-9]{2})")){
						throw new InputMismatchException("date violates regex");
					}
					else
						stamp = token;
				}
				catch (InputMismatchException e){
						success = false;
						%>
						<script type="text/javascript">
							    var errorp = 'Submission Error:'
							    alert( "\nVerify that date is properly formatted\n Please try again!"); 
							    window.history.back();
						</script>
						<%
				}
				

				
				token = request.getParameter("Temperature");
				 if(token.equals(" ") || token == null || token.isEmpty())		
					ps.setNull(2,0);
					else
						ps.setFloat(2,Float.parseFloat(token));

				token = request.getParameter("Conductivity");
				 if(token.equals(" ") || token == null || token.isEmpty())
						ps.setNull(3,0);
					else
						ps.setFloat(3,Float.parseFloat(token));
				
				token = request.getParameter("Pressure");
						
				 if(token.equals(" ") || token == null || token.isEmpty())				
						ps.setNull(4,0);
					else
						ps.setFloat(4,Float.parseFloat(token));


				token = request.getParameter("Salinity");
					 if(token.equals(" ") || token == null || token.isEmpty())
						ps.setNull(5,0);
					else
						ps.setFloat(5,Float.parseFloat(token));
			
			
				token = request.getParameter("TDS");
						
					 if(token.equals(" ") || token == null || token.isEmpty())
						ps.setNull(6,0);
					else
						ps.setFloat(6,Float.parseFloat(token));
				
				
						
				token = request.getParameter("Time");
					try{
						if(!token.matches("([0-2][0-9]):([0-5][0-9]):([0-5][0-9])")){
							throw new InputMismatchException("time violates regex");
						}
						stamp += " ";
						stamp += token; 
						ps.setTimestamp(7,java.sql.Timestamp.valueOf(stamp));

					}
					catch (InputMismatchException e){
						success = false;
						%>
						<script type="text/javascript">
							    var errorp = 'Submission Error:'
							    alert( "\nVerify that time is properly formatted\n Please try again!"); 
							    window.history.back();
						</script>
						<%
					}
							




		ps.executeUpdate();


	%>
	
 <Br><table border="2"><tr><td><b>You have successfully inserted a new record for Transducer:</b>
                     <% out.println(tran); %>
  </td></tr></table>
 

	<%



}catch(Exception e){ 
	%>
	
  <Br><table border="2"><tr><td><b>Record Insertion Failed due to improper type entry, or information duplicates that violate constraints</b>
			  <br> <% out.println(e); %>
  </td></tr></table>


	<%
}
%>
