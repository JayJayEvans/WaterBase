<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Untitled Document</title>
</head>

<body>

<link rel="stylesheet" href="../CSS/location.css"/>  



<script>
  clicked(){
    location.reload();
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
  ResultSet rs=null, rs1 = null; 
  Connection conn;
  Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection("jdbc:mysql://ec2-52-42-229-104.us-west-2.compute.amazonaws.com:3306/project", "evansj", "suiteswellzwfate1");
  boolean casingOccured = false;
  Statement st=conn.createStatement();
  %>

  <% 
  String trani_id = new String(); 
  int [] result = null; 
  String query = new String(); 
  result = (int [])session.getAttribute("results"); 
  %> 
  <script type="text/javascript">
      cache.delete(request,{options}).then(function(true) {
        //your cache entry has been deleted
      });</script>


<%
//Java 

  trani_id = request.getParameter("tran_id"); 


  try{

      List<Integer> intList = new ArrayList<Integer>();
      for (int i = 0; i < result.length; i++)
      {
          intList.add(result[i]);
      }
      if(intList.contains(Integer.parseInt(trani_id))){
        
         query = String.format("SELECT * FROM TransducerRecords WHERE %d = TransducerRecords.TransID;",Integer.parseInt(trani_id));

         ps = conn.prepareStatement(query);
         rs = ps.executeQuery();

        %>

          <center><table style="width:50%">
           <tr>
           <th align='center'>Transducer ID</th>
           <th align='center'>Temperature</th>
           <th align='center'>Conductivity</th> 
           <th align='center'>Pressure</th>
           <th align='center'>Salinity</th> 
           <th align='center'>TDS</th>
           <th align='center'>DateTime</th> 
           </tr>



<%

         if(!rs.next()){

          %> 
          <tr>
              <td><center> <%out.print("<   empty record >"); %> </td></center>
          </tr>

          <%

         }else{

            rs.beforeFirst(); 
             while(rs.next()){
             double  temp1 = -100.0; 
              %>
                <tr>

                    <td align='center'><%out.print(rs.getInt(1));%></td>


                    <td align='center'><%
                    temp1 = rs.getDouble(2);
                    if(rs.wasNull()){
                      out.print("NULL");
                    }else{
                        out.print(temp1);
                    }
                    

                    %></td>

                    <td align='center'><%
                    temp1 = rs.getDouble(3);
                    if(rs.wasNull()){
                      out.print("NULL");
                    }else{
                        out.print(temp1);
                    }
                    

                    %></td>

                    <td align='center'><%
                    temp1 = rs.getDouble(4);
                    if(rs.wasNull()){
                      out.print("NULL");
                    }else{
                        out.print(temp1);
                    }
                    

                    %></td>

                    <td align='center'><%
                    temp1 = rs.getDouble(5);
                    if(rs.wasNull()){
                      out.print("NULL");
                    }else{
                        out.print(temp1);
                    }
                    

                    %></td>



                    <td align='center'><%
                    temp1 = rs.getDouble(6);
                    if(rs.wasNull()){
                      out.print("NULL");
                    }else{
                        out.print(temp1);
                    }
                    

                    %></td>





                    <td align='center'><%out.print(rs.getTimestamp(7));%></td>
                </tr>
                <%
             }
           }
      }
      else{
        throw new Exception(); 
      }
    

  }catch(Exception e){

      %> 
      <script> 
          alert("Verify that ID appears in result table\nPlease Try again!"); 
          window.history.back();
      </script>
      <%

  }

%>















