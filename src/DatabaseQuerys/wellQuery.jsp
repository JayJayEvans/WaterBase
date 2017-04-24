<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 
	<FORM ACTION="wellQueryConf.jsp" METHOD="post">
	
			    WellID:<br>
			    <input type="text" name="WellID" placeholder="Manditory"/><br>
			      
			    AquiferCode:<br>
			    <input type="text" name="AquiferCode" placeholder="Manditory"/><br>
			      
			    TypeCode:<br>
			    <input type="text" name="TypeCode" placeholder="Manditory"/><br>
			      
			    OwnerID:<br>
			    <input type="text" name="OwnerID" placeholder="Optional"/><br>
			      
			    <input type="submit" value="Submit"/>
	
	</FORM>
	</BODY>
	</HTML>
