<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <title>INDEX</title>
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
     
tr:nth-child(even) {
  background-color: #f2f2f2
}
tr{
    height:5vh;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 30vh;
  border: 1px solid #ddd;
}


th, td {
  text-align: left;
  padding: 0px,0px,0px,0px;
}


input
{
	width:8vh;
	 padding: 0px,0px,0px,0px;
	  text-align:center;
	 
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
            
            
            <form action="Entermarks">

 <br><br>
  <div class="row"id="a1" >
  
      <div class="col-lg-2" >ROLL_NO</div>
      
      <div class="col-lg-3">
        <div class="row">
        <div class="col-lg-4">Q1-A</div>
        <div class="col-lg-4">Q1-B</div>
        <div class="col-lg-4">Q1-C</div>
      </div>
      </div>
      
      <div class="col-lg-3">
          <div class="row">
        <div class="col-lg-4">Q2-A</div>
        <div class="col-lg-4">Q2-B</div>
        <div class="col-lg-4">Q2-C</div>
      </div>
      </div>
     
      <div class="col-lg-3">
          <div class="row">
        <div class="col-lg-4">Q3-A</div>
        <div class="col-lg-4">Q3-B</div>
        <div class="col-lg-4">Q3-C</div>
      </div>
      </div>
      
  </div>
  <%
  
  String subject = (String)session.getAttribute("subject");
	 String username = (String)session.getAttribute("username");
	String class1 = (String)session.getAttribute("class1");
	String designation = (String)session.getAttribute("designation");
	int class2 = Integer.parseInt(class1);
                   				
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                    String query = "Select * from entermarks ";
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    rs.next();
                                   // System.out.print(subject + username + class1 + designation);
                   %>
  <br>
  
  <%
  	int i;
  int num=50;
  for(i=1;i<=num;i++)
  {
	  %>
	  	<div class="row" id="one">
	  	 	<div class="col-lg-2" id="a2">3<%=class2%><%=i%></div>
	  	 	<%
	  	 		int j;
	  	 		for(j=1;j<=3;j++)
	  	 		{
	  	 			%>
	  	 			<div class="col-lg-3">
	  	 			<div class="row">
	  	 			<%
	  	 				int k;
	  	 				for(k=1;k<=3;k++)
	  	 				{
	  	 					%>
	  	 					
	  	 					<div class="col-lg-4" ><input type="text" name="<%=i%><%=j%><%=k%>" ></div>
	  	 					<%rs.next(); %>
	  	 					<% 
	  	 				}
	  	 			%>
	  	 			</div>
	  	 			</div>
	  	 			<% 
	  	 		}
	  	 	%>
	  	 	</div>
	  	 	<br>
	  <% 
  }
 %>
  
  
     
      
      
        
        <br><br>   
    <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-3">
            
                <input type="submit" value="SUBMIT">
            </div>
            <div class="col-lg-2"></div>
            <div class="col-lg-3">
            
                <input type="reset" value="RESET">
            </div>
    </div>
       



	
	 
</form>
<form action="refer4">
	      
    <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-3">
              <br>
                <%
	
              if(session.getAttribute("designation").equals( "teacher")||session.getAttribute("designation").equals( "hod"))
          	{
          		%>  
                <input type="submit" value="UPDATE"> 
                   <%
	}
    %>
            </div>
    </div>
</form>



  <%   }
                                catch(Exception e)
                                {
                                  
                                }

                       %>
       
          
            </div>
            
            
        </div>
         <%@include file="footer.jsp" %>
    </div>


   
</body>
</html>
