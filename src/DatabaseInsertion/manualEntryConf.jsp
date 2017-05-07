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
boolean ownerOccured = false;
Statement st=conn.createStatement();
%>

<%

String param = request.getParameter("WellID");

String sql = "INSERT INTO Well(WellID,AquiferCode,TypeCode,OwnerID,Latitude,Longitude,Country,State,WellDepth,UsageState,PumpType,BottomElevation,WaterLevelElevation,SurfaceElevation,CasingID,Comments)";
sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
String sql2 = "INSERT INTO Owner(OwnerType,OwnerName) VALUES(?,?)";
String sql3 = "INSERT INTO Casing(CasingID,Diameter,TopDepth,BottomDepth) VALUES(?,?,?,?)";
String query = "SELECT LAST_INSERT_ID()";
String token = "";
ResultSet rs=null;
%>
<%
try {
	ps = conn.prepareStatement (sql);
	ps1 = conn.prepareStatement(sql2,Statement.RETURN_GENERATED_KEYS);
	ps2 = conn.prepareStatement(sql3);
	ps3 = conn.prepareStatement(query);	
	if(param.equals(" ") || param == null || param.isEmpty()){
		ps.setNull(1,0);
	}
	else{
		ps.setInt(1,Integer.parseInt(param));
	}


	param = request.getParameter("AquiferCode");
	 if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(2,0);
	else
		ps.setString(2,param);

	param = request.getParameter("TypeCode");

		if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(3,0);
	else
		ps.setString(3,param);

	param = request.getParameter("Latitude");
	if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(5,0);
	else{
		float lat = Float.parseFloat(param);
		if(lat < -90 || lat > 90)
			throw new NumberFormatException("Latitude is bounded at -90 && +90");
		else{
			ps.setFloat(5,lat);
		}
	}
	
	param = request.getParameter("Longitude");

		if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(6,0);
		else{
		float longit = Float.parseFloat(param);
		if(longit < -180 || longit > 180)
			throw new NumberFormatException("Latitude is bounded at -180 && +180");
		ps.setFloat(6,longit);

		}

	param = request.getParameter("Country");

	if(param.equals(" ") || param == null || param.isEmpty())	
		ps.setNull(7,0);
	else
		ps.setString(7,param);

	param = request.getParameter("State");

	if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(8,0);
	else{
		ps.setString(8,param);
	}
	
	param = request.getParameter("WellDepth");

	if(param.equals(" ") || param == null || param.isEmpty())	
		ps.setNull(9,0);
	else
		ps.setFloat(9,Float.parseFloat(param));


	param = request.getParameter("UsageState");
	if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(10,0);
	else
		ps.setString(10,param);

	param = request.getParameter("PumpType");

	if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(11,0);
	else
		ps.setString(11,param);

	param = request.getParameter("BottomElevation");

	if(param.equals(" ") || param == null || param.isEmpty())	
		ps.setNull(12,0);
	else
		ps.setFloat(12,Float.parseFloat(param));


	param = request.getParameter("WaterLevelElevation");

	if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(13,0);
	else
		ps.setFloat(13,Float.parseFloat(param));



	param = request.getParameter("SurfaceElevation");

	if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(14,0);
	else
		ps.setFloat(14,Float.parseFloat(param));

	

	param = request.getParameter("CasingID");
	if(param.equals(" ") || param == null || param.isEmpty())
		ps.setNull(15,0);
	else{
		casingOccured=true;
		ps.setInt(15,Integer.parseInt(param));
		ps2.setInt(1,Integer.parseInt(param));		
	}
   
  

	param = request.getParameter("Diameter");

	if(param.equals(" ") || param == null || param.isEmpty()){
		if(casingOccured)
			ps2.setNull(2,0);	
	}
	else
		ps2.setFloat(2,Float.parseFloat(param));




	param = request.getParameter("TopDepth");

	if(param.equals(" ") || param == null || param.isEmpty()){
		if(casingOccured)
			ps2.setNull(3,0);
		}
	else
		ps2.setFloat(3,Float.parseFloat(param));



	param = request.getParameter("BottomDepth");
	if(param.equals(" ") || param == null || param.isEmpty()){
		if(casingOccured)
			ps2.setNull(4,0);
	}
	else
		ps2.setFloat(4,Float.parseFloat(param));

	param = request.getParameter("Comments");


	if(param.equals(" ") || param == null || param.isEmpty()){
			ps.setNull(16,0);
	}
	else
		ps.setString(16,param);


	param = request.getParameter("OwnerType");

	if(param.equals(" ") || param == null || param.isEmpty())
		ps1.setNull(1,0);
		else{
		ps1.setString(1,param);
		ownerOccured=true;
		}
	param = request.getParameter("OwnerName");

	if(param.equals(" ") || param == null || param.isEmpty())
		ps1.setNull(2,0);
		else{
		ps1.setString(2,param);
		ownerOccured=true;
		}
	if(ownerOccured){
		ps1.executeUpdate();
		rs = ps1.getGeneratedKeys();
		rs.next();
		ps.setInt(4,rs.getInt(1));
	}
	else
		ps.setNull(4,0);
	if(casingOccured)
		ps2.executeUpdate();


	ps.executeUpdate ();


	%>
	
 <Br><table border="2"><tr><td><b>Information Successfully Recorded!</b>
  </td></tr></table>
 

	<%



}catch(Exception e){ 
	%>
	
  <Br><table border="2"><tr><td><b>Error In Input! Data Failed To Be Inserted!</b>
  </td></tr></table>
	<%
	out.println(e);

}
%>
</body>
	</html>
