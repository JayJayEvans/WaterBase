  <%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
  <!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="../CSS/rainfall.css"/>  

    <center>
      <table width="993" height="102" border="0">
        <tr>
          <td width="200" height="120"><img src="http://i66.tinypic.com/346oqht.jpg" width="200" height="120" alt="Logo" /></td>
          <td align="right" width="726" class="right">24X7 Customer Support - <a href="./contact.jsp">Contact us</a> | <a href="../../index.jsp">Home</a> | 
            <% if(session.getAttribute("uname")==null) {
            %>
            <a href="../../index.jsp">Login</a>
            <%} else {
            %>
            <a href="./logout.jsp">Logout</a>
            <%}%></td>
          </tr>
        </table>
      </center>
      <title>Location Query</title>



</head>
<body>





<%@ page import="java.io.*" %>
 <%@ page language="java" %>
         <%@ page import="java.sql.*" %>
            <%@ page import="java.sql.DriverManager.*" %>
              <%@ page import="java.io.*" %>
                <%@ page import="java.util.*" %>

  <%     
  PreparedStatement ps;
  PreparedStatement ps1;
  PreparedStatement ps2;
  PreparedStatement ps3;
  ResultSet rs=null;
  Connection conn;
  Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");
  boolean casingOccured = false;
  Statement st=conn.createStatement();
  %>

<!-- Trigger/Open The Modal -->


<script type="text/javascript">
      cache.delete(request,{options}).then(function(true) {
        //your cache entry has been deleted
      });
</script>

<div class="container">  
        <form id="rainfall"  action="locationQuery.jsp" method="post">
          <h3><font color ="black"><center>Location Query</font></center></h3>
          <h4><center><i>Please enter query information below</i></center></h4>

          <center>
          <fieldset>
            <input placeholder="Maximum Longitude" id="max_longi" name="max_long" type="number" tabindex="1" required autofocus>
            <font size="1px" color="red"> *required</font>
          </fieldset></center>

          <center>
          <fieldset>
            <input placeholder="Minimum Longitude" id="min_longi" name="min_long" type="number" tabindex="1" required autofocus>
            <font size="1px" color="red"> *required</font>
          </fieldset></center>

          <center>
          <fieldset>
            <input placeholder="Maximum Latitude" id="max_lati" name="max_lat" type="number" tabindex="2" required autofocus>
            <font size="1px" color="red"> *required</font>
          </fieldset></center>


          <center>
          <fieldset>
            <input placeholder="Minimum Latitude" id="min_lati" name="min_lat" type="number" tabindex="1" required autofocus>
            <font size="1px" color="red"> *required</font>
          </fieldset></center>

          <fieldset>
            <button name="submit" type="submit" id="myBtn" name="contact-submit"  data-submit="...Sending" >Submit</button>
          </fieldset>
        </form>


 </div> 

</body>
</html>
