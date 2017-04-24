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
Statement st=conn.createStatement();
%>

<%

String param = "Hello";
%> 
     <Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b>
                                 <% out.println(param); %> 
     </td></tr></table>
                                                                  <%
%>


<%
String wellQuery = "SELECT * FROM Well WHERE ";
String ownerQuery = "SELECT * FROM Owner WHERE ";
String transQuery = "SELECT * FROM Transducers WHERE ";
String token = "";
boolean needAnd = false;
ResultSet rs=null;
ResultSet rs1=null;
ResultSet rs2=null;
%>
<%
try {
	
	param = request.getParameter("WellID");
	if(!param.equals("")){
		wellQuery += "WellID='";
		wellQuery += param;
		wellQuery += "'";
		transQuery += "WellID='";
		transQuery += param;
		transQuery += "'";
		needAnd = true;
	
	}


	param = request.getParameter("AquiferCode");

	if(!param.equals("")){
		if(needAnd)
			wellQuery += " AND ";
		wellQuery += "AquiferCode='";
		wellQuery += param;
		wellQuery += "'";
	}
					


	param = request.getParameter("TypeCode");

	if(!param.equals("")){
		if(needAnd)
			wellQuery += " AND ";
		wellQuery += "TypeCode='";
		wellQuery += param;
		wellQuery += "'";

	}
	param = request.getParameter("OwnerID");

	if(!param.equals("")){
		if(needAnd)
			wellQuery += " AND ";
		wellQuery += "OwnerID='";
		wellQuery += param;
		wellQuery += "'";
		ownerQuery += "OwnerID='";
		ownerQuery += param;
		ownerQuery += "'";
	}
	//out.println(wellQuery);
	//out.println(ownerQuery);
	//out.println(transQuery);	
	ps = conn.prepareStatement(wellQuery);
	ps1 = conn.prepareStatement(ownerQuery);
	ps2 = conn.prepareStatement(transQuery);
	rs = ps.executeQuery();
	rs1 = ps1.executeQuery();
	rs2 = ps2.executeQuery();
	
	int count = 1;
	while(rs.next()){
		out.print(rs.getInt(1) + " ");
		out.print(rs.getString(2) + " ");
		out.print(rs.getString(3) + " ");
		out.print(rs.getInt(4) + " ");
		out.print(rs.getFloat(5) + " ");
		out.print(rs.getFloat(6) + " ");
		out.print(rs.getString(7) + " ");
		out.print(rs.getString(8) + " ");
		out.print(rs.getFloat(9) + " ");
		out.print(rs.getString(10) + " ");
		out.print(rs.getString(11) + " ");
		out.print(rs.getFloat(12) + " ");
		out.print(rs.getFloat(13) + " ");
		out.print(rs.getFloat(14) + " ");
		out.print(rs.getInt(15) + " ");
		out.print(rs.getString(16) + " ");
		
	}
	out.println();
	count = 1;
	while(rs1.next()){
		out.print(rs1.getString(count) + " ");
		count++;
	}
	out.println();
	count = 1;
	while(rs2.next()){
		out.println(rs2.getString(count));
		count++;	
	}
	out.println();

	%>
	
 <Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b>
  </td></tr></table>
 

	<%



}catch(Exception e){ 
	out.println(e);
	%>
	
  <Br><table border="2"><tr><td><b>Upload File has incorrect format, or information contains duplicates that violate constraints</b>
  </td></tr></table>


	<%
}
%>
</body>
	</html>
