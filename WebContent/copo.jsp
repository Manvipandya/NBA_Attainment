<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>CO-POmapping</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
     div 
     {
        
         padding:0px 0px 0px 0px;
         
     }
     body{
         height:100%;
         margin: 0;
         background-color:rgb(250, 253, 236);
     }
     #bdy
     {
         height:72vh;
     }
input
{
	width:8vh;
	 padding: 0px,0px,0px,0px;	 
}
#a1{
    background-color : rgb(198, 235, 155);
    height:6vh;
    text-align:center;
    font-size:20px;
    font-style:bold;
}
#a2{
    background-color : rgb(198, 235, 155);
    text-align:center;
    font-size:20px;
    font-style:bold;
}

#even{
    background-color:rgb(205, 252, 193);
}
#odd{
    background-color:rgb(170, 211, 160);
}


input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width:100%;
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
}

input[type=reset]:hover {
  background-color:red;
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
            
            <div class="col-lg-9" >
            
            
            <form action="copomapping">

 			<br><br>
					  <div class="row" >
					  
					      <div class="col-lg-1" id="a1">COs</div>
					      <div class="col-lg-10" id="a1">
					      <div class="row">
					      	<div class="col-lg-1">PO1</div>
					      	<div class="col-lg-1">PO2</div>
					      	<div class="col-lg-1">PO3</div>
					      	<div class="col-lg-1">PO4</div>
					      	<div class="col-lg-1">PO5</div>
					      	<div class="col-lg-1">PO6</div>
					      	<div class="col-lg-1">PO7</div>
					      	<div class="col-lg-1">PO8</div>
					      	<div class="col-lg-1">PO9</div>
					      	<div class="col-lg-1">PO10</div>
					      	<div class="col-lg-1">PO11</div>
					      	<div class="col-lg-1">PO12</div>
					      	</div>
					      </div>
					      
					    </div>
					    
    					<%
    					 String subject = (String)session.getAttribute("subject");
         				 String username = (String)session.getAttribute("username");
          				String class1 = (String)session.getAttribute("class1");
          				String designation = (String)session.getAttribute("designation");
          				int subject1 = Integer.parseInt(subject);
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                    String query = "Select * from copo where course_id = '"+subject1+"'";
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    rs.next();
                   %>
                   <br><br>
                   <% 
                 
                   int i;
                   int count=0;
        			 int courseid=Integer.parseInt((String)session.getAttribute("subject"));
                     Statement st=conn.createStatement();
         			ResultSet rs1=st.executeQuery("select * from co where course_id='"+courseid+"'");
         			while(rs1.next())
         			{
         				count++;
         			}
              
                   for(i=1;i<=count;i++)
                   {
                	   
                   %>
   
							    <div class="row" >
							      <div class="col-lg-1" id="a2">CO<%=i%></div>
							      <div class="col-lg-10">
							      <div class="row " >
							      <% 
							      
							      
							      int j;
							      for(j=1;j<=12;j++)
							      {
							    	  if(rs.getInt("mapping") != -1)
							    	  {
							    	  %>
							      
							      	<div class="col-lg-1" ><input type="text" name="<%=i%><%=j%>"  placeholder=<%=rs.getInt("mapping")%> disabled style="background-color:white;text-align:center;color:black;border:none;"></div>
							      	
							      	<% }
							    	  else
							    	  {%>
							    		  <div class="col-lg-1" ><input type="text" name="<%=i%><%=j%>"  placeholder="-" disabled style="background-color:white;text-align:center;color:black;border:none;"></div>
							    	 <%  }
							    	  
							    	  rs.next(); 
							      	
							      }
							      	%>
							      	
							      	</div>
							      </div>
							      
							    </div>
							    <br>
   					 <% 
                   }
                  
                  %> 
    
    <br>
    
	
    <div class="row">
      <div class="col-lg-4"></div>
      <div class="col-lg-5">
        <br>
             
      </div>
    </div>
    <%                 
                                }
                                catch(Exception e)
                                {
                                  e.printStackTrace();
                                }

                       %>
       
</form>


<form action ="refer">
<div class="row">
<div class="col-lg-4"></div>
<%
if(session.getAttribute("designation").equals( "coordinator")||session.getAttribute("designation").equals( "hod"))
{
%>
<div class="col-lg-4">
	<input type="submit" value="UPDATE">
	</div>
</div>

 <% 
}
%>
</form>

            </div>
            
            
        </div>
         <%@include file="footer.jsp" %>
    </div>

	
  
</body>
</html>
    