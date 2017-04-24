<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 
	<FORM ACTION="manualTransEntryConf.jsp" METHOD="post">
	
			    TransID:<br>
			    <input type="text" name="TransID" placeholder="Manditory" required/><br>
			      
			    TransType:<br>
			    <input type="text" name="Transtype" placeholder="Manditory" required/><br>
			      
			    TransName:<br>
			    <input type="text" name="TransName" placeholder="Manditory" required/><br>
			      
			    WellID:<br>
			    <input type="text" name="WellID" placeholder="Manditory" required/><br>
			      
			    Temperature:<br>
			    <input type="text" name="Temperature" placeholder="Optional"/><br>
			      
			    Conductivity:<br>
			    <input type="text" name="Conductivity" placeholder="Optional"/><br>
			    
			    Pressure:<br>
			    <input type="text" name="Pressure" placeholder="Optional"/><br>
			     
			    Salinity:<br>
			    <input type="text" name="Salinity" placeholder="Optional"/><br>
			   
			    TDS:<br>
			    <input type="text" name="TDS" placeholder="Optional"/><br>
			    

			    <input type="submit" value="Submit"/>
	
	</FORM>
	</BODY>
	</HTML>
