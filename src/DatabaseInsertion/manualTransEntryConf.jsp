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
String token = "";
String sql = "INSERT INTO TransducerRecords(TransID,Date,Temperature,Conductivity,Pressure,Salinity,TDS,Time) VALUES(?,?,?,?,?,?,?,?)";
try{

token = request.getParameter("TransID");

	ps = conn.prepareStatement (sql);
	ps2 = null;
	ResultSet rs=null;
				if(token.equals(" ") || token == null || token.isEmpty()){//TransID
					ps.setNull(1,0);
				}
				else{

					int tok = Integer.parseInt(token);
						ps.setInt(1,tok);
					
				}	

				token = request.getParameter("Date");
				try{
					if(!token.matches("([0-9]{2})/([0-9]{2})/([0-9]{4})")){
						throw new InputMismatchException("date violates regex");
					}
					String tokenz = token;
					String[] output = tokenz.split("/");
					int year = Integer.parseInt(output[2]);
					int month = Integer.parseInt(output[0]);
					int day = Integer.parseInt(output[1]);
					int []daysinmonth={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
					if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
						daysinmonth[1]=29;
					if (month<13){
						if( day <= daysinmonth[month-1] )
							ps.setString(2,token);
					}
					else
						throw new InputMismatchException("Date Is Not Valid");
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
					ps.setNull(3,0);
					else
						ps.setFloat(3,Float.parseFloat(token));

				token = request.getParameter("Conductivity");
				 if(token.equals(" ") || token == null || token.isEmpty())
						ps.setNull(4,0);
					else
						ps.setFloat(4,Float.parseFloat(token));
				
				token = request.getParameter("Pressure");
						
				 if(token.equals(" ") || token == null || token.isEmpty())				
						ps.setNull(5,0);
					else
						ps.setFloat(5,Float.parseFloat(token));


				token = request.getParameter("Salinity");
					 if(token.equals(" ") || token == null || token.isEmpty())
						ps.setNull(6,0);
					else
						ps.setFloat(6,Float.parseFloat(token));
			
			
				token = request.getParameter("TDS");
						
					 if(token.equals(" ") || token == null || token.isEmpty())
						ps.setNull(7,0);
					else
						ps.setFloat(7,Float.parseFloat(token));
				
				
						
				token = request.getParameter("Time");
					try{
						if(!token.matches("([0-2][0-9]):([0-5][0-9]):([0-5][0-9])")){
							throw new InputMismatchException("time violates regex");
						}
						ps.setString(8,token);

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
