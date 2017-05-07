<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<link rel="stylesheet" href="../CSS/rainfall.css"/>

		<center>
			<table width="993" height="102" border="0">
				<tr>
					<td width="200" height="120"><img src="http://i66.tinypic.com/346oqht.jpg" width="200" height="120" alt="Logo" /></td>
					<td align="right" width="726" class="right">24X7 Customer Support - <a href="../AccountControl/contact.jsp">Contact us</a> | <a href="../../index.jsp">Home</a> 
				</tr>
			</table>
		</center>



		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 
		<div class="container">
	<FORM id="rainfall" ACTION="manualTransEntryConf.jsp" METHOD="post">

		<script type="text/javascript">
			  function clicked() {

				  if(!document.getElementById('temp').value && !document.getElementById('cond').value && 
	  				!document.getElementById('press').value && !document.getElementById('sal').value && !document.getElementById('tds').value){
					  //location.reload(true);
					  alert("You must provide required data!\nPlease try again!");
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
			<input type="text" name="TransID"  id='trans_id' placeholder="manditory" required/><br>
		</fieldset>
		<fieldset>	 
			Date:<br>
			<input type="text" name="Date" id='date' placeholder="manditory" required/><br>
			<font size="1px" color="red">MM/DD/YYYY</font><br> 
		</fieldset>                                
		<fieldset>  
			Time:<br>
			<input type="text" name="Time" id='time' placeholder="manditory" required/><br>
			<font size="1px" color="red">HH:MM:SS Military Format</font><br>			      	
		</fieldset>                                
		<fieldset>  
			Temperature:<br>
			<input type="text" name="Temperature" id='temp' placeholder="optional"/><br>
		</fieldset>                                
		<fieldset>  		 
			Conductivity:<br>
			<input type="text" name="Conductivity" id='cond' placeholder="optional"/><br>
		</fieldset>                                
		<fieldset>  		 
			Pressure:<br>
			<input type="text" name="Pressure" id='press' placeholder="optional"/><br>
		</fieldset>                                
		<fieldset>  	  
			Salinity:<br>
			<input type="text" name="Salinity" id = 'sal' placeholder="optional"/><br>
		</fieldset>                                
		<fieldset>  	 
			TDS:<br>
			<input type="text" name="TDS" id='tds' placeholder="optional"/><br>

		</fieldset>                                
		<fieldset>  
			 <button name="submit" type="submit" onclick="clicked();" >Submit</button>
		 </fieldset>


	</FORM>
	</BODY>
	</HTML>
