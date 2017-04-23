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
boolean wellExists = false;
File file = new File(saveFile);
%>


<%
String sql = "INSERT INTO Transducers(TransID,TransType,TransName,WellID) VALUES(?,?,?,?)";
String sql2 = "INSERT INTO TransducerRecords(TransID,InputTime,Temperature,Conductivity,Pressure,Salinity,TDS) VALUES(?,?,?,?,?,?,?)";
String query = "SELECT WellID FROM Transducers WHERE TransID='";

String token = "";
%>
<%
try {
	ps = conn.prepareStatement (sql);
	ps1 = conn.prepareStatement(sql2);
	ps2 = null;
	ResultSet rs=null;
	Scanner sc = new Scanner(file);
	sc.useDelimiter(",");
	int count = 1;
	int recordCount = 1;
	while(sc.hasNext()){
		if(count != 5)
			token = sc.next();
		
		switch(count){
				case 1:{//TransID
					int tok = Integer.parseInt(token);
					//if(token == " " )
					//	ps.setNull(count,0);
					//else
					query+=token;
					query+="'";
					ps2 = conn.prepareStatement(query);
					rs = ps2.executeQuery();
					if(rs.next())
						wellExists = true;
					
					if(!wellExists)
						ps.setInt(count,tok);
					
					ps1.setInt(recordCount,tok);
						recordCount++;
					}	
					break;


				case 2: //TransType
				case 3: //TypeName
					if(!wellExists)
						ps.setString(count,token);
					break;
			
				case 4://WellID
					int tok = Integer.parseInt(token);
					//if(token == " " )
					//	ps.setNull(count,0);
					//else
					if(!wellExists)
						ps.setInt(count,tok);
					break;

				case 5:
					java.util.Date date = new java.util.Date();
					java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
					ps1.setTimestamp(recordCount, timestamp);
					recordCount++;

					break;


				case 6: //Temperature
				case 7: //conductivity
				case 8: //Pressure
				case 9: //Salinity
				case 10: //TDS
					if(token.equals(" "))
						ps1.setNull(recordCount,0);
					else{	
						ps1.setFloat(recordCount,Float.parseFloat(token));
					}
					recordCount++;
					break;

	
			
			}
		count++;
	}
	if(!wellExists)	
	ps.executeUpdate ();
	ps1.executeUpdate();

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
