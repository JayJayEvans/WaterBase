<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 

	  <link rel="stylesheet" href="../CSS/transReadingQuery.css"/>

	<FORM id="rainfall" ACTION="transReadingsQueryConf.jsp" METHOD="post">
	<h3><font color ="black"><center>Transducer Data Query</font></center></h3>
          <h4><center><i>Please enter query information below</i></center></h4>
		<script type="text/javascript">
		    function clicked() {

			  if(!document.getElementById('tran_id').value && !document.getElementById('well_id').value){
			  	  location.reload();
			  	  alert("You must provide Transducer ID and/or Well ID \nPlease try again!");
				  event.preventDefault();
				  return false;


			  }

			  return true;

		     }

		</script>


			    TransducerID:<br>
			    <input type="text" id='tran_id' name="TransID" placeholder=""/><br><br>
			      
			    WellID:<br>
			    <input type="text" id='well_id' name="WellID" placeholder=""/><br><br>
			    
			    Beginning Date:<br>
			    <input type="date" name="begDate"/><br><br>
  
			    Beginning Time:<br>
			    <input type="text" name="begTime" placeholder="hh:mm:ss"/><br>
			    <small><sup><i>*Military Time</i></sup></small><br><br>
			    
			    End Date:<br>
			    <input type="date" name="endDate"/><br><br>
	      
			    End Time:<br>
			    <input type="text" name="endTime" placeholder="hh:mm:ss"/><br>
			    <small><sup><i>*Military Time</i></sup></small><br><br>
			      
			    <input type="checkbox" name="getRain" value="rain">Get rainfall at location?<br><br>
			   
			    <button name="submit" type="submit" id="myBtn" name="contact-submit"  data-submit="...Sending" onclick="clicked();"/>Submit</button> 
			    
			    <button name="submit" type="reset">Reset</button>






	</FORM>
	</BODY>
	</HTML>
