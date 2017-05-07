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
PreparedStatement ps4;

Connection conn;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");
Statement st=conn.createStatement();

String transID = "";
String wellID = "";
String begDate = "";
String endDate = "";
String begTime = "";
String endTime = "";
%> 

     <Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b> 
     </td></tr></table>

<%
String wellQuery = "SELECT * FROM Well WHERE ";
String timeQuery = "SELECT * FROM TransducerRecords WHERE ";
String transQuery = "SELECT * FROM Transducers WHERE ";
String token = "";

boolean needAndWell = false;
boolean needAndTime = false;
boolean needAndTrans = false;

boolean wellIdEntered = false;
boolean transIdEntered = false;
boolean begDateEntered = false;
boolean endDateEntered = false;
boolean begTimeEntered = false;
boolean endTimeEntered = false;

ResultSet rs=null;
ResultSet rs1=null;
ResultSet rs2=null;
%>
<%
try {
	
	transID = request.getParameter("TransID");
	wellID = request.getParameter("WellID");
	begDate = request.getParameter("begDate");
	begTime = request.getParameter("begTime");
	
	//You need the TransID and/or the WellID in order to query
	if(!transID.equals("")){
		transIdEntered = true;
	
		transQuery += "TransID='";
		transQuery += transID;
		transQuery += "'";
		
		timeQuery += "TransID='";
		timeQuery += transID;
		timeQuery += "'"; 
		
		needAndTrans = true;
		needAndTime = true;
	}

	if(!wellID.equals("")){
		wellIdEntered = true;
	
		wellQuery += "WellID='";
		wellQuery += wellID;
		wellQuery += "'";
	
		transQuery += "WellID='";
		transQuery += wellID;
		transQuery += "'";
	
		needAndWell = true;
		needAndTrans = true;	
	}

	if(!begDate.equals("")){
		begDateEntered = true;
		endDate = request.getParameter("endDate");
		
		if(needAndTime)
			timeQuery += " AND ";

		timeQuery += "Date='";
		timeQuery += begDate;
		timeQuery += "'";
		
		needAndTime = true;
	}

	if(!begTime.equals("")){
		begTimeEntered = true;
		endTime = request.getParameter("endTime");

		if(needAndTime)
			timeQuery += " AND ";

		timeQuery += "Time='";
		timeQuery += begTime;
		timeQuery += "'";
		
		needAndTime = true;
	}
					
	if(!endDate.equals("")){
		endDateEntered = true;

		if(needAndTime)
			timeQuery += " AND ";

		timeQuery += "Date='";
		timeQuery += endDate;
		timeQuery += "'";
		
		needAndTime = true;
	}

	if(!endTime.equals("")){
		endTimeEntered = true;

		if(needAndTime)
			timeQuery += " AND ";

		timeQuery += "Time='";
		timeQuery += endTime;
		timeQuery += "'";

		needAndTime = true;
	}	
	


	if(wellIdEntered == false){
		String getWellID = "SELECT WellID FROM Well WHERE ";
		if(ownerEntered){
			getWellID += "OwnerID='";
			getWellID += owner;
			getWellID += "'";
		}
		else if(typeEntered){
			getWellID += "TypeCode='";
			getWellID += type;
			getWellID += "'";
		}
		else if(aquiferEntered){
			getWellID += "AquiferCode='";
			getWellID += aquifer;
			getWellID += "'";

		}
		ps4 = conn.prepareStatement(getWellID);
		ResultSet rs4 = ps4.executeQuery();

		while(rs4.next())
			wellID = Integer.toString(rs4.getInt("WellID"));

		transQuery += "WellID='";
		transQuery += wellID;
		transQuery += "'";

	}



	if(ownerEntered==false){
		String getOwner = "SELECT OwnerID FROM Well WHERE WellID='";
		getOwner += wellID;
		getOwner += "'";
		//out.println(getOwner);
		ps3 = conn.prepareStatement(getOwner);
		ResultSet rs3 = ps3.executeQuery();

		while(rs3.next()){
			owner = Integer.toString(rs3.getInt("OwnerID"));
		
		
		}
		ownerQuery += "OwnerID='";
		ownerQuery += owner;
		ownerQuery += "'";
		}


	//out.println(wellQuery);
	//out.println(ownerQuery);
	//out.println(transQuery);	
	ps = conn.prepareStatement(wellQuery);
	ps1 = conn.prepareStatement(ownerQuery);
	ps2 = conn.prepareStatement(transQuery);
	rs = ps.executeQuery();
	if(rs.next())
		rs1 = ps1.executeQuery();
	rs.beforeFirst();
	if(rs.next())
		rs2 = ps2.executeQuery();
	rs.beforeFirst();

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
	%>
		<Br>

	<%
	rs.beforeFirst();
	if(rs.next()){
		while(rs1.next()){
			out.print(rs1.getInt(1) + " ");
			out.print(rs1.getString(2) + " ");
			out.print(rs1.getString(3) + " ");
		
		}
	}
	rs.beforeFirst();
	%>
		<Br>
	<%
	if(rs.next()){
		while(rs2.next()){
			out.print(rs2.getInt(1) + " ");
			out.print(rs2.getString(2) + " ");
			out.print(rs2.getString(3) + " ");
			out.print(rs2.getInt(4) + " ");
		}
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