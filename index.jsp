%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.lang.String" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		        <link href="./src/CSS/menu.css" rel="stylesheet" type="text/css"/>
			        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
					<title>Main</title>
	</head>

	<body>





<nav id="navigation">
	    <a href="#" class="logo"> WaterBase&copy;</a>
	    <ul class="links">    
			     		    
		    	      <li class="dropdown"><a href="#" class="trigger-drop">File Upload<i class="arrow"></i></a><ul class="drop">
					            <li><a href="./src/DatabaseInsertion/wellUpload.jsp">Well</a></li>
						    <li><a href="./src/DatabaseInsertion/transducerUpload.jsp">Transducer</a></li>
									          </ul></li>


 			      <li class="dropdown"><a href="#" class="trigger-drop">Query Data<i class="arrow"></i></a><ul class="drop">
						    <li><a href="./src/DatabaseQuerys/wellQuery.jsp">Well Data</a></li>
					            <li><a href="./src/DatabaseQuerys/transReadingsQuery.jsp">Transducer Data</a></li>
						    <li><a href="./src/DatabaseQuerys/location.jsp">Location Data</a></li>
						    <li><a href="./src/DatabaseQuerys/advancedQuery.jsp">Advanced Transducer Data</a></li>
					  				          </ul></li>

			      <li class="dropdown"><a href="#" class="trigger-drop">Enter Data<i class="arrow"></i></a><ul class="drop">
						    <li><a href="./src/DatabaseInsertion/manualEntry.jsp">Well</a></li>
					   	    <li><a href="./src/DatabaseInsertion/manualSingleTrans.jsp">Transducer</a></li>
						    <li><a href="./src/DatabaseInsertion/manualTransEntry.jsp">Recordings</a></li>
						    <li><a href="./src/DatabaseInsertion/rainfall.jsp">Rainfall</a></li>
    					 				          </ul></li>

			   
				
			     <li><a href="./src/AccountControl/contact.jsp">Contact Us</a></li>

			

	  </ul>

</nav>
<center> <img style="margin-top:100px" style="-webkit-user-select: none;background-position: 0px 0px, 10px 10px;background-size: 20px 20px;background-image:linear-gradient(45deg, #eee 25%, transparent 25%, transparent 75%, #eee 75%, #eee 100%),linear-gradient(45deg, #eee 25%, white 25%, white 75%, #eee 75%, #eee 100%);" src="http://i66.tinypic.com/346oqht.jpg"></center>
<font size=1> <i><center>  Jason Evans</center>
<center>  Ejay Mallard</center>
<center>  Pearson Reese</center></i></font>
</body>

</html>
