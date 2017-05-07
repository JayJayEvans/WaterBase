  <%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
  <!DOCTYPE html>
<html>
<head>


  <link href="../CSS/menu.css" rel="stylesheet" type="text/css"/>
    <nav id="navigation">
      <a href="../../index.jsp" class="logo"> WaterBase</a>
      <ul class="links">    
                  
                <li class="dropdown"><a href="#" class="trigger-drop">File Upload<i class="arrow"></i></a><ul class="drop">
                      <li><a href="../DatabaseInsertion/wellUpload.jsp">Well</a></li>
                <li><a href="../DatabaseInsertion/transducerUpload.jsp">Transducer</a></li>
                            </ul></li>


           <li class="dropdown"><a href="#" class="trigger-drop">Search Data<i class="arrow"></i></a><ul class="drop">

                <li><a href="../DatabaseQuerys/wellQuery.jsp">Well Data</a></li>
                      <li><a href="../DatabaseQuerys/transReadingsQuery.jsp">Transducer Data</a></li>
                <li><a href="../DatabaseQuerys/location.jsp">Location Data</a></li>


                <li><a href="../DatabaseQuerys/advancedQuery.jsp">Advanced Transducer Data</a></li>

                              </ul></li>

            <li class="dropdown"><a href="#" class="trigger-drop">Enter Data<i class="arrow"></i></a><ul class="drop">
                <li><a href="../DatabaseInsertion/manualEntry.jsp">Well</a></li>
                  <li><a href="../DatabaseInsertion/manualSingleTrans.jsp">Transducer</a></li>
                <li><a href="../DatabaseInsertion/manualTransEntry.jsp">Recordings</a></li>
                <li><a href="../DatabaseInsertion/rainfall.jsp">Rainfall</a></li>
                                </ul></li>

         
        
               <li><a href="../AccountControl/contact.jsp">Contact Us</a></li>


      

    </ul>

  </nav>
  <link rel="stylesheet" href="../CSS/rainfall.css"/>  

    
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
