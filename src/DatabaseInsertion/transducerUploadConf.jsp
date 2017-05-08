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
boolean success =true;
Statement st=conn.createStatement();
String line = "";
%>

<%
File file = new File(saveFile);
%>


<%
String sql2 = "INSERT INTO TransducerRecords(TransID,Temperature,Conductivity,Pressure,Salinity,TDS,DateTime) VALUES(?,?,?,?,?,?,?)";
Scanner scan = new Scanner(file);
try{
while(scan.hasNextLine()){
line = scan.nextLine();

String token = "";
%>
<%
	String stamp ="";
	ps1 = conn.prepareStatement(sql2);
	ps2 = null;
	ResultSet rs=null;
	Scanner sc = new Scanner(line);
	sc.useDelimiter(",");
	int count = 1;
	int recordCount = 1;
	boolean atLeastOne = false;
	success = true;
	while(sc.hasNext()){
			token = sc.next();
		
		switch(recordCount){
				case 1:{//TransID
					int tok = Integer.parseInt(token);
					
					ps1.setInt(recordCount,tok);
					}	
				break;



				case 2: //Temperature
				case 3: //conductivity
				case 4: //Pressure
				case 5: //Salinity
				case 6: //TDS
					if(token.equals(" "))
						ps1.setNull(recordCount,0);
					else{	
						atLeastOne=true;
						ps1.setFloat(recordCount,Float.valueOf(token));
					}
					break;
				case 7:
					if(token.equals(" "))
						ps1.setNull(recordCount,0);
					else{
						try{
							if(!token.matches("([0-9]{4})-([0-9]{2})-([0-9]{2})")){
								throw new InputMismatchException("date violates regex");

						 	}
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
						 	if(success == true)
						 		stamp = token;

					}
					break;
				case 8:

				try{
				if(!token.matches("([0-2][0-9]):([0-5][0-9]):([0-5][0-9])"))
					throw new InputMismatchException("time violates regex");

				}
				catch (InputMismatchException e){
				success = false;
				%>
				<script type="text/javascript">
					    var errorp = 'Submission Error:'
					    alert( "\nVerify that time is properly formatted\n Please try again!"); 
					    window.history.back();
				</script>
				<%
				}
					if(success == true){
						stamp += " ";
						stamp += token;
						ps1.setTimestamp(7,java.sql.Timestamp.valueOf(stamp));
					}



				break;
			}
			recordCount++;
	}

	if(!atLeastOne)
		throw new InputMismatchException("Need at Least One of the Optional Fields!");
	ps1.executeUpdate();

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
			  <% out.println(saveFile); %><br>
			  <% out.println("Line: " + line); %>
  </td></tr></table>


	<%
}
file.delete();
}
%>
