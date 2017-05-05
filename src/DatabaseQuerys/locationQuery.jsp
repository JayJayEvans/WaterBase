<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Untitled Document</title>
</head>

<body>

<script type="text/javascript">

    function myNewFunction(sel)
    {</script>
      <%String temp = request.getParameter("isTitles");%>
        <script type="text/javascript">
        alert(</script> <%request.getParameter("isTitles");%> <script>); 
        //alert(sel.options[sel.selectedIndex].text);
        //alert(System.out.println("ejay"));
    }
</script>



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

  <% 
  String maxlong = new String(); 
  String maxlat = new String(); 
  String minlong = new String(); 
  String minlat = new String(); 
  int ejay = 0; 
  %> 




  <%
//Java 

  maxlong = request.getParameter("max_long"); 
  minlong= request.getParameter("min_long"); 
  maxlat= request.getParameter("max_lat"); 
  minlat = request.getParameter("min_lat"); 

  try{
  Double.parseDouble(maxlong);
  Double.parseDouble(minlong);
  Double.parseDouble(maxlat);
  Double.parseDouble(minlat);

}catch(Exception e){
%> 
<script> //javascript
  alert("Please enter valid number!\nTry again!");
  event.preventDefault();
</script>
<% //end java script  
} //back to java

String locationQ = String.format("SELECT Transducers.TransID, Transducers.WellID FROM Transducers, (SELECT Well.WellID FROM Well WHERE Well.Latitude > %s AND Well.Latitude < %s AND Well.Longitude >%s AND Well.Longitude < %s ) AS WELLids WHERE WELLids.WellID = Transducers.WellID;", minlat, maxlat, minlong, maxlong);



ps = conn.prepareStatement(locationQ);
rs = ps.executeQuery();


%>

<select id="isTitles" name="isTitles" onchange="myNewFunction(this);" >
<option value="" disabled selected>Select ID you want information for</option>

<%
while(rs.next()){

  %><option> Transducer_ID=<%
  out.print(rs.getInt(1) + " "); %> Well_ID=
  <% out.print(rs.getInt(2) + " "); 
  %></option>
  <%
}%>
</select>

<script type="text/javascript">

    function myNewFunction(sel)
    {</script>
      
        <script type="text/javascript">
        alert(</script> <%request.getParameter("isTitles");%> <script>); 
        //alert(sel.options[sel.selectedIndex].text);
        //alert(System.out.println("ejay"));
    }
</script>

<script>/*
    function myNewFunction(sel)
    {
      
      
        alert(sel.options[sel.selectedIndex].text);
        alert(<%System.out.println("ejay");%>);
    }*/
</script>

<%

 



String tQ = String.format("SELECT * FROM Transducers, (SELECT Well.WellID FROM Well WHERE Well.Latitude > %s AND Well.Latitude < %s AND Well.Longitude >%s AND Well.Longitude < %s ) AS WELLids WHERE WELLids.WellID = Transducers.WellID;", minlat, maxlat, minlong, maxlong);


%>


</body>
</html>
