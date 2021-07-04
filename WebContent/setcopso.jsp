<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>CO-PSOmapping</title>
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
	width:100%;
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
            
            
            <form action="copsomappping">

 			<br><br>
					  <div class="row" >
					  
					      <div class="col-lg-2" id="a1">COs</div>
					      <div class="col-lg-8" id="a1">
					      <div class="row">
					      	<div class="col-lg-4">PSO1</div>
					      	<div class="col-lg-4">PSO2</div>
					      	<div class="col-lg-4">PSO3</div>
					      	
					      	</div>
					      </div>
					      
					    </div>
					    
    					
                   <br><br>
                   <% 
                   
                   int i;
               	try{
        			Class.forName("com.mysql.jdbc.Driver");
        			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
        			 int count=0;
        			 int courseid=Integer.parseInt((String)session.getAttribute("subject"));
                     Statement st=con.createStatement();
         			ResultSet rs=st.executeQuery("select * from co where course_id='"+courseid+"'");
         			while(rs.next())
         			{
         				count++;
         			}
              
                  //System.out.println("Hola count :"+count);
                   for(i=1;i<=count;i++)
                   {
                	   
                   %>
   
							    <div class="row" >
							      <div class="col-lg-2" id="a2">CO<%=i%></div>
							      <div class="col-lg-8">
							      <div class="row " >
							      <% 
							      int j;
							      for(j=1;j<=3;j++)
							      {
							    	  %>
							      
							      	<div class="col-lg-4" ><input type="text" name="<%=i%><%=j%>"  ></div>
							      	
							      	<% 
							      }
							      	%>
							      	
							      	</div>
							      </div>
							      
							    </div>
							    <br>
   					 <% 
                   }
             	}
               	catch(Exception e)
               	{
               		e.printStackTrace();
               	}
                  %> 
    
    <br>
    
	
    <div class="row">
      <div class="col-lg-4"></div>
      <div class="col-lg-5">
        <br>
             
      </div>
    </div>
   
       
       
       <div class="row">
		<div class="col-lg-2"></div>
		
		<div class="col-lg-3">
	<input type="submit" value="Submit">
	</div>
	<div class="col-lg-2"></div>
		
		<div class="col-lg-3">
	<input type="reset" value="Reset">
	</div>
</div>
</form>




            </div>
            
            
        </div>
         <%@include file="footer.jsp" %>
    </div>

<!-- <script type="text/javascript">
		function getConfirmation()
		{
			var value =confirm("Are you sure you want to update?");
			if(value==true)
			{
			return true;
			}
			else
				return false;
				//window.location.replace("co.jsp");
		}
		</script>
    -->
  
</body>
</html>
    