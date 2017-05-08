<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>

	<body>



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
Connection conn;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");
boolean casingOccured = false;
Statement st=conn.createStatement();
%>

<% 
String lon = request.getParameter("long"); 
String lat = request.getParameter("lang"); 

String date = request.getParameter("date"); 
String true_amount = request.getParameter("true_amount"); 
String avg_amount = request.getParameter("avg_amount"); 
String comment = request.getParameter("comment"); 



String sql = "INSERT INTO Rainfall(longitude, latitude, date, true_amt, avg_amt, comment)";
sql += " VALUES(?,?,?,?, ?,?)";

String token = "";
ResultSet rs=null;
boolean success = true; 
ps = conn.prepareStatement (sql);
try {
	
	
	try{
  		Double.parseDouble(lon);
  		Double.parseDouble(lat);

	}
	catch(NumberFormatException e){

  		//throw new NumberFormatException(); 
  		success = false; 
  		%>
  		<script type="text/javascript">
  		var errorp = 'Submission Error:'
  		 			alert("\nVerify that longitude & latitude are real numbers!\n Please try again!"); 
 			window.history.back();
 		</script>
 		<%
	}
	finally{
		if(success==true){
			ps.setDouble(1,Double.parseDouble(lon));
			ps.setDouble(2,Double.parseDouble(lat));
		}
	}


	

	if(date.equals(" ") || date == null || date.isEmpty()){
		ps.setNull(3,0);
	}else{
			try{
	  			if(!date.matches("([0-9]{4})-([0-9]{2})-([0-9]{2})")){
	  				throw new InputMismatchException("date violates regex");
	  				 
	  			}
				ps.setDate(3,java.sql.Date.valueOf(date));
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

	}

	if(true_amount.equals(" ") || true_amount == null || true_amount.isEmpty()){
		ps.setNull(4,0);
	}else{
			try{
		  		Double.parseDouble(true_amount);

			}
			catch(NumberFormatException e){

		  		//throw new NumberFormatException(); 
		  		success = false; 
		  		%>
		  		<script type="text/javascript">
		  		var errorp = 'Submission Error:'

		 			alert( "\nVerify that true amount is a real number!\n Please try again!"); 
		 			window.history.back();
		 		</script>
		 		<%
			}
			finally{
				if(success==true){
					ps.setDouble(4,Double.parseDouble(true_amount));
				}
			}
		
	}

	if(avg_amount.equals(" ") || avg_amount == null || avg_amount.isEmpty()){
		ps.setNull(5,0);
	}
	else{
		try{
		  		Double.parseDouble(avg_amount);

			}
			catch(NumberFormatException e){

		  		//throw new NumberFormatException(); 
		  		success = false; 
		  		%>
		  		<script type="text/javascript">
		  		var errorp = 'Submission Error:'

		 			alert( "\nVerify that average amount is a real number!\n Please try again!"); 
		 			window.history.back();
		 		</script>
		 		<%
			}
			finally{
				if(success==true){
					ps.setDouble(5,Double.parseDouble(avg_amount));
				}
			}
		
	}

	if(comment.equals(" ") || comment == null || comment.isEmpty()){
		ps.setNull(6,0);
	}else{
		ps.setString(6,comment);
	}

	ps.executeUpdate ();
	
} //end of try

catch(Exception e){ 
	//out.println(e);
	
}
finally{
	
	if(success==true){
	%> 
	<script type="text/javascript">
 		alert("Submission Received!"); 
 		window.open("./rainfall.jsp","_self"); //for new page

 	</script>
	<%
	}

}
%> 

<!-- this is where I will put successfull submission --> 




</body>
</html>
