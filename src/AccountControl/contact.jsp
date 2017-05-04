<html>
<head>
  <title>Contact Us</title>
  
  <!-- include css file here-->
   <link rel="stylesheet" href="../CSS/form.css"/>  
   
    <script type="text/javascript" src="https://cdn.emailjs.com/dist/email.min.js"></script>
    <script type="text/javascript">
          function clicked(_name,_email, _message) {

                
                emailjs.init("user_3kXGkqWqfIyOdbDulmL0d");

                emailjs.send("gmail","waterbase",{to_name: _name, email: _email})
                .then(function(response) {
                console.log("SUCCESS. status=%d, text=%s", response.status, response.text);
                }, function(err) {
                console.log("FAILED. error=", err);
                });

                emailjs.send("gmail","tous",{from_name: _name, from_email: _email, message: _message})
                .then(function(response) {
                console.log("SUCCESS. status=%d, text=%s", response.status, response.text);
                }, function(err) {
                console.log("FAILED. error=", err);
                });


                confirm('\tMessage Sent!\n\tYou will be hearing from us soon!');


                location.reload(true);


          }

    </script>



</head>
<body>
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


   <div id="main">
   <h1>Contact Us</h1>
  
  <center>
  <div align="center" id="form_sample">

  

<script type="text/javascript">
        var x = document.getElementById("form_sample");

        var createform = document.createElement('form'); // Create New Element form
          createform.setAttribute("action", "");        // Setting action Attribute on form
          createform.setAttribute("method", "post");  // Setting method Attribute on form
          x.appendChild(createform);

        var heading = document.createElement('h2'); // Heading of form
          heading.innerHTML = "Contact Form ";  
          createform.appendChild(heading);

        var line = document.createElement('hr');  //giving horizontal row after heading
          createform.appendChild(line);

        var linebreak = document.createElement('br');
          createform.appendChild(linebreak);

        var namelabel = document.createElement('label'); // Create Label for name field
          namelabel.innerHTML = "Your Name : ";            // Set Field Labels
          createform.appendChild(namelabel);

        var inputelement = document.createElement('input'); // Create input field for name
          inputelement.setAttribute("type", "text");  
          inputelement.setAttribute("name", "dname");
          inputelement.setAttribute("id","namehere");
          createform.appendChild(inputelement);

        var linebreak = document.createElement('br');
          createform.appendChild(linebreak);


        var emaillabel = document.createElement('label');  //Create Label for email field
          emaillabel.innerHTML = "Your Email : ";
          createform.appendChild(emaillabel);

        var emailelement = document.createElement('input'); // Create input field for email
          emailelement.setAttribute("type", "text");
          emailelement.setAttribute("name", "demail");
          emailelement.setAttribute("id","emailhere");
          createform.appendChild(emailelement);

        var emailbreak = document.createElement('br');
          createform.appendChild(emailbreak);

        // Append Textarea
        var messagelabel = document.createElement('label'); 
          messagelabel.innerHTML = "Your Message : ";
          createform.appendChild(messagelabel);

        var texareaelement = document.createElement('textarea'); 
          texareaelement.setAttribute("name", "dmessage");
          texareaelement.setAttribute("id","messagehere");
          createform.appendChild(texareaelement);

        var messagebreak = document.createElement('br');
          createform.appendChild(messagebreak);

        

        var _name = document.getElementById("namehere").value;
        var _email = document.getElementById("emailhere").value;




   </script>
   
   <input type="submit" onclick="clicked( document.getElementById('namehere').value, document.getElementById('emailhere').value, document.getElementById('messagehere').value);" value="Submit" />

</div></center>


   <!-- include JavaScript file here -->
   <!-- <script src="../JS/form.js"></script>  -->
      
</center>
</body>

</html>