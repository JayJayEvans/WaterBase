<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<link rel="stylesheet" href="../CSS/rainfall.css"/>

		<center>
			<table width="993" height="102" border="0">
				<tr>
					<td width="200" height="120"><img src="http://i66.tinypic.com/346oqht.jpg" width="200" height="120" alt="Logo" /></td>
					<td align="right" width="726" class="right">24X7 Customer Support - <a href="../AccountControl/contact.jsp">Contact us</a> | <a href="../../main.jsp">Home</a> 
				</tr>
			</table>
		</center>


		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 
	<FORM id="rainfall" ACTION="manualSingleTransConf.jsp" METHOD="post">
		<h3><font color ="black"><center>New Transducer Information</font></center></h3>
		    <h4><center><i>Please enter device information below</i></center></h4>
		
			<fieldSet>	
			    TransID:<br>
			    <input type="text" name="TransID" placeholder="Manditory" required/><br>
		        </fieldset>
	 	        <fieldset>
			    WellID:<br>
			    <input type="text" name="WellID" placeholder="Manditory" required/><br>
 		        </fieldset>
			<fieldset>
			    TransType:<br>
			    <input type="text" name="TransType" placeholder="Manditory" required/><br>
			</fieldset>
			    <fieldset>
			    TransName:<br>
			    <input type="text" name="TransName" placeholder="Manditory" required/><br>
		        </fieldset>
			<fieldset>
				<button name="submit" type="submit" id="myBtn" >Submit</button>	
			</fieldset>	
	</FORM>
	</BODY>
	</HTML>
