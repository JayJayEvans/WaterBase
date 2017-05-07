<%@ page language="java" %>
<HTML>
	<HEAD><TITLE>Display file upload form to the user</TITLE></HEAD>  
	<% //  for uploading the file we used Encrypt type of multipart/form-data and input of file type to browse and submit the file %>
	<BODY> <FORM  ENCTYPE="multipart/form-data" ACTION="transducerUploadConf.jsp" METHOD=POST>
			<br><br><br>
			<center><table border="2" >
					<tr><center><td colspan="2"><p align=
					"center"><B>PROGRAM FOR UPLOADING TRANSDUCER FILE</B><center></td></tr>
					<tr><td><b>Choose the file To Upload:</b>
						</td>
						<td><INPUT NAME="F1" TYPE="file"></td></tr>
					<tr><td colspan="2">
							<p align="right"><INPUT TYPE="submit" VALUE="Send File" ></p></td></tr>
					<table>
								</center>      
	</FORM>
	</BODY>
	<br><br><b>README:</b> Each line of file is comma delimited and contains information for a single entry, multiple entries are supported.<br> If you choose to not enter optional data, use a space in place of the data that would be entered.  <br>
	         <br><b>FILE FORMAT:</b> TransducerID,TransType,TransName,Temperature,Conductivity,Pressure,Salinity,TDS,Date,Time
		 <br><br>Date must be in MM/DD/YYYY format, Time must be in HH:MM:SS, You also must enter at least 1 entry for 1 of the optional data!<br>
	         <br><b>Optional Data:</b> Temperature,Conductivity,Pressure,Salinity,TDS
	</HTML>
