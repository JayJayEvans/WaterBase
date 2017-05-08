<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Untitled Document</title>
</head>

<body>

  <link rel="stylesheet" href="../CSS/location.css"/>  

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
  
  if(Double.parseDouble(maxlong) > 180.0 || Double.parseDouble(maxlong) < -180){
      throw new Exception(); 
  }
  if(Double.parseDouble(minlong) < -180.0 || Double.parseDouble(minlong) > 180.0 ){
      throw new Exception(); 
  }

  if( Double.parseDouble(maxlat) > 90.0 || Double.parseDouble(maxlat) < -90.0){
      throw new Exception(); 
  }
 
  if( Double.parseDouble(minlat) < -90.0 || Double.parseDouble(minlat) > 90.0){
      throw new Exception(); 
  }






}catch(Exception e){
%> 
<script> //javascript
  window.history.back(); 
  alert("Please enter valid longitude/latitude values!\nTry again!");

 
</script>
<% //end java script  
} //back to java

String locationQ = String.format("SELECT Transducers.TransID, Transducers.WellID FROM Transducers, (SELECT Well.WellID FROM Well WHERE Well.Latitude >= %s AND Well.Latitude <= %s AND Well.Longitude >=%s AND Well.Longitude <= %s ) AS WELLids WHERE WELLids.WellID = Transducers.WellID;", minlat, maxlat, minlong, maxlong);



ps = conn.prepareStatement(locationQ);
rs = ps.executeQuery();
int index = 0; 

%>

<center><table style="width:15%">
  <tr>
    <th align='center'>Transducer ID</th>
    <th align='center'>Well ID</th> 
  </tr>



<%

if(!rs.next()){
  %> 
  <tr>
    <td><center> <%out.print("<   empty   >"); %> </td></center>
  </tr>
 
  <%
}else{
      rs.last();
      int arr[] =  new int[rs.getRow()];
      rs.beforeFirst(); 
      
      while(rs.next()){
        arr[index] = rs.getInt(1); 
        index++; 
        %><tr>
          <td align='center'><%out.print(rs.getInt(1));%></td>
          <td align='center'><%out.print(rs.getInt(2));%></td>
        </tr>
<%
      }
      %>
      <script type="text/javascript">
      cache.delete(request,{options}).then(function(true) {
        //your cache entry has been deleted
      });</script>
      <%
      session.setAttribute("results", arr);
       
}




%>
</center></table> 

  
<div class="container2">  
        <form id="rainfall"  action="locationQuery2.jsp" method="post">
          <h3><font color ="black"><center>Transducer Lookup</font></center></h3>
          <h4><center><i>Please enter Transducer Id you would like information for from the results above</i></center></h4>

          <center><fieldset>
            Transducer ID: <input placeholder="required" id="tran_id" name="tran_id"  type="number" tabindex="1"  required autofocus>
          </fieldset></center>

          <fieldset>
            <button name="submit" type="submit" id="myBtn"  name="contact-submit"  data-submit="...Sending" >Submit</button>
          </fieldset>
        </form>


 </div> 




</body>
</html>
