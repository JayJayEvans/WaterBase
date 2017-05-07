<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="stylesheet" href="../CSS/rainfall.css"/>  
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>Well Query</title>


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
		
		<title>Untitled Document</title>
		<link rel="stylesheet" href="../CSS/rainfall.css"/>
		

	</head>
	<BODY> 
	<div class="container">  

				<form id="rainfall"  action="wellQueryConf.jsp" method="post">
         		 <h3><font color ="black"><center>Well Query</font></center></h3>
          		<h4><center><i>Please enter query information below</i></center></h4>
			    
			    <fieldset>WellID:<br>
			    <input type="text" name="WellID" placeholder="optional"/><br></fieldset>
			      
			    <fieldset>  
			    AquiferCode:<br>
			    <input type="text" name="AquiferCode" placeholder="optional"/><br></fieldset>
			      
			    <fieldset>  
			    TypeCode:<br>
			    <input type="text" name="TypeCode" placeholder="optional"/><br></fieldset>
			    
			    <fieldset>
			    OwnerID:<br>
			    <input type="text" name="OwnerID" placeholder="optional"/><br></fieldset>
			    
			    <fieldset>
            	<button name="submit" type="submit" id="myBtn" name="contact-submit"  data-submit="...Sending" >Submit</button>
         		 </fieldset>
	
				</form>

 </div>


	</BODY>
	</HTML>
