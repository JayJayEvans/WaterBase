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
Connection conn;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");

Statement st=conn.createStatement();
%>

<%

String param = request.getParameter("WellID");
 %> 
     <Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b>
                                 <% out.println(param); %> 
     </td></tr></table>
                                                                  <%
%>


<%
String sql = "INSERT INTO Well(WellID,AquiferCode,TypeCode,OwnerID,Latitude,Longitude,Country,State,WellDepth,UsageState,PumpType,BottomElevation,WaterLevelElevation,SurfaceElevation,CasingID,Diameter,TopDepth,BottomDepth,Comments)";
sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
String sql2 = "INSERT INTO Owner(WellID,OwnerType,OwnerName,State) VALUES(?,?,?,?)";
String query = "Select OwnerID from Owner where WellID=";
String token = "";
%>
<%
try {
	ps = conn.prepareStatement (sql);
	ps1 = conn.prepareStatement(sql2);
	
	if(param.equals(" ")){
		ps.setNull(1,0);
	}
	else{
		query+=param;
		ps.setInt(1,Integer.parseInt(param));
		ps1.setInt(1,Integer.parseInt(param));

	}


	param = request.getParameter("AquiferCode");

	if(param.equals(" "))
		ps.setNull(2,0);
	else
		ps.setString(2,param);

	param = request.getParameter("TypeCode");

	if(param.equals(" "))
		ps.setNull(3,0);
	else
		ps.setString(3,param);

	param = request.getParameter("Latitude");

	if(param.equals(" "))
		ps.setNull(5,0);
	else
		ps.setFloat(5,Float.parseFloat(param));

	
	param = request.getParameter("Longitude");

	if(param.equals(" "))
		ps.setNull(6,0);
	else
		ps.setFloat(6,Float.parseFloat(param));

	
	param = request.getParameter("Country");

	if(param.equals(" "))
		ps.setNull(7,0);
	else
		ps.setString(7,param);

	param = request.getParameter("State");

	if(param.equals(" "))
		ps.setNull(8,0);
	else{
		ps1.setString(4,param);
		ps.setString(8,param);
	}
	
	param = request.getParameter("WellDepth");

	if(param.equals(" "))
		ps.setNull(9,0);
	else
		ps.setFloat(9,Float.parseFloat(param));


	param = request.getParameter("UsageState");

	if(param.equals(" "))
		ps.setNull(10,0);
	else
		ps.setString(10,param);

	param = request.getParameter("PumpType");

	if(param.equals(" "))
		ps.setNull(11,0);
	else
		ps.setString(11,param);

	param = request.getParameter("BottomElevation");

	if(param.equals(" "))
		ps.setNull(12,0);
	else
		ps.setFloat(12,Float.parseFloat(param));


	param = request.getParameter("WaterLevelElevation");

	if(param.equals(" "))
		ps.setNull(13,0);
	else
		ps.setFloat(13,Float.parseFloat(param));



	param = request.getParameter("SurfaceElevation");

	if(param.equals(" "))
		ps.setNull(14,0);
	else
		ps.setFloat(14,Float.parseFloat(param));

	

	param = request.getParameter("CasingID");

	if(param.equals(" "))
		ps.setNull(15,0);
	else
		ps.setInt(15,Integer.parseInt(param));

   %>
   
    <Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b>
			      </td></tr></table>
  
   
              <%

	param = request.getParameter("Diameter");

	if(param.equals(" "))
		ps.setNull(16,0);
	else
		ps.setFloat(16,Float.parseFloat(param));




	param = request.getParameter("TopDepth");

	if(param.equals(" "))
		ps.setNull(17,0);
	else
		ps.setFloat(17,Float.parseFloat(param));



	param = request.getParameter("BottomDepth");

	if(param.equals(" "))
		ps.setNull(18,0);
	else
		ps.setFloat(18,Float.parseFloat(param));

	param = request.getParameter("Comments");

	if(param.equals(" "))
		ps.setNull(19,0);
	else
		ps.setString(19,param);


	param = request.getParameter("OwnerType");

	if(param.equals(" "))
		ps1.setNull(2,0);
	else
		ps1.setString(2,param);


	param = request.getParameter("OwnerName");

	if(param.equals(" "))
		ps1.setNull(3,0);
	else
		ps1.setString(3,param);





	ps2 = conn.prepareStatement(query);	
	ps1.executeUpdate();
	ResultSet rs = ps2.executeQuery();
	if(rs.next())
		ps.setInt(4,rs.getInt("OwnerID"));
	ps.executeUpdate ();


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
