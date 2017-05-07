<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 
	<FORM ACTION="transReadingsQueryConf.jsp" METHOD="post">
	
		<script type="text/javascript">
		    function clicked() {

			  if(!document.getElementById('trans').value && !document.getElementById('well').value){
			  	  location.reload(true);
			  	  alert("You must provide TransID, WellID, or both!\nPlease try again!");
				  event.preventDefault();
				  return false;


			  }
			  if(document.getElementById('beg').value && !document.getElementById('end').value){
			  	  location.reload(true);
			  	  alert("You must provide an End Time if you input a Beginning!\nPlease try again!");
				  event.preventDefault();
				  return false;


			  }
			  if(!document.getElementById('beg').value && document.getElementById('end').value){
			  	  location.reload(true);
			  	  alert("You must provide a Beginning time if you input an End!\nPlease try again!");
				  event.preventDefault();
				  return false;


			  }

			  return true;

		     }

		</script>



			    TransducerID:<br>
			    <input type="text" name="TransID" id='trans' placeholder="Manditory"/><br>
			      
			    WellID:<br>
			    <input type="text" name="WellID" id='well' placeholder="Manditory"/><br>
			      
			    Beginning Time:<br>
			    <input type="text" name="Beginning" id='beg' placeholder="Manditory"/><br>
			      
			    End Time:<br>
			    <input type="text" name="End" id='end' placeholder="Optional"/><br>
			      
			    <input type="checkbox" name="getRain" value="rain">Get rainfall at location?<br>
			 <button name="submit" type="submit"  onclick="clicked();" >Submit</button>
			    <input type="submit" value="Submit"/>
	
	</FORM>
	</BODY>
	</HTML>
