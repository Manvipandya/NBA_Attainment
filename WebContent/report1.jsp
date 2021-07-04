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
                <% 
                try{
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                    String subject = (String)session.getAttribute("subject");
                    int subject1 = Integer.parseInt(subject);
                    ResultSet rs,rs1,rs2;
                Statement stm = conn.createStatement();
                rs2 = stm.executeQuery("Select year(CURDATE()) as year1");
				rs2.next();
				int acad_year = rs2.getInt("year1");
				
				 %>
                	<h3>ANALYSIS</h3>
                	<table>
                		<tr>
                			<th></th>
                			<th colspan="2">Level-1</th>
                			<th colspan="2">Level-2</th>
                			<th colspan="2">Level-3</th>
                		</tr>
                		<tr>
                			<td></td>
                			<td>UT</td>
							<td>SPPU</td>
                			<td>UT</td>
							<td>SPPU</td>
							<td>UT</td>
							<td>SPPU</td>
                		</tr>
                		
                		<%for(int i=1;i<=3;i++)
                		{
                			
                			int year_prev = acad_year-i;
                			int curr_year = year_prev + 1;
                			stm=conn.createStatement();
              				rs = stm.executeQuery("Select * from record where test_id = 1 and course_id='"+subject1+"' and acad_year = '"+year_prev+"'");
              				rs.next();
              				stm=conn.createStatement();
              				rs1 = stm.executeQuery("Select * from record where test_id = 2 and course_id='"+subject1+"' and acad_year = '"+year_prev+"'");
              				rs1.next();
                			%>
                			<tr>
                				<td><%=year_prev %>-<%=curr_year %></td>
                				<td><%=rs.getFloat("level1") %></td>
                				<td><%=rs1.getFloat("level1") %></td>
                				<td><%=rs.getFloat("level2") %></td>
                				<td><%=rs1.getFloat("level2") %></td>
                				<td><%=rs.getFloat("level3") %></td>
                				<td><%=rs1.getFloat("level3") %></td>
                			</tr>
                			<% 
                			rs.next();
                			rs1.next();
                		}
                		%>
                	</table>
                
                
                
                
                                                       <%
                                    
                                }
                                catch(Exception e)
                                {
                                  
                                }

                                %> 
                
                
                
                

                <br>
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
              				int year=class2/10;
              				
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                   /*  String query = "Select * from target where course_id = '"+subject+"'  ";
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    rs.next(); */
                                    ResultSet rs,rs1,rs2;
                                    Statement stm = conn.createStatement();
                                    rs2 = stm.executeQuery("Select year(CURDATE()) as year1");
                    				rs2.next();
                    				int acad_year = rs2.getInt("year1");
                    				 stm=conn.createStatement();
                     				rs = stm.executeQuery("Select * from target where test_id = 1 and course_id='"+subject1+"' and acad_year = '"+acad_year+"'");
                     				rs.next();
                     				stm=conn.createStatement();
                     				rs1 = stm.executeQuery("Select * from target where test_id = 2 and course_id='"+subject1+"' and acad_year = '"+acad_year+"'");
                     				rs1.next();
                                        %>
                                        	<tr>
                                        	<td>LEVEL1</td>
                                            <td><%= rs.getFloat("level1")%></td>
                                           
                                           	<td><%= rs1.getFloat("level1")%></td>
                                           		
                                           </tr>
                                           <tr>
                                        	<td>LEVEL2</td>
                                        	
                                            <td><%= rs.getFloat("level2")%></td>
                                           
                                           	<td><%= rs1.getFloat("level2")%></td>
                                       
                                           </tr>
                                           <tr>
                                        	<td>LEVEL3</td>
                                        	
                                            <td><%= rs.getFloat("level3")%></td>
                                         
                                           	<td><%= rs1.getFloat("level3")%></td>
                                         
                                           </tr>
                                        <%
                                    
                                }
                                catch(Exception e)
                                {
                                  
                                }

                                %>
                        
                        
                       </table>
                 <%int i,classq=0;
                 for(i=1;i<=3;i++){
                	 classq=i+8;
                	 int concat=Integer.parseInt(Integer.toString(year)+Integer.toString(i));
                	 class2=concat;
                	%>
                	 <br><br><br>
                	
                      <h3>SECTION-<%= classq%></h3><br>
                       <table>
                           
                           
                           <%
                            
                           
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                    Statement stm = conn.createStatement();
                                    ResultSet rs2 = stm.executeQuery("Select year(CURDATE()) as year1");
                    				rs2.next();
                    				int acad_year = rs2.getInt("year1");
                                 	String query = "Select * from levels where course_id = '"+subject+"' and class_id='"+class2 +"' and mykey = 1 and acad_year='"+acad_year+"'and test_id in(1,2) ";
                                    
                                    stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                   
                                    dash = "-";
                                    
                                        %>
                           <tr>
                               <th>LEVEL</th>
                               <% while(rs.next())
                               {
                            	   %>
                            	   	<th>CO<%= rs.getInt("co_no")%></th>
                            	   	
                            	   <% 
                            	   
                               }
                               %>
                              <!--  <th>SPPU</th> -->
                           </tr> 
                           <%rs = stm.executeQuery(query); %>
                           <tr>
                                <td>LEVEL1</td>
                                 <% while(rs.next())
                               {
                            	   %>
                            	   	<td><%= rs.getFloat("level1")%></td>
                            	   	
                            	   <% 
                            	   
                               }
                               %>
                              <!--  <td></td> -->
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
                            <%rs = stm.executeQuery(query); %>
                           <tr>
                                <td>LEVEL2</td>
                               <% while(rs.next())
                               {
                            	   %>
                            	   	<td><%= rs.getFloat("level2")%></td>
                            	   	
                            	   <% 
                            	   
                               }
                               %>
                               <!--  <td></td> -->
                           </tr>
                             <%rs = stm.executeQuery(query); %>
                           <tr>
                                <td>LEVEL3</td>
                             	<% while(rs.next())
                               {
                            	   %>
                            	   	<td><%= rs.getFloat("level3")%></td>
                            	   	
                            	   <% 
                            	   
                               }
                               %>
                             <!--   <td></td> -->
                           </tr>
                           
                              <%
                                    
                                }
                                catch(Exception e)
                                {
                                  
                                }

                                %>
                       </table>

                	 
                	 
                	 
            <%      } %>
                       

                       

                       <br><br><br>
                       
             <%                            for(i=1;i<=3;i++){
                	 classq=i+8;
                	 int concat=Integer.parseInt(Integer.toString(year)+Integer.toString(i));
                	 class2=concat;
                	%>
                	 <br>
                	
                     <h3>ATTAINMENT(SECTION-<%= classq%>)</h3><br>
                       <table>
                           
                           
                           <%
                            
                           
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                    Statement stm = conn.createStatement();
                                    ResultSet rs2 = stm.executeQuery("Select year(CURDATE()) as year1");
                    				rs2.next();
                    				int acad_year = rs2.getInt("year1");
                                 	String query = "Select * from levels where course_id = '"+subject+"' and class_id='"+class2 +"' and mykey = 2 and acad_year='"+acad_year+"'";
                                    
                                    //String query = "Select * from counter where course_id = '"+subject+"' and class_id='"+class2 +"' ";
                                    stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                   
                                    dash = "-";
                                    
                                        %>
                           <tr>
                               <th>LEVEL</th>
                               <% while(rs.next())
                               {
                            	   %>
                            	   	<th>CO<%= rs.getInt("co_no")%></th>
                            	   	
                            	   <% 
                            	   
                               }
                               %>
                              <!--  <th>SPPU</th> -->
                           </tr> 
                           <%rs = stm.executeQuery(query); %>
                           <tr>
                                <td>LEVEL1</td>
                                 <% while(rs.next())
                               {
                            	   %>
                            	   	<td><%= rs.getFloat("level1")%></td>
                            	   	
                            	   <% 
                            	   
                               }
                               %>
                              <!--  <td></td> -->
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
                            <%rs = stm.executeQuery(query); %>
                           <tr>
                                <td>LEVEL2</td>
                               <% while(rs.next())
                               {
                            	   %>
                            	   	<td><%= rs.getFloat("level2")%></td>
                            	   	
                            	   <% 
                            	   
                               }
                               %>
                                <!-- <td></td> -->
                           </tr>
                             <%rs = stm.executeQuery(query); %>
                           <tr>
                                <td>LEVEL3</td>
                             	<% while(rs.next())
                               {
                            	   %>
                            	   	<td><%= rs.getFloat("level3")%></td>
                            	   	
                            	   <% 
                            	   
                               }
                               %>
                             <!-- <td></td> -->
                           </tr>
                           
                              <%
                                    
                                }
                                catch(Exception e)
                                {
                                  
                                }

                                %>
                       </table>

                	 
                	 
                	 
            <%      } %>
                       <!-- <br><br><br>
                       <h3>ATTAINMENT(CLASS_WISE)</h3><br>
                       
                        <table>
                           <tr>
                               <th>CLASS</th>
                               <th>UT</th>
                              
                               <th>SPPU</th>
                               <th>FINAL</th>
                           </tr> -->
                        
                           <%--  <%
                            double final_attain = 0;
              				
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                   /*  String query = "Select * from target where course_id = '"+subject+"'  ";
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    rs.next(); */
                                    ResultSet rs,rs1,rs2;
                                    Statement stm = conn.createStatement();
                                    rs2 = stm.executeQuery("Select year(CURDATE()) as year1");
                    				rs2.next();
                    				int acad_year = rs2.getInt("year1");
                    				
                    				int no_of_co=0,cono;
                    				float l1a,l2a,l3a;
                    				float attainment=0;
                    				int count=0;
                    				
                    				//int classid=Integer.parseInt((String)session.getAttribute("class1"));
                    				int courseid=Integer.parseInt((String)session.getAttribute("subject"));
                    				int test_id=Integer.parseInt((String)session.getAttribute("test_id"));
                    				
                    				
                    				

                     				for( i=1;i<=3;i++){
                     			
                     					int class_id = (class20 * 10) + i;
                     					
                     					
                     					stm=conn.createStatement();
                        				rs=stm.executeQuery("select * from levels where course_id='"+courseid+"'and class_id='"+class_id+"'and test_id='"+test_id+"'and acad_year='"+acad_year+"'and mykey=2");
                        				while(rs.next())
                        				{
                        					count++;

                        					l1a=rs.getFloat("level1");
                        					if(l1a>1)
                        					{
                        						l1a=1;
                        					}
                        					l2a=rs.getFloat("level2");
                        					if(l2a>2)
                        					{
                        						l2a=1;
                        					}
                        					l3a=rs.getFloat("level3");
                        					if(l2a>3)
                        					{
                        						l3a=1;
                        					}
                        					
                        					attainment+=(l1a+l2a+l3a)/6;
                        					
                        					
                        				}
                        				attainment=attainment/count;
                        				stm=conn.createStatement();
                        				stm.executeUpdate("insert into attainment values('"+courseid+"','"+class_id+"','"+test_id+"','"+attainment+"','"+acad_year+"')");
                        				
                        				
                     				}
                    				double final_attainment =0;
                     				for( i=1;i<=3;i++){
                     				
                     					int section = 8 +i;
                     					int class_id = (class20 * 10) + i;
                     					System.out.println("Class ID"+class_id);
                     					 stm=conn.createStatement();
                          				rs = stm.executeQuery("select * from attainment where test_id = 1 and course_id='"+subject1+"' and acad_year = '"+acad_year+"' and class_id ='"+class_id+"'");
                          				rs.next();
                          				System.out.println("Attainment : "+rs.getFloat("attainment"));
                          				//stm=conn.createStatement();
                          				//rs1 = stm.executeQuery("Select * from attainment where test_id = 3 and course_id='"+subject1+"' and acad_year = '"+acad_year+"' and class_id ='"+class_id+"'");
                          				//rs1.next();
                          				//System.out.println("attainment2 :"+rs1.getFloat("attainment"));
                                        %>
                                        <tr>
                                        	<td> <%=data5 %><%=section %></td>
                                            <td><%= rs.getFloat("attainment")%></td>
                                          
                                           	<td>1</td>
                                           	
                                         <%  final_attainment = (rs.getFloat("attainment") * 0.3)+(1*0.7) ;
                                         	final_attain += final_attainment;
                                         %> 
                                           <td><%=final_attainment %></td>
                                        <%
                                    
                     				}
                                    
                                }
                                catch(Exception e)
                                {
                                  
                                }

                                %> 
                        
                        
                       </table>--%>
                     
                      <%--  <table>
                       	<tr>
                       		<th>FINAL ATTAINMENT :</th>
                       		<% final_attain = final_attain/3; %>
                       		<td><%=final_attain %></td>
                       	</tr>
                       </table> --%>
                       
                      
                        
            </div>
            

        </div>

        
<br><br>
         <%@include file="footer.jsp" %>
</div>

</body>
</html>