<%@ page import="java.io.*" %>
 <%@ page language="java" %>
         <%@ page import="java.sql.*" %>
	          <%@ page import="java.sql.DriverManager.*" %>
		          <%@ page import="java.io.*" %>
			          <%@ page import="java.util.*" %>
<%
String saveFile = "";
String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
	DataInputStream in = new DataInputStream(request.getInputStream());
	int formDataLength = request.getContentLength();
	byte dataBytes[] = new byte[formDataLength];
	int byteRead = 0;
	int totalBytesRead = 0;
	while (totalBytesRead < formDataLength) {
		byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
		totalBytesRead += byteRead;
	}
	String filer = new String(dataBytes);
	saveFile = filer.substring(filer.indexOf("filename=\"") + 10);
	saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
	saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
	int lastIndex = contentType.lastIndexOf("=");
	String boundary = contentType.substring(lastIndex + 1,contentType.length());
	int pos;
	pos = filer.indexOf("filename=\"");
	pos = filer.indexOf("\n", pos) + 1;
	pos = filer.indexOf("\n", pos) + 1;
	pos = filer.indexOf("\n", pos) + 1;
	int boundaryLocation = filer.indexOf(boundary, pos) - 4;
	int startPos = ((filer.substring(0, pos)).getBytes()).length;
	int endPos = ((filer.substring(0, boundaryLocation)).getBytes()).length;
	FileOutputStream fileOut = new FileOutputStream(saveFile);
	fileOut.write(dataBytes, startPos, (endPos - startPos));
	fileOut.flush();
	fileOut.close();
		

%>


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

File file = new File(saveFile);
%>


<%
String sql = "INSERT INTO Well(WellID,AquiferCode,TypeCode,OwnerID,Latitude,Longitude,Country,State,WellDepth,UsageState,PumpType,BottomElevation,WaterLevelElevation,SurfaceElevation,CasingID,Diameter,TopDepth,BottomDepth,Comments)";
sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
String sql2 = "INSERT INTO Owner(WellID,OwnerType,OwnerName,State) VALUES(?,?,?,?)";
String sql3 = "SELECT name from register where user=? And password =?";
String query = "Select OwnerID from Owner where WellID=";
String token = "";
%>
<%
try {
	ps = conn.prepareStatement (sql);
	ps1 = conn.prepareStatement(sql2);
	Scanner sc = new Scanner(file);
	sc.useDelimiter(",");
	int count = 1;
	int wellID = -1;
	while(sc.hasNext()){
	if(count !=4)
		token = sc.next();
		switch(count){
				case 1://WellID
					query += token;
					int tok = Integer.parseInt(token);
					wellID = tok;
					//if(token == " " )
					//	ps.setNull(count,0);
					//else
						ps.setInt(count,tok);

					break;

				case 2: //AquiferCode
				case 3: //TypeCode

					if(token.equals(" "))
						ps.setNull(count,0);
					else
						ps.setString(count,token);
					break;


				case 5: //OwnerType
					if(token.equals(" "))
						ps1.setNull(2,0);
					else{
						ps1.setString(2,token);
						ps1.setInt(1,wellID);
					}
					break;

				case 6: //OwnerName
					if(token.equals(" "))
						ps1.setNull(3,0);
					else{
						ps1.setString(3,token);
						ps1.setInt(1,wellID);
					}
					break;

	
				case 7: //Latitude
				case 8: //Longitude
				case 11://WellDepth
				case 14://BottomElevation
				case 15://WaterLevelElevation
				case 16://SurfaceElevation
				case 18://Diameter
				case 19://TopDepth
				case 20://BottomDepth
					
					if(token.equals(" "))
						ps.setNull(count-2,0);

					else{
						float toke = Float.parseFloat(token);	
						ps.setFloat(count-2,toke);
					}
					break;


				case 9: //Country
				case 10://State
				case 12: //usageState
				case 13: //PumpType
				case 21://comments

					if(token.equals(" "))
						ps.setNull(count-2,0);
					else
						ps.setString(count-2,token);
					if(count == 10)
						ps1.setString(4,token);
					break;


				case 17:
					if(token.equals(" ") )
						ps.setNull(count-2,0);
					else{
						int intTok = Integer.parseInt(token);
						ps.setInt(count-2,intTok);
					
					}
					break;

				}
		count++;
	}

	ps2 = conn.prepareStatement(query);	
	ps1.executeUpdate();
	ResultSet rs = ps2.executeQuery();
	if(rs.next())
		ps.setInt(4,rs.getInt("OwnerID"));
	ps.executeUpdate ();


	%>
	
 <Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b>
                     <% out.println(saveFile); %>
  </td></tr></table>
 

	<%



}catch(Exception e){ 
	out.println(e);
	%>
	
  <Br><table border="2"><tr><td><b>Upload File has incorrect format, or information contains duplicates that violate constraints</b>
                     <% out.println(saveFile); %>
  </td></tr></table>


	<%
}
file.delete();
}
%>
