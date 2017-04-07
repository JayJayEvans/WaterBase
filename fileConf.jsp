<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

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
        ResultSet rs= null;
       Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");
      
         Statement st=conn.createStatement();
%> 
<%

File file = new File( request.getParameter ("name"));

%>


<% 
 
String sql = "INSERT INTO Well(WellID,AquiferCode,TypeCode,OwnerID,UsageState,PumpType,BottomElevation,WaterLevelElevation,SurfaceElevation,CasingID,Diameter,TopDepth,BottomDepth,Comments)";
sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
String sql2 = "INSERT INTO User(OwnerID,OwnerType,OwnerName) VALUES(?,?,?)";
String sql3 = "SELECT name from register where user=? And password =?";
String token;
try {  
ps = conn.prepareStatement (sql);
ps1 = conn.prepareStatement(sql2);
	Scanner sc = new Scanner(file);
	sc.useDelimiter(",");
	int count = 1;
	while(sc.hasNext()){
		token = sc.next();
			if((count == 4 || count == 5 || count == 6)){ //User info
				if(token.equals(" "))
					ps1.setNull(count,0);
				else{
					ps1.setString(count,token);
					if(count == 4)
						ps.setString(count,token);
				}
						
			}
			else if(count == 1 || count == 11){ //integer data
				if(token.equals(" "))
					ps.setNull(count,0);
				else
					ps.setInt(count,token);

			}
			else if(count == 8 || count == 9 || count == 10 || count == 12 || count == 13 || count == 14){ //Float data
				if(token.equals(" "))
					ps.setNull(count,0);

				else
					ps.setFloat(count,token);
			}
			
			else{ //varchar data
				if(token.equals(" ")
					ps.setNull(count,0);
				else
					ps.setString (count,token); 
			}
			count++;
	}


	ps1.executeUpdate();
	ps.executeUpdate (); 

	}catch(Exception e){ out.println(e);}
%>
</body>
</html>
