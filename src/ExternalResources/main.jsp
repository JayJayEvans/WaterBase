<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.lang.String" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="../CSS/sidebar.css" rel="stylesheet" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
	<script src="../JS/sidebar.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Main</title>
</head>

<body>
	



	<div class="nav-right visible-xs">
		  <div class="button" id="btn">
			      <div class="bar top"></div>
			          <div class="bar middle"></div>
				      <div class="bar bottom"></div>
				        </div>
	</div>
	<!-- nav-right -->
	<main>


	  <nav>
		      <div class="nav-right hidden-xs">
			            <div class="button" id="btn">
					            <div class="bar top"></div>
						            <div class="bar middle"></div>
							            <div class="bar bottom"></div>
								          </div>
									      </div>
									          <!-- nav-right -->
										    </nav>

										      <a href="http://codepen.io/tonkec/" class="ua" target="_blank">
											          <i class="fa fa-user"></i>
												    </a>
	</main>

	<div class="sidebar">
		  <ul class="sidebar-list">
			      <li class="sidebar-item"><a href="../DatabaseInsertion/wellUpload.jsp" class="sidebar-anchor">Upload Well File</a></li>
			          <li class="sidebar-item"><a href="../DatabaseInsertion/transducerUpload.jsp" class="sidebar-anchor">Upload Transducer File</a></li>
					<li class="sidebar-item"><a href="../DatabaseInsertion/manualEntry.jsp" class="sidebar-anchor">Manually Enter Well Info</a></li>	   
					<li class="sidebar-item"><a href="../DatabaseInsertion/manualTransEntry.jsp" class="sidebar-anchor">Manually Enter Transducer Info</a></li>	
					<li class="sidebar-item"><a href="../DatabaseInsertion/rainfall.jsp" class="sidebar-anchor">Manually Enter Rainfall  Info</a></li>
	     				  <li class="sidebar-item"><a href="../DatabaseQuerys/wellQuery.jsp" class="sidebar-anchor">Query Well Info</a></li>
						<li class="sidebar-item"><a href="../DatabaseQuerys/transReadingQuery.jsp" class="sidebar-anchor">Query Transducer Readings</a></li>

		  </ul>
	</div>





 
</body>
</html>
