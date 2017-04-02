<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.lang.String" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Main</title>
</head>

<body>

	<p><b>Note: Welcome <%=session.getAttribute("uname")%>, what do you need?
	</b> .</p>

	  <form action="">
		    <input type="radio" name="choice" value="1"> 1.) Manually enter well information<br>
		      <input type="radio" name="choice" value="2"> 2.) Upload comma delimited well information file<br>
		      <input type="radio" name="choice" value="3"> 3.) Find today's current rainfall at user entered latitude/longitude<br><br>
		      <input type="submit" value="Submit">
	  </form>
	   <%@ page import="java.lang.String" %>
	<%
		String choice = request.getParameter("choice");
			%>

		<%	
		if(choice.equals("1")){
			out.println("Hello World");
		}
		else
			out.println("Hello Hell");		
	
	
	%>



 
</body>
</html>
