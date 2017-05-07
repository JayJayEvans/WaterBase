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
%> 

     <Br><table border="2"><tr><td><b>You have successfully upload the file by the name of:</b> 
     </td></tr></table>

<%
//Java

//Strings to get the values from the text fields
String transIDStr = "";
int transIDInt = -1;
String wellIDStr = "";
int wellIDInt = -1;
String begDate = "";
String endDate = "";
String begTime = "";
String endTime = "";
String token = "";

boolean wellIdEntered = false;
boolean transIdEntered = false;
boolean begDateEntered = false;
boolean endDateEntered = false;
boolean begTimeEntered = false;
boolean endTimeEntered = false;
boolean raincheck = false;

ResultSet rs=null;
ResultSet rs1=null;
ResultSet rs2=null;
%>
<%
try {
	transIDStr = request.getParameter("tran_id");
	wellIDStr = request.getParameter("well_id");
	begDate = request.getParameter("begDate");
	begTime = request.getParameter("begTime");
	endDate = request.getParameter("endDate");
	endTime = request.getParameter("endTime");
	

	if(!transIDStr.equals("")){
		transIdEntered = true;
		transIDInt = Integer.parseInt(transIDStr);
	}

	if(!wellIDStr.equals("")){
		wellIdEntered = true;
		wellIDInt = Integer.parseInt(wellIDStr);
	}

	if(!begDate.equals("")){
		begDateEntered = true;
	}

	if(!begTime.equals("")){
		begTimeEntered = true;
	}
					
	if(!endDate.equals("")){
		endDateEntered = true;
	}

	if(!endTime.equals("")){
		endTimeEntered = true;
	}	

	//If the checkbox is checked
	if(request.getParameter( "getRain" ) == "rain"){
		raincheck = true;
	}
	

	//ERROR CHECK
	if(!transIdEntered && !wellIdEntered){
%> 
    <script> 
        alert("Transducer ID and/or Well ID must be provided!\nPlease Try again!"); 
        window.history.back();
    </script>
<%
  	}

  	//ERROR CHECK
  	if((begDateEntered && !endDateEntered) || (!begDateEntered && endDateEntered)){
%> 
    <script> 
        alert("You must provide a start date and an end date!\nPlease Try again!"); 
        window.history.back();
    </script>
<%
  	}

  	//ERROR CHECK
  	if((begTimeEntered && !endTimeEntered) || (!begTimeEntered && endTimeEntered)){
%> 
    <script> 
        alert("You must provide a start time and an end time!\nPlease Try again!"); 
        window.history.back();
    </script>
<%
  	}

  	if(!raincheck) {

	  	//Query for when only the transID is entered
	  	if(transIdEntered && !wellIdEntered && !begDateEntered && !endDateEntered &&
	  		!begTimeEntered && !endTimeEntered) {	  		
			String transID_Query = new String();
			transID_Query = String.format("SELECT * FROM TransducerRecords WHERE TransID = %d ORDER BY Date ASC, Time;", transIDInt);

			ps = conn.prepareStatement(transID_Query);
	        rs = ps.executeQuery();
	  	}
	    //Query for when the transID and start/end date are entered
	  	else if(transIdEntered && !wellIdEntered && begDateEntered && endDateEntered &&
	  		!begTimeEntered && !endTimeEntered) {

	  		//Set default values for time
	  		begTime = "00:00:00";
	  		endTime = "23:59:59";
			
			String transID_date_Query = new String();
			transID_date_Query = String.format("(SELECT * FROM TransducerRecords WHERE TransID = %d AND Date = %s AND Time = %s) EXCEPT (SELECT * FROM TransducerRecords WHERE TransID = %d AND Date = %s AND Time = %s) ORDER BY Date ASC, Time;", transIDInt, begDate, begTime, transIDInt, endDate, endTime);

			ps = conn.prepareStatement(transID_date_Query);
	        rs = ps.executeQuery();
	  	}
	    //Query for when the transID and start/end date and time are entered
	  	else if(transIdEntered && !wellIdEntered && begDateEntered && endDateEntered &&
	  		begTimeEntered && endTimeEntered) {
			
			String transID_date_time_Query = new String();
			transID_date_time_Query = String.format("(SELECT * FROM TransducerRecords WHERE TransID = %d AND Date = %s AND Time = %s) EXCEPT (SELECT * FROM TransducerRecords WHERE TransID = %d AND Date = %s AND Time = %s) ORDER BY Date ASC, Time;", transIDInt, begDate, begTime, transIDInt, endDate, endTime);

			ps = conn.prepareStatement(transID_date_time_Query);
	        rs = ps.executeQuery();
	  	}
	  	//Query for when only the wellID is entered
	  	else if(!transIdEntered && wellIdEntered && !begDateEntered && !endDateEntered &&
	  		!begTimeEntered && !endTimeEntered) {
	  		
			String wellID_Query = new String();
			wellID_Query = String.format("SELECT r.* FROM Transducers t, TransducerRecords r WHERE t.TransID = r.TransID AND t.WellID = %d", wellIDInt);
	  	}
		//Query for when the wellID and start/end date are entered
	  	else if(!transIdEntered && wellIdEntered && begDateEntered && endDateEntered &&
	  		!begTimeEntered && !endTimeEntered) {
	  		
			String wellID_date_Query = new String();
			wellID_date_Query = String.format("SELECT * FROM Transducers WHERE ");
	  	}
		//Query for when the wellID and start/end date and time are entered
	  	else if(!transIdEntered && wellIdEntered && begDateEntered && endDateEntered &&
	  		begTimeEntered && endTimeEntered) {
	  		
			String wellID_date_time_Query = new String();
			wellID_date_time_Query = String.format("SELECT * FROM Transducers WHERE ");
	  	}
		//Query for when the transID and wellID are entered
	  	else if(transIdEntered && wellIdEntered && !begDateEntered && !endDateEntered &&
	  		!begTimeEntered && !endTimeEntered) {
	  		
	  		//ERROR CHECK

			String transID_wellID_Query = new String();
			transID_wellID_Query = String.format("SELECT * FROM Transducers WHERE ");
	  	}
		//Query for when the transID, wellID and start/end date and time are entered
	  	else if(!transIdEntered && wellIdEntered && begDateEntered && endDateEntered &&
	  		begTimeEntered && endTimeEntered) {
	  		
			String transID_wellID_date_time_Query = new String();
			transID_wellID_date_time_Query = String.format("SELECT * FROM Transducers WHERE ");
	  	}
%>

        <center><table style="width:50%">
        <tr>
        <th align='center'>Transducer ID</th>
        <th align='center'>Temperature</th>
        <th align='center'>Conductivity</th> 
        <th align='center'>Pressure</th>
        <th align='center'>Salinity</th> 
        <th align='center'>TDS</th>
        <th align='center'>Date</th> 
        <th align='center'>Time</th> 
        </tr>
<%

        if(!rs.next()){

%> 
	        <tr>
	        <td><center> <%out.print("<   empty record >"); %> </td></center>
	        </tr>
<%
        }
        else{

            rs.beforeFirst(); 
            
            while(rs.next()){
            	double  temp1 = -100.0; 
%>
                <tr>

            	<td align='center'><%out.print(rs.getInt(1));%></td>


                <td align='center'><%
                temp1 = rs.getDouble(2);
        
                if(rs.wasNull()){
                    out.print("NULL");
                }
                else{
                    out.print(temp1);
                }
                    
				%></td>

                <td align='center'><%
                temp1 = rs.getDouble(3);
                    
                if(rs.wasNull()){
                    out.print("NULL");
                }
                else{
                    out.print(temp1);
                }  

                %></td>

                <td align='center'><%
                temp1 = rs.getDouble(4);
                
                if(rs.wasNull()){
                    out.print("NULL");
                }
                else{
                    out.print(temp1);
                }  

                %></td>

                <td align='center'><%
                temp1 = rs.getDouble(5);
                
                if(rs.wasNull()){
                    out.print("NULL");
                }
                else{
                    out.print(temp1);
                }    

                %></td>

                <td align='center'><%
                temp1 = rs.getDouble(6);
                   
                if(rs.wasNull()){
                    out.print("NULL");
                }
                else{
                    out.print(temp1);
                }    

                %></td>

                <td align='center'><%out.print(rs.getString(7));%></td>
                <td align='center'><%out.print(rs.getString(8));%></td>
                </tr>
                <%
            }
        }
	}
	else {

	}




/*****************************************************************

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
 

	<%	}
******************************************************/



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