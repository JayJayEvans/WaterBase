<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Transducer Data Query</title>


		<link href="../CSS/menu.css" rel="stylesheet" type="text/css"/>
		<nav id="navigation">
	    <a href="../../index.jsp" class="logo"> WaterBase</a>
	    <ul class="links">    
			     		    
		    	      <li class="dropdown"><a href="#" class="trigger-drop">File Upload<i class="arrow"></i></a><ul class="drop">
					            <li><a href="../DatabaseInsertion/wellUpload.jsp">Well</a></li>
						    <li><a href="../DatabaseInsertion/transducerUpload.jsp">Transducer</a></li>
									          </ul></li>


 					 <li class="dropdown"><a href="#" class="trigger-drop">Search Data<i class="arrow"></i></a><ul class="drop">

						    <li><a href="../DatabaseQuerys/wellQuery.jsp">Well Data</a></li>
					            <li><a href="../DatabaseQuerys/transReadingsQuery.jsp">Transducer Data</a></li>
						    <li><a href="../DatabaseQuerys/location.jsp">Location Data</a></li>


						    <li><a href="../DatabaseQuerys/advancedQuery.jsp">Advanced Transducer Data</a></li>

					  				          </ul></li>

			      <li class="dropdown"><a href="#" class="trigger-drop">Enter Data<i class="arrow"></i></a><ul class="drop">
						    <li><a href="../DatabaseInsertion/manualEntry.jsp">Well</a></li>
					   	    <li><a href="../DatabaseInsertion/manualSingleTrans.jsp">Transducer</a></li>
						    <li><a href="../DatabaseInsertion/manualTransEntry.jsp">Recordings</a></li>
						    <li><a href="../DatabaseInsertion/rainfall.jsp">Rainfall</a></li>
    					 				          </ul></li>

			   
				
			     <li><a href="../AccountControl/contact.jsp">Contact Us</a></li>


			

	  </ul>

	</nav>

		
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
			    <input type="text" id="tran_id" name="tran_id" placeholder=""/><br><br>
			      
			    WellID:<br>
			    <input type="text" id="well_id" name="well_id" placeholder=""/><br><br>
			    
			    Beginning Date:<br>
			    <input type="text" id="begDate" name="begDate" placeholder="YYYY-MM-DD"/><br><br>
  
			    Beginning Time:<br>
			    <input type="text" id="begTime" name="begTime" placeholder="hh:mm:ss"/><br>
			    <small><sup><i>*Military Time</i></sup></small><br><br>
			    
			    End Date:<br>
			    <input type="text" id="endDate" name="endDate" placeholder="YYYY-MM-DD" /><br><br>
	      
			    End Time:<br>
			    <input type="text" id="endTime" name="endTime" placeholder="hh:mm:ss"/><br>
			    <small><sup><i>*Military Time</i></sup></small><br><br>
			      
			    <input type="checkbox" id="getRain" name="getRain" value="rain">Get rainfall at location?<br><br>
			   
			    <button name="submit" type="submit" id="myBtn" name="contact-submit"  data-submit="...Sending" onclick="clicked();"/>Submit</button> 
			    






	</FORM>
	</BODY>
	</HTML>
