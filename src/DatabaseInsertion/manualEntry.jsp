<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 
	<FORM ACTION="manualEntryConf.jsp" METHOD="post">
	
			    WellID:<br>
			    <input type="text" name="WellID" placeholder="Manditory"/><br>
			      
			    AquiferCode:<br>
			    <input type="text" name="AquiferCode" placeholder="Manditory"/><br>
			      
			    TypeCode:<br>
			    <input type="text" name="TypeCode" placeholder="Manditory"/><br>
			      
			    OwnerType:<br>
			    <input type="text" name="OwnerType" placeholder="Optional"/><br>
			      
			    OwnerName:<br>
			    <input type="text" name="OwnerName" placeholder="Optional"/><br>
			      
			    Latitude:<br>
			    <input type="text" name="Latitude" placeholder="Manditory"/><br>
			    
			    Longitude:<br>
			    <input type="text" name="Longitude" placeholder="Manditory"/><br>
			     
			    Country:<br>
			    <input type="text" name="Country" placeholder="Manditory"/><br>
			   
			    State:<br>
			    <input type="text" name="State" placeholder="Manditory"/><br>
			    
			    WellDepth:<br>
			    <input type="text" name="WellDepth" placeholder="Manditory"/><br>
			
			    UsageState:<br>
			    <input type="text" name="UsageState" placeholder="Manditory"/><br>
			      
			    PumpType:<br>
			    <input type="text" name="PumpType" placeholder="Optional"/><br>
			
			    BottomElevation:<br>
			    <input type="text" name="BottomElevation" placeholder="Manditory"/><br>
			      
			    WaterLevelElevation:<br>
			    <input type="text" name="WaterLevelElevation" placeholder="Optional"/><br>
			
			    SurfaceElevation:<br>
			    <input type="text" name="SurfaceElevation" placeholder="Manditory"/><br>
			      
			    CasingID:<br>
			    <input type="text" name="CasingID" placeholder="Optional"/><br>
			
			    Diameter:<br>
			    <input type="text" name="Diameter" placeholder="Optional"/><br>
			      
			    TopDepth:<br>
			    <input type="text" name="TopDepth" placeholder="Optional"/><br>
			
			    BottomDepth:<br>
			    <input type="text" name="BottomDepth" placeholder="Optional"/><br>
			      
			    Comments:<br>
			    <input type="text" name="Comments" placeholder="Optional"/><br><br>

			    <input type="submit" value="Submit"/>
	
	</FORM>
	</BODY>
	</HTML>
