<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.lang.String" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<HEAD>
		<!-- <link href="../CSS/uploadTags.css" rel="stylesheet" type="text/css"/> -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="../JS/tags.js" type="text/javascript"></script>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<center>
			<table width="993" height="102" border="0">
				<tr>
					<td width="200" height="120"><img src="http://i66.tinypic.com/346oqht.jpg" width="200" height="120" alt="Logo" /></td>
					<td align="right" width="726" class="right">24X7 Customer Support - <a href="../AccountControl/contact.jsp">Contact us</a> | <a href="../../index.jsp">Home</a>
				</tr>
			</table>
		</center>

		<TITLE>Display file upload form to the user</TITLE></HEAD>  
	 <% //  for uploading the file we used Encrypt type of multipart/form-data and input of file type to browse and submit the file %>
	 <BODY> <FORM  ENCTYPE="multipart/form-data" ACTION="singleFileUpload.jsp" METHOD=POST>
	 <br><br><br>
	 <center><table border="2" >
	 <tr><center><td colspan="2"><p align="center"><B>PROGRAM FOR UPLOADING WELL FILE</B><center></td></tr>
	 <tr><td><b>Choose the file To Upload:</b></td>
	 <td><INPUT NAME="F1" TYPE="file"></td></tr>
	 	 <tr><td colspan="2">
	 <p align="right"><INPUT TYPE="submit" VALUE="Send File" ></p></td></tr>
	 <table>
	 </center> 
	 </FORM>
	 </BODY> 
	 <br><br><b>README:</b> Each line of file is comma delimited and contains information for a single entry, multiple entries are supported.<br>
	 If you choose to not enter optional data, use a space in place of the data that would be entered.  <br>
	 <br><b>FILE FORMAT:</b> WellID, AquiferCode, TypeCode, OwnerType, OwnerName, Latitude, Longitude, Country, State, WellDepth, UsageState, PumpType,
			 <br>BottomElevation, WaterLevelElevation, SurfaceElevation, CasingID, Diameter, TopDepth, BottomDepth, Comment<br>
			 <br><b>Optional Data:</b>OwnerType, OwnerName, PumpType, WaterLevelElevation, CasingID, Diameter, TopDepth, BottomDepth, Comments<br> 

	<br><br><br>
<!--
	 <div class="steps">
		 <ul id="sortable">
			 <li>
				 <input id='label-1' type='checkbox'/>
				 <label for='label-1'>
					 <h2>Meet Larry at 6pm <span>Lorem ipsum dolor</span></h2>   
				 </label>
			 </li>

			 <li>
				 <input id='label-2' type='checkbox' checked/>
				 <label for='label-2'>
					 <h2>Team Session <span>Lorem ipsum dolor</span></h2>   
				 </label>
			 </li>

			 <li>
				 <input id='label-3' type='checkbox'/>
				 <label for='label-3'>
					 <h2>Watch Movie <span>Lorem ipsum dolor</span></h2>   
				 </label>
			 </li>

			 <li>
				 <input id='label-4' type='checkbox'/>
				 <label for='label-4'>
					 <h2>Date with babe <span>Lorem ipsum dolor</span></h2>   
				 </label>
			 </li>

			 <li>
				 <input id='label-5' type='checkbox'/>
				 <label for='label-5'>
					 <h2>Jogging at Ayala<span>Lorem ipsum dolor</span></h2>   
				 </label>
			 </li>

		 </ul>
		 <br><br>
	 </div>
-->


	 </HTML>
