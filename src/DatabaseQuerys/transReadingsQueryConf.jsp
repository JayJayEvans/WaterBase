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
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>

<%     
PreparedStatement ps;
PreparedStatement ps1;
PreparedStatement ps2;
PreparedStatement ps3;
PreparedStatement ps4;

Connection conn;
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");
Statement st=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
%> 

    
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
boolean needAnd = false;
ResultSet rs=null;
ResultSet rs1=null;
ResultSet rs2=null;
ResultSet rs3=null;
ResultSet rs4=null;
String query = "SELECT * from Transducers WHERE ";
String recordQuery = "SELECT * FROM TransducerRecords WHERE ";
String wellQuery = "SELECT Latitude,Longitude FROM Well WHERE ";
String trueQuery = "SELECT true_amt FROM True_Rainfall WHERE ";
String avgQuery = "SELECT avg_amt FROM Avg_Rainfall WHERE ";
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
		query += "TransID='";
		query += transIDStr;
		query += "'";
		needAnd=true;
	}

	if(!wellIDStr.equals("")){
		wellIdEntered = true;
		wellIDInt = Integer.parseInt(wellIDStr);
		if(needAnd)
			query += " AND ";
		query += "WellID='";
		query += wellIDStr;
		query +="'";
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

			
 ps = conn.prepareStatement(query);
 rs = ps.executeQuery();
 boolean needOr = false;
 int well = -100000;
 if(!rs.next())
 	out.println(" <empty> ");
else{
rs.beforeFirst();
while(rs.next()){
	if(needOr){
		recordQuery += " OR ";
		wellQuery += " OR ";	
	}
	recordQuery += "TransID='";
	recordQuery += Integer.toString(rs.getInt(1));
	recordQuery += "'";
	rs.getString(2);	
	rs.getString(3);
	well = rs.getInt(4);
	wellQuery += "WellID='";
	wellQuery += Integer.toString(well);
	wellQuery += "'";
	needOr = true;

}
recordQuery += " ORDER BY DateTime ASC";
//rs.beforeFirst();
}

ps1 = conn.prepareStatement(recordQuery);
rs1 = ps1.executeQuery();

ps2 = conn.prepareStatement(wellQuery);
rs2 = ps2.executeQuery();


double lat =0.0;
double longit = 0.0;
while(rs2.next()){
	avgQuery += "latitude='";
	lat = rs2.getFloat(1);
	avgQuery += Double.toString(lat);
	avgQuery += "' AND ";
	trueQuery += "latitude='";
	trueQuery += Double.toString(lat);
	trueQuery += "' AND ";

	longit = rs2.getFloat(2);		
	avgQuery += "longitude='";
	avgQuery += Double.toString(longit);
	avgQuery +="'";
	trueQuery += "longitude='";
	trueQuery += Double.toString(longit);
	trueQuery += "'";
	trueQuery += " ORDER BY date ASC";

}



ps3 = conn.prepareStatement(trueQuery);
rs3 = ps3.executeQuery();
ps4 = conn.prepareStatement(avgQuery);
rs4 = ps4.executeQuery();




%>

        <center><table style="width:50%">
        <tr>
	 <th align='center'>Well ID</th>
        <th align='center'>Transducer ID</th>
        <th align='center'>Temperature</th>
        <th align='center'>Conductivity</th> 
        <th align='center'>Pressure</th>
        <th align='center'>Salinity</th> 
        <th align='center'>TDS</th>
        <th align='center'>DateTime</th> 
         <th align='center'>Avrg RainFall</th> 
	 <th align='center'>True Rainfall</th> 

	
	</tr>
<%

        if(!rs1.next()){

%> 
	        <tr>
	        <td><center> <%out.print("<   empty record >"); %> </td></center>
	        </tr>
<%
        }
        else{

            rs1.beforeFirst(); 
            
            while(rs1.next()){
	    	%>
                <tr>

            	<td align='center'><%out.print(well);%></td>

<%

	    	double  temp1 = -100.0; 
%>
                

            	<td align='center'><%out.print(rs1.getInt(1));%></td>


                <td align='center'><%
                out.print(rs1.getFloat(2));
        
                    
				%></td>

                <td align='center'><%
                temp1 = rs1.getDouble(3);
                    
                if(rs1.wasNull()){
                    out.print("NULL");
                }
                else{
                    out.print(temp1);
                }  

                %></td>

                <td align='center'><%
                temp1 = rs1.getDouble(4);
                
                if(rs1.wasNull()){
                    out.print("NULL");
                }
                else{
                    out.print(temp1);
                }  

                %></td>

                <td align='center'><%
                temp1 = rs1.getDouble(5);
                
                if(rs1.wasNull()){
                    out.print("NULL");
                }
                else{
                    out.print(temp1);
                }    

                %></td>

                <td align='center'><%
                temp1 = rs1.getDouble(6);
                   
                if(rs1.wasNull()){
                    out.print("NULL");
                }
                else{
                    out.print(temp1);
                }    

                %></td>

                <td align='center'><%out.print(rs1.getTimestamp(7));%></td>
                 
            
		  <td align='center'><%
                   
                if(!rs4.next()){
                    out.print("NULL");
                }
                else{
                    out.print(rs4.getDouble(1));
                }    

                %></td>

		  <td align='center'><%
		  if(!rs3.next()){
			out.println("NULL");
		  }
                   
                else{
                    out.print(rs3.getDouble(1));
                }    

                %></td>








		</tr>

<%		
		}
        }
	





}catch(Exception e){ 
	out.println(e);
}
%>	
	</body>
	</html>
