<html>
<head>
  <title>Contact Us</title>
  
<link href="../CSS/menu.css" rel="stylesheet" type="text/css"/>
  <nav id="navigation">
      <a href="../../index.jsp" class="logo"> WaterBase&copy;</a>
      <ul class="links">    
                  
                <li class="dropdown"><a href="#" class="trigger-drop">File Upload<i class="arrow"></i></a><ul class="drop">
                      <li><a href="../DatabaseInsertion/wellUpload.jsp">Well</a></li>
                <li><a href="../DatabaseInsertion/transducerUpload.jsp">Transducer</a></li>
                            </ul></li>


            <li class="dropdown"><a href="#" class="trigger-drop">Query Data<i class="arrow"></i></a><ul class="drop">
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

         
        
           <li><a href="./contact.jsp">Contact Us</a></li>

      

    </ul>

</nav>

  <!-- include css file here-->
   <link rel="stylesheet" href="../CSS/form.css"/>  
   
    <script type="text/javascript" src="https://cdn.emailjs.com/dist/email.min.js"></script>
    <script type="text/javascript">
          function clicked(_name,_email) {

                
                emailjs.init("user_3kXGkqWqfIyOdbDulmL0d");

                emailjs.send("gmail","waterbase",{to_name: _name, email: _email})
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

  


   <div id="main">
    
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
          createform.appendChild(texareaelement);

        var messagebreak = document.createElement('br');
          createform.appendChild(messagebreak);

        

        var _name = document.getElementById("namehere").value;
        var _email = document.getElementById("emailhere").value;




   </script>
   
   <input type="submit" onclick="clicked( document.getElementById('namehere').value, document.getElementById('emailhere').value);" value="Submit" />

</div></center>


   <!-- include JavaScript file here -->
   <!-- <script src="../JS/form.js"></script>  -->
      
</center>
</body>

</html>
