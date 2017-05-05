<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<link rel="stylesheet" href="../CSS/rainfall.css"/>

		<center>
			<table width="993" height="102" border="0">
				<tr>
					<td width="200" height="120"><img src="http://i66.tinypic.com/346oqht.jpg" width="200" height="120" alt="Logo" /></td>
					<td align="right" width="726" class="right">24X7 Customer Support - <a href="./contact.jsp">Contact us</a> | <a href="../main.jsp">Home</a> |
						<% if(session.getAttribute("uname")==null) {
						%>
						<a href="../../index.jsp">Login</a>
						<%} else {
						%>
						<a href="./logout.jsp">Logout</a>
						<%}%></td>
				</tr>
			</table>
		</center>



		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 
	<FORM id="rainfall" ACTION="manualTransEntryConf.jsp" METHOD="post">

		<script type="text/javascript">
			  function clicked() {

				  if(!document.getElementById('temp').value && !document.getElementById('cond').value && !document.getElementById('press').value && 
	  					!document.getElementById('sal').value && !document.getElementById('tds').value ){
					  location.reload(true);
					  alert("You must provide Data!\nPlease try again!");
					  event.preventDefault();
					  return false;
				  }

				  return true;

			  }

		</script>


		<h3><font color ="black"><center>Enter Transducer Recording Information</font></center></h3>
		<h4><center><i>Please enter new transducer recording below</i></center></h4>
		<fieldset>


			TransID:<br>
			<input type="text" name="TransID" placeholder="Manditory" required/><br>
		</fieldset>
		<fieldset>	 
			Date:<br>
			<input type="text" name="Date" placeholder="Manditory" required/><br>
			<font size="1px" color="red"> *required MM/DD/YYYY</font><br> 
		</fieldset>                                
		<fieldset>  
			Time:<br>
			<input type="text" name="Time" placeholder="Manditory" required/><br>
			<font size="1px" color="red"> *required HH:MM:SS </font><br>			      	
		</fieldset>                                
		<fieldset>  
			Temperature:<br>
			<input type="text" name="Temperature" id='temp' placeholder="Optional"/><br>
		</fieldset>                                
		<fieldset>  		 
			Conductivity:<br>
			<input type="text" name="Conductivity" id='cond' placeholder="Optional"/><br>
		</fieldset>                                
		<fieldset>  		 
			Pressure:<br>
			<input type="text" name="Pressure" id='press' placeholder="Optional"/><br>
		</fieldset>                                
		<fieldset>  	  
			Salinity:<br>
			<input type="text" name="Salinity" id = 'sal' placeholder="Optional"/><br>
		</fieldset>                                
		<fieldset>  	 
			TDS:<br>
			<input type="text" name="TDS" id='tds' placeholder="Optional"/><br>

		</fieldset>                                
		<fieldset>  
			 <button name="submit" type="submit" onclick="clicked();" >Submit</button>
		 </fieldset>


	</FORM>
	</BODY>
	</HTML>
