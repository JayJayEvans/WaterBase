<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.lang.String" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		        <link href="../CSS/menu.css" rel="stylesheet" type="text/css"/>
			        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
					<title>Main</title>
	</head>

	<body>





<nav id="navigation">
	  <a href="#" class="logo">WaterBase<span>©<span></a>
	    <ul class="links">    
			     		    
		    	      <li class="dropdown"><a href="#" class="trigger-drop">File Upload<i class="arrow"></i></a><ul class="drop">
					            <li><a href="../DatabaseInsertion/wellUpload.jsp">Well File</a></li>
						    <li><a href="../DatabaseInsertion/transducerUpload.jsp">Transducer File</a></li>
									          </ul></li>

			      <li class="dropdown"><a href="#" class="trigger-drop">Enter Data<i class="arrow"></i></a><ul class="drop">
						    <li><a href="../DatabaseInsertion/manualEntry.jsp">Well Data</a></li>
					   	    <li><a href="../DatabaseInsertion/manualTransEntry.jsp">Transducer Data</a></li>
						    <li><a href="../DatabaseInsertion/rainfall.jsp">Rainfall  Data</a></li>
    					 				          </ul></li>

			     <li class="dropdown"><a href="#" class="trigger-drop">Query Data<i class="arrow"></i></a><ul class="drop">
						    <li><a href="../DatabaseQuerys/wellQuery.jsp">Well Data</a></li>
					            <li><a href="../DatabaseQuerys/transReadingsQuery.jsp">Transducer Data</a></li>
						    <li><a href="../DatabaseQuerys/locationQuery.jsp">Location Data</a></li>
						    <li><a href="../DatabaseQuerys/advancedQuery.jsp">Advanced Transducer Data</a></li>

					  				          </ul></li>
				
			     <li><a href="../AccountControl/logout.jsp">Logout</a></li>


			

	  </ul>

</nav>
HELLO
</body>

	hello

</html>
