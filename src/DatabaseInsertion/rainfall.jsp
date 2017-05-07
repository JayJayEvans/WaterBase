<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="../CSS/rainfall.css"/>  

  <center>
  <table width="993" height="102" border="0">
    <tr>
      <td width="200" height="120"><img src="http://i66.tinypic.com/346oqht.jpg" width="200" height="120" alt="Logo" /></td>
      <td align="right" width="726" class="right">24X7 Customer Support - <a href="../AccountControl/contact.jsp">Contact us</a> | <a href="../../index.jsp">Home</a>  
    
    </tr>
    </table>
    </center>
<title>Rainfall Information</title>
</head>
<body>

<script type="text/javascript">
          function clicked() {
                if(document.getElementById('dato').value && !document.getElementById('true_amt').value){
                  //location.reload(true);
                    alert("You must provide true amount if date is provided!\nPlease try again!");
                    event.preventDefault();
                    return false;
                    
                }
                if(!document.getElementById('dato').value && document.getElementById('true_amt').value){
                    alert("You must provide date if true amount is provided!\nPlease try again!");
                    event.preventDefault();
                    return false;
                }

                if(document.getElementById('longi').value && document.getElementById('lati').value)
                  if ((!document.getElementById('dato').value && !document.getElementById('avg_amt').value)){
                    alert("You have the following options:\n\t• Longitude, Latitude, Date, and True Amount\n\t• Longitude, Latitude, and  Average Amount\nPlease Try Again!");
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
      <input placeholder="Longitude" id="longi" name="long" type="text" tabindex="1" required autofocus>
      <font size="1px" color="red"> *required</font>
    </fieldset>
    <fieldset>
      <input placeholder="Latitude" id="lati" name="lang" type="text" tabindex="2" required autofocus>
       <font size="1px" color="red"> *required</font>
    </fieldset>
    <fieldset>
      <input placeholder="Date" id="dato" name='date' type="text" tabindex="3">
       <font size="1px" color="red"> MM/DD/YYYY</font>
    </fieldset>
    
    <fieldset>
      <input placeholder="Amount of rainfall at provided location on entered date" name='true_amount' id='true_amt' type="text" tabindex="4">
    </fieldset>
    <fieldset>
      <input placeholder="Avg amount of rainfall at provided location for any date" name="avg_amount" type="text" id='avg_amt' tabindex="5" >
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
