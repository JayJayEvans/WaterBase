<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="../CSS/rainfall.css"/>  

  <center>
  <table width="993" height="102" border="0">
    <tr>
      <td width="200" height="120"><img src="http://i66.tinypic.com/346oqht.jpg" width="200" height="120" alt="Logo" /></td>
<<<<<<< HEAD:src/AccountControl/rainfall.jsp
      <td align="right" width="726" class="right">24X7 Customer Support - <a href="./contact.jsp">Contact us</a> | <a href="../../index.jsp">Home</a> | 
=======
      <td align="right" width="726" class="right">24X7 Customer Support - <a href="./contact.jsp">Contact us</a> | <a href="../main.jsp">Home</a> | <a href="./rainfall.jsp">Rainfall Info</a> | 
>>>>>>> 5e0bce9871a2fcd6da5ff7cc372dcd35a4f5d4c4:src/DatabaseInsertion/rainfall.jsp
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
<title>Rainfall Information</title>
</head>
<body>

<script type="text/javascript">
          function clicked() {

                if(!document.getElementById('avg_amt').value && !document.getElementById('true_amt').value){
                  location.reload(true);
                    alert("You must provide Actual Rainfall, Average Rainfall, or both!\nPlease try again!");
                    event.preventDefault();
                    return false;

                    
                }

                return true;
                
          }

    </script>

<div class="container">  
  <form id="rainfall" action="rainfallcong.jsp" method="post">
    <h3><font color ="black"><center>Rainfall Information</font></center></h3>
    <h4><center><i>Please enter rainfall information below</i></center></h4>
    <fieldset>
      <input placeholder="Longitude" name="long" type="text" tabindex="1" required autofocus>
      <font size="1px" color="red"> *required</font>
    </fieldset>
    <fieldset>
      <input placeholder="Latitude" name="lang" type="text" tabindex="2" required autofocus>
       <font size="1px" color="red"> *required</font>
    </fieldset>
    <fieldset>
      <input placeholder="Date" id="dato" name='date' type="text" tabindex="3" required autofocus>
       <font size="1px" color="red"> *required MM/DD/YYYY</font>
    </fieldset>
    
    <fieldset>
      <input placeholder="Amount of rainfall at provided location on entered date" name='true_amount' id='true_amt' type="text" tabindex="4">
    </fieldset>
    <fieldset>
      <input placeholder="Avg amount of rainfall at provided location for any date" name="avg_amount" id ='avg_amt' type="text" tabindex="5" >
    </fieldset>
    <fieldset>
      <textarea placeholder="Please provide any additional comments (if any): " name='comment' tabindex="5" ></textarea>
    </fieldset>
    <fieldset>
      <button name="submit" type="submit" name="contact-submit" onclick="clicked();" data-submit="...Sending" >Submit</button>
    </fieldset>
  </form>
 
  
</div>

</body>
</html>


