<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>


<link rel="stylesheet" href="../CSS/rainfall.css"/>
<center>
	<table width="993" height="102" border="0">
		<tr>
			<td width="200" height="120"><img src="http://i66.tinypic.com/346oqht.jpg" width="200" height="120" alt="Logo" /></td>
			<td align="right" width="726" class="right">24X7 Customer Support - <a href="../AccountControl/contact.jsp">Contact us</a> | <a href="../../index.jsp">Home</a> 
		</tr>
	</table>
</center>
<title>Rainfall Information</title>
	</head>
	
<BODY> 



	<div class="container">
	<FORM id="rainfall" ACTION="manualEntryConf.jsp" METHOD="post">
 		<h3><font color ="black"><center>Well Information</font></center></h3>
    		<h4><center><i>Please enter well  information below</i></center></h4>
			<fieldset>
			    WellID:<br>
			    <input type="text" name="WellID" placeholder="Manditory" required/><br>
			</fieldset>
			<fieldset>
			    AquiferCode:
			    <input type="text" name="AquiferCode" placeholder="Manditory" required/><br>
			</fieldset>
			<fieldset>
			    TypeCode:<br>
			    <input type="text" name="TypeCode" placeholder="Manditory"required/><br>
			</fieldset>
			<fieldset>
			    OwnerType:<br>
			    <input type="text" name="OwnerType" placeholder="Optional"/><br>
			</fieldset>
			<fieldset>
			    OwnerName:<br>
			    <input type="text" name="OwnerName" placeholder="Optional"/><br>
			</fieldset>
			<fieldset>
			    Latitude:<br>
			    <input type="text" name="Latitude" placeholder="Manditory"required/><br>
			</fieldset>
			<fieldset>
			    Longitude:<br>
			    <input type="text" name="Longitude" placeholder="Manditory"required/><br>
			</fieldset>
	  	        <fieldset>    
			    Country:<br>
			    <input type="text" name="Country" placeholder="Manditory"required/><br>
			</fieldset>
			<fieldset>	
			    State:<br>
			    <input type="text" name="State" placeholder="Manditory"required/><br>
			</fieldset>
			<fieldset>
			    WellDepth:<br>
			    <input type="text" name="WellDepth" placeholder="Manditory"required/><br>
			</fieldset>
			<fieldset>
			    UsageState:<br>
			    <input type="text" name="UsageState" placeholder="Manditory"required/><br>
			</fieldset>
			<fieldset>
			    PumpType:<br>
			    <input type="text" name="PumpType" placeholder="Optional"/><br>
			</fieldset>
			<fieldset>
			    BottomElevation:<br>
			    <input type="text" name="BottomElevation" placeholder="Manditory"required/><br>
			</fieldset>
			<fieldset>
			    WaterLevelElevation:<br>
			    <input type="text" name="WaterLevelElevation" placeholder="Optional"/><br>
			</fieldset>
			<fieldset>
			    SurfaceElevation:<br>
			    <input type="text" name="SurfaceElevation" placeholder="Manditory"required/><br>
			 </fieldset>
			<fieldset>
     
			    CasingID:<br>
			    <input type="text" name="CasingID" placeholder="Optional"/><br>
			</fieldset>
			<fieldset>

			    Diameter:<br>
			    <input type="text" name="Diameter" placeholder="Optional"/><br>
			 </fieldset>
			<fieldset>
     
			    TopDepth:<br>
			    <input type="text" name="TopDepth" placeholder="Optional"/><br>
			</fieldset>
			<fieldset>

			    BottomDepth:<br>
			    <input type="text" name="BottomDepth" placeholder="Optional"/><br>
			 </fieldset>
			<fieldset>
     
			    Comments:<br>
			    <input type="text" name="Comments" placeholder="Optional"/><br><br>
			</fieldset>
			<fieldset>

				<button name="submit" type="submit" id="myBtn" >Submit</button>
			</fieldset>

	</FORM>
	</BODY>
	</HTML>
