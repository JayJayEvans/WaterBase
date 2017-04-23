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
PreparedStatement ps3;
PreparedStatement ps4;
Connection conn;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");

Statement st=conn.createStatement();
%>

<%

File file = new File(saveFile);
%>


<%
String sql = "INSERT INTO Well(WellID,AquiferCode,TypeCode,OwnerID,Latitude,Longitude,Country,State,WellDepth,UsageState,PumpType,BottomElevation,WaterLevelElevation,SurfaceElevation,CasingID,Comments)";
sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
String sql2 = "INSERT INTO Owner(OwnerType,OwnerName) VALUES(?,?)";
String sql3 = "INSERT INTO Casing(CasingID,Diameter,TopDepth,BottomDepth) VALUES(?,?,?,?)";
String query = "SELECT LAST_INSERT_ID()";
String token = "";
boolean casingOccured = true;
%>
<%
try {
	ps = conn.prepareStatement (sql);
	ps1 = conn.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);
	ps2 = conn.prepareStatement(query);
	ps3 = conn.prepareStatement(sql3);
	ps4 = conn.prepareStatement(query);
	ResultSet rs=null;
	Scanner sc = new Scanner(file);
	sc.useDelimiter(",");
	int count = 1;
	int wellID = -1;
	while(sc.hasNext()){
		if(count !=4)
			token = sc.next();
		switch(count){
				case 1://WellID
					int tok = Integer.parseInt(token);
					wellID = tok;
					//if(token == " " )
					//	ps.setNull(count,0);
					//else
					ps.setInt(count,tok);
					break;

				case 2: //AquiferCode
				case 3: //TypeCode

					ps.setString(count,token);
					break;


				case 5: //OwnerType
					if(token.equals(" "))
						ps.setNull(4,0);
					else{
						ps1.setString(1,token);
					}
					break;

				case 6: //OwnerName
					if(token.equals(" "))
						ps.setNull(4,0);
					else{	
						ps1.setString(2,token);
						ps1.executeUpdate();
						rs = ps1.getGeneratedKeys();
						rs.next();
						ps.setInt(4,rs.getInt(1));
					}
					break;

	
				case 7: //Latitude
				case 8: //Longitude
				case 11://WellDepth
				case 14://BottomElevation
				case 15://WaterLevelElevation
				case 16://SurfaceElevation
								
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

					if(token.equals(" "))
						ps.setNull(count-2,0);
					else
						ps.setString(count-2,token);
					break;
			


				case 17://casingID
					if(token.equals(" ")){
						ps.setNull(count-2,0);
						casingOccured=false;
					}
					else{
						int intTok = Integer.parseInt(token);
						ps.setInt(count-2,intTok);
						ps3.setInt(1,intTok);
					}
					break;


				case 18:{//Diameter{
				
					if(token.equals(" ") )
						ps3.setNull(2,0);
					else{
						float floatTok = Float.parseFloat(token);
						ps3.setFloat(2,floatTok);
					}

				}
						break;
				

				case 19:{//TopDepth{
					if(token.equals(" ") )
						ps3.setNull(3,0);
					else{
						float floatTok = Float.parseFloat(token);
						ps3.setFloat(3,floatTok);
					}

				}
					break;
				
			
				case 20:{//BottomDepth{
					
					if(token.equals(" ") )
						ps3.setNull(4,0);
					else{
						float floatTok = Float.parseFloat(token);
						ps3.setFloat(4,floatTok);
					}
					if(casingOccured)
						ps3.executeUpdate();
				}	
					break;
				
				case 21://comments

					if(token.equals(" "))
						ps.setNull(16,0);
					else
						ps.setString(16,token);
					
				ps.executeUpdate();
				count = 0;		
						
				break;

			
			}
		count++;
	}



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
