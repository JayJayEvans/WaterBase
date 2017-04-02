<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Log in</title>
<style type="text/css">
.right {	text-align: right;
}
</style>
<link href="italics.css" rel="stylesheet" type="text/css" />
</head>

<body>

<center> 
<form action="loginconf.jsp" method="post">
  <table width="993" height="102" border="0">
    <tr>
      <td width="200" height="120"><img src="http://i66.tinypic.com/346oqht.jpg" width="200" height="120" alt="Logo" /></td>
      <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="main.jsp">Home</a> |
        <% if(session.getAttribute("uname")==null) {
			%>
        <a href="login.jsp">Login</a>
        <%} else {
				%>
        <a href="logout.jsp">Logout</a>
        <%}%></td>
    </tr>
  </table>
  <hr />
  <p>&nbsp;</p>
  <table width="1"> 
  <tr> 
<td colspan="2" class="italics"> User Login </td> 
</Tr> 
<tr> 
<td> Username: </td> 
<td> <input type="text" name="id"> </td> 
</Tr> 
<tr> 
<td> Password: </td> 
<td> <input type="password" name="password"> </td> 
</Tr> 
<tr> 
<td> <input type="submit" value="Log In"> </td> 
<td><input type="reset" value="Clear"> </td> 
</Tr> 
</Table>
  <p>&nbsp;</p>
  <p>&nbsp;</p> 
</Form> 

</Center>
</body>
</html>
