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
String wellID = "";
String aquifer ="";
String type = "";
String owner = "";
String wellQuery = "SELECT * FROM Well WHERE ";
String ownerQuery = "SELECT * FROM Owner WHERE ";
String transQuery = "SELECT * FROM Transducers WHERE ";
String token = "";
boolean needAnd = false;
boolean wellIdEntered = false;
boolean aquiferEntered = false;
boolean typeEntered = false;
boolean ownerEntered = false;
ResultSet rs=null;
ResultSet rs1=null;
ResultSet rs2=null;
%>
<%
try {
	
	wellID = request.getParameter("WellID");
	aquifer = request.getParameter("AquiferCode");
	type = request.getParameter("TypeCode");
	owner = request.getParameter("OwnerID");

	if(!wellID.equals("")){
		wellIdEntered = true;
		wellQuery += "WellID='";
		wellQuery += wellID;
		wellQuery += "'";
		transQuery += "WellID='";
		transQuery += wellID;
		transQuery += "'";
		needAnd = true;
	
	}



	if(!aquifer.equals("")){
		aquiferEntered=true;
		if(needAnd)
			wellQuery += " AND ";
		wellQuery += "AquiferCode='";
		wellQuery += aquifer;
		wellQuery += "'";
		needAnd=true;
	}
					


	if(!type.equals("")){
		typeEntered = true;
		if(needAnd)
			wellQuery += " AND ";
		wellQuery += "TypeCode='";
		wellQuery += type;
		wellQuery += "'";
		needAnd=true;
	}


	if(!owner.equals("")){
		ownerEntered = true;
		if(needAnd)
			wellQuery += " AND ";
		wellQuery += "OwnerID='";
		wellQuery += owner;
		wellQuery += "'";
		ownerQuery += "OwnerID='";
		ownerQuery += owner;
		ownerQuery += "'";
		needAnd=true;
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
	if(rs.next()){
		rs.beforeFirst();
		%>
		<b>
		<%
		out.println("Well Info: ");
		%>
		</b>
		<%
	
		rs.beforeFirst(); 
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
		rs.beforeFirst();
	}	
	if(!rs.next()){
		out.println(" <empty> ");
		%>
				<script>
				alert("No Results!");  
				window.history.back();
				</script>
	<%
	}
	
	
	
	%>
	<br><b>	
	<%
	rs.beforeFirst();
	if(rs.next()){
		out.print("Owner Info: ");
		%>
		</b>	
		<%

		if(!rs1.next()){
		
			out.println(" <empty>");
		
		}else{
			rs1.beforeFirst();
			while(rs1.next()){
						out.print(rs1.getInt(1) + " ");
						out.print(rs1.getString(2) + " ");
						out.print(rs1.getString(3) + " ");
					
			}
		}
		
	}
	rs.beforeFirst();
	%>
	<br><b>
	<%
	if(rs.next()){
		out.print("Transducer Info: ");
		%>
	</b>
		<%
		if(!rs2.next()){
		
			out.println(" <empty> ");
			
		}else{
				rs2.beforeFirst();
				while(rs2.next()){
					out.print(rs2.getInt(1) + " ");
					out.print(rs2.getString(2) + " ");
					out.print(rs2.getString(3) + " ");
					out.print(rs2.getInt(4) + " ");
				}
		}
	}
	out.println();



}catch(Exception e){ 
	

	%>
	<script>
	alert("Query Error!");  
	window.history.back();
	</script>

	<%
}
%>
</body>
</html>



<script src="./well_blank.jsp"></script>



