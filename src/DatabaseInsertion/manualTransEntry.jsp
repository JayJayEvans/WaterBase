<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<link rel="stylesheet" href="../CSS/rainfall.css"/>


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

			   
				
			     <<li><a href="../AccountControl/contact.jsp">Contact Us</a></li>


			

	  </ul>

	</nav>

		




		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
	</head>
	<BODY> 
		<div class="container">
	<FORM id="rainfall" ACTION="manualTransEntryConf.jsp" METHOD="post">

		<script type="text/javascript">
			  function clicked() {

				  if(!document.getElementById('trans_id').value && 
	  				!document.getElementById('date').value && !document.getElementById('time').value){
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
			<font size="1px" color="red">YYYY-MM-DD</font><br> 
		</fieldset>                                
		<fieldset>  
			Time:<br>
			<input type="text" name="Time" id='time' placeholder="manditory" required/><br>
			<font size="1px" color="red">HH:MM:SS Military Format</font><br>			      	
		</fieldset>                                
		<fieldset>  
			Temperature:<br>
			<input type="text" name="Temperature" id='temp' placeholder="manditory" required/><br>
		</fieldset>                                
		<fieldset>  		 
			Conductivity:<br>
			<input type="text" name="Conductivity" id='cond' placeholder="manditory" required/><br>
		</fieldset>                                
		<fieldset>  		 
			Pressure:<br>
			<input type="text" name="Pressure" id='press' placeholder="manditory" required/><br>
		</fieldset>                                
		<fieldset>  	  
			Salinity:<br>
			<input type="text" name="Salinity" id = 'sal' placeholder="manditory" required/><br>
		</fieldset>                                
		<fieldset>  	 
			TDS:<br>
			<input type="text" name="TDS" id='tds' placeholder="manditory" required/><br>

		</fieldset>                                
		<fieldset>  
			 <button name="submit" type="submit" onclick="clicked();" >Submit</button>
		 </fieldset>


	</FORM>
	</BODY>
	</HTML>
