<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Untitled Document</title>
</head>

<body>

  <link rel="stylesheet" href="../CSS/rainfall.css"/>  

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
  int tran_id; 
  int well_id; 
  int ejay = 0; 
  %> 

<%
//Java 

  tran_id = request.getParameter("tran_id"); 
  well_id= request.getParameter("well_id"); 

  try{

    if(tran_id == null){
      out.println("tran_id empty"); 
    }


  }catch(Exception e){


  }

%>














