<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 
	<FORM ACTION="transReadingsQueryConf.jsp" METHOD="post">
	
			    TransducerID:<br>
			    <input type="text" name="TransID" placeholder="Manditory"/><br>
			      
			    WellID:<br>
			    <input type="text" name="WellID" placeholder="Manditory"/><br>
			      
			    Beginning Time:<br>
			    <input type="text" name="Beginning" placeholder="Manditory"/><br>
			      
			    End Time:<br>
			    <input type="text" name="End" placeholder="Optional"/><br>
			      
			    <input type="checkbox" name="getRain" value="rain">Get rainfall at location?<br>

			    <input type="submit" value="Submit"/>
	
	</FORM>
	</BODY>
	</HTML>
