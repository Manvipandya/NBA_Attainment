<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Final-report</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
 
     body{
         height:100%;
         margin: 0;
         background-color:rgb(250, 253, 236);
     }
    



button
{
    background-color:white;
    color:black;
    width:100%;
    height:3vh;
    margin-top:7px;
    text-align:center;
}
#tar{
    background-color:rgb(222, 250, 215);
    text-align:center;
    border-style:solid;
}

input{
    border-style:solid;
    height:4vh;
    width:22vh;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width:100%;
  height:6vh;
}

input[type=submit]:hover {
  background-color: #45a049;
}
input[type=reset] {
  background-color: red;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width:100%;
  height:6vh;
}
h3 {text-align: center;}
input[type=reset]:hover {
  background-color:red;
}

table {
  border-style: solid;
  width: 100%;
  border-width:2px;
}

th, td {
  text-align: left;
  padding: 8px;
  color: black;
}

tr:nth-child(odd){background-color:rgb(203, 236, 205); }
tr:nth-child(even){background-color: }
th {
  background-color: rgb(227, 243, 189);
  color: black;
}

</style>
  </style>
   <script type="text/javascript">
	
	history.pushState(null,null,location.href);
	window.onpopstate = function(){
		history.go(1);
	}
	
</script>
</head>
<body>
    <div class="container-fluid">
        <%@include file="header.jsp" %>

             <div class="row" id="bdy">
                    <br><br>
                    <div class="col-lg-2" >
        
                            <br><br>
        
                                   <%@include file="dashboardoriginal.jsp" %>
                    </div>


            <div class="col-lg-1"></div>

            <div class="col-lg-7">
                <br><br>
                        <h3>TARGET</h3><br>
                       <table>
                           <tr>
                               <th>TARGET</th>
                               <th>UT</th>
                              
                               <th>SPPU</th>
                           </tr>
                        
                            <%
                            String dash = "-";
                            int co_no=7;
                            String subject = (String)session.getAttribute("subject");
             				 String username = (String)session.getAttribute("username");
              				String class1 = (String)session.getAttribute("class1");
              				String designation = (String)session.getAttribute("designation");
              				int subject1 = Integer.parseInt(subject);
              				int class2 = Integer.parseInt(class1);
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                    Statement st=conn.createStatement();
                        			ResultSet rs1=st.executeQuery("select year(CURDATE()) as year1");
                        			rs1.next();
                        			int acad_year=rs1.getInt("year1");
                                    String query = "Select * from target where course_id = '"+subject+"' and acad_year='"+acad_year+"'";
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    rs.next();
                                        %>
                                        	<tr>
                                        	<td>LEVEL1</td>
                                            <td><%= rs.getInt("target")%></td>
                                           	<% rs.next(); %>
                                           	<td><%= rs.getInt("target")%></td>
                                           	
                                           </tr>
                                           <tr>
                                        	<td>LEVEL2</td>
                                        	<% rs.next(); %>
                                            <td><%= rs.getInt("target")%></td>
                                           	<% rs.next(); %>
                                           	<td><%= rs.getInt("target")%></td>
                                           
                                           </tr>
                                           <tr>
                                        	<td>LEVEL3</td>
                                        	<% rs.next(); %>
                                            <td><%= rs.getInt("target")%></td>
                                           	<% rs.next(); %>
                                           	<td><%= rs.getInt("target")%></td>
                                           
                                           </tr>
                                        <%
                                    
                                }
                                catch(Exception e)
                                {
                                  
                                }

                                %>
                        
                        
                       </table>
                 
                        <br><br><br>
                     <h3>SECTION-9</h3><br>
                       <table>
                           <tr>
                               <th>LEVEL</th>
                               <th>CO1</th>
                               <th>CO2</th>
                               <th>CO3</th>
                               <th>CO4</th>
                               <th>CO5</th>
                               <th>CO6</th>
                               <th>CO7</th>
                               <th>SPPU</th>
                           </tr>
                           
                           <%
                            
                           
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                    String query = "Select * from counter where course_id = '"+subject+"' and class_id='"+class2 +"'";
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    rs.next();
                                    dash = "-";
                                        %>
                                        
                           <tr>
                                <td>LEVEL1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            <%--  <%    int k;
                             	
                                for(k=1;k<=co_no;k++)
                                {
                                	String query2 = "Select * from counter where course_id = '"+subject+"' and class_id='"+class2 +"'and co_no = '"+k+"'";
                                    Statement stm2 = conn.createStatement();
                                    ResultSet rs2 = stm2.executeQuery(query2);
                                    rs2.next();
                                    int cono = rs2.getInt("co_no");
                                    if(k == cono){
                                    	
                                    %>
                                	<td>
                                		<%= rs2.getInt("level1")%>
                                	</td>
                                	<%}else{ %>
                                	<td><%=rs2.getString("dash") %></td>
                                	
                                	<%} 
                                }
                                %> --%>
                           </tr>
                           <tr>
                                <td>LEVEL2</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                
                           </tr>
                           <tr>
                                <td>LEVEL3</td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                             	<td></td>
                           </tr>
                           
                              <%
                                    
                                }
                                catch(Exception e)
                                {
                                  
                                }

                                %>
                       </table>


                       <br><br><br>
                       <h3>SECTION-10</h3><br>
                       <table>
                           <tr>
                               <th>LEVEL</th>
                               <th>CO1</th>
                               <th>CO2</th>
                               <th>CO3</th>
                               <th>CO4</th>
                               <th>CO5</th>
                               <th>CO6</th>
                               <th>CO7</th>
                               <th>SPPU</th>
                           </tr>
                           <tr>
                                <td>LEVEL1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                           <tr>
                                <td>LEVEL2</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                                <td></td>
                           </tr>
                           <tr>
                                <td>LEVEL3</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                       </table>



                       <br><br><br>
                       <h3>SECTION-11</h3><br>
                       <table>
                           <tr>
                               <th>LEVEL</th>
                               <th>CO1</th>
                               <th>CO2</th>
                               <th>CO3</th>
                               <th>CO4</th>
                               <th>CO5</th>
                               <th>CO6</th>
                               <th>CO7</th>
                               <th>SPPU</th>
                           </tr>
                           <tr>
                                <td>LEVEL1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                                <td></td>
                           </tr>
                           <tr>
                                <td>LEVEL2</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                           <tr>
                                <td>LEVEL3</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                       </table>


                       <br><br><br>
                       <h3>TOTAL</h3><br>
                       <table>
                           <tr>
                               <th>LEVEL</th>
                               <th>CO1</th>
                               <th>CO2</th>
                               <th>CO3</th>
                               <th>CO4</th>
                               <th>CO5</th>
                               <th>CO6</th>
                               <th>CO7</th>
                               <th>SPPU</th>
                           </tr>
                           <tr>
                                <td>LEVEL1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                           <tr>
                                <td>LEVEL2</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                           <tr>
                                <td>LEVEL3</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                       </table>

                       <br><br><br>
                       <h3>TOTAL(IN %)</h3><br>
                       <table>
                           <tr>
                               <th>LEVEL</th>
                               <th>CO1</th>
                               <th>CO2</th>
                               <th>CO3</th>
                               <th>CO4</th>
                               <th>CO5</th>
                               <th>CO6</th>
                               <th>CO7</th>
                               <th>SPPU</th>
                           </tr>
                           <tr>
                                <td>LEVEL1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                           <tr>
                                <td>LEVEL2</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                                <td></td>
                           </tr>
                           <tr>
                                <td>LEVEL3</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                                <td></td>
                           </tr>
                       </table>


                       <br><br><br>
                       <h3>ATTAINMENT(actual)</h3><br>
                       <table>
                           <tr>
                               <th>LEVEL</th>
                               <th>CO1</th>
                               <th>CO2</th>
                               <th>CO3</th>
                               <th>CO4</th>
                               <th>CO5</th>
                               <th>CO6</th>
                               <th>CO7</th>
                               <th>SPPU</th>
                           </tr>
                           <tr>
                                <td>LEVEL1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                           <tr>
                                <td>LEVEL2</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                           <tr>
                                <td>LEVEL3</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                                <td></td>
                           </tr>
                       </table>


                       <br><br><br>
                       <h3>ATTAINMENT(approx)</h3><br>
                       <table>
                           <tr>
                               <th>LEVEL</th>
                               <th>CO1</th>
                               <th>CO2</th>
                               <th>CO3</th>
                               <th>CO4</th>
                               <th>CO5</th>
                               <th>CO6</th>
                               <th>CO7</th>
                               <th>SPPU</th>
                           </tr>
                           <tr>
                                <td>LEVEL1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                                <td></td>
                           </tr>
                           <tr>
                                <td>LEVEL2</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                           <tr>
                                <td>LEVEL3</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td> 
                           </tr>
                       </table>
                        
            </div>
            

        </div>

        
<br><br>
         <%@include file="footer.jsp" %>
</div>

</body>
</html>