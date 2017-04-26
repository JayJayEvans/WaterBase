<html>
<head>
	<title>Contact Us</title>
	
	<!-- include css file here-->
   <link rel="stylesheet" href="../CSS/form.css"/>  
   
</head>
<body>
<table width="993" height="102" border="0">
  <tr>
    <td width="251" height="96"><img src="http://i66.tinypic.com/346oqht.jpg" width="251" height="88" alt="Logo" /></td>
    <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="../../index.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) {
			%>
      <a href="../../index.jsp">Login</a>
      <%} else {
				%>
      <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>

   <div id="main">
   <h1><center>Contact Us</center></h1>
	
  <center><div id="form_sample">
	
	</div></center>
   <!-- include JavaScript file here -->
   <script src="../JS/form.js"></script>	
      
	
</body>
</html>