<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>REG</title>
<style type="text/css">
.right {text-align: right;
}
</style>
</head>

<body>
 <%@ page language="java" %>
        <table width="993" height="102" border="0">
          <tr>
            <td width="251" height="96"><img src="head.png" width="251" height="88" alt="Logo" /></td>
            <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="../main.jsp">Home</a> |
              <% if(session.getAttribute("uname")==null) {
			%>
              <a href="../../index.jsp">Login</a>
              <%} else {
				%>
              <a href="logout.jsp">Logout</a>
              <%}%></td>
          </tr>
        </table>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
       
<%
        String m=null, mn=null;
        String s=request.getParameter("name");
        String s1=request.getParameter("id");
        String s2=request.getParameter("password");
        String s3=request.getParameter("date");
        String s4=request.getParameter("address");
		String s5=request.getParameter("phone");
        PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
       Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");
      
         Statement st=con.createStatement();
       
          ps= con.prepareStatement("insert into register values (?,?,?,?,?,?)");
            ps.setString(1,s);
            ps.setString(2,s1);
            ps.setString(3,s2);
            ps.setString(4,s3);
            ps.setString(5,s4);
            ps.setString(6,s5);
	    int succ = ps.executeUpdate();             
            if(succ != 0) 
                 out.println("Successfully registered");
                      
        %>
        <br><hr>
               To Login <a href="../../index.jsp">Click Here</a>
                <hr>
</body>
</html>
