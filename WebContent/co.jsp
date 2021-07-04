<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>CO</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
    
     


button
{
    background-color:white;
    color:black;
    width:100%;
    height:3vh;
    margin-top:7px;
    text-align:center;
}
#c1,#c2,#c3,#c4,#c5,#c6{
  background-color:rgb(205, 252, 193);
  text-align:center;
  height:7vh;
  
  border-style:solid;
  border-width:1px;
  border-color:rgb(101, 206, 75);
  color:black;
  border-radius:12px;
  font-size:4vh;
}
#co1,#co2,#co3,#co4,#co5,#co6{
  background-color:rgb(205, 252, 193);
  text-align:center;
  height:7vh;
  border-radius:10px;
  border-style:solid;
  border-width:1px;
  border-color:rgb(101, 206, 75);
  color:black;
}
#c2,#co2,#c4,#co4,#c6,#co6{
  background-color:rgb(177, 216, 168);
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
					<br>
				  <%@include file="dashboardoriginal.jsp" %> 
                </div>
                <div class="col-lg-9">
                   <%
                   				 String subject0 = (String)session.getAttribute("subject");
                  				 String username = (String)session.getAttribute("username");
                   				String class2 = (String)session.getAttribute("class1");
                   				String designation = (String)session.getAttribute("designation");
                   				int subject1 = Integer.parseInt(subject0);
                   				
                   				
                   				
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                    String query = "Select * from co where course_id =" + subject1;
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    rs.next();
                   %>
                   <br>
                   <% 
                   int i;
                   for(i=1;i<=6;i++)
                   {
                	   
                   %>
                  <div class="row">
                    <div class="col-lg-2" id="c<%=i%>">CO<%=i%></div>
                    <div class="col-lg-1" id="extra"></div>
                    <div class="col-lg-8"id="co<%=i%>" > 
                      <table>                 
                        <tr>	
                                            <td><%= rs.getString("co_des")%></td>
                                            <%rs.next(); %>
                        </tr>
                      </table>
                    </div>
                  </div>

                  <br>
                  <% 
                   }
                  %>                
				<br>
                  
              <form  action="refer3">
	      
    <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
             
                <%
	
              if(session.getAttribute("designation").equals( "coordinator")||session.getAttribute("designation").equals( "hod"))
          	{
          		%>  
                <input type="submit" value="UPDATE"> 
                   <%
	}
    %>
            </div>
    </div>
</form>
                    </div>
                     <%                 
                                }
                                catch(Exception e)
                                {
                                  
                                }

                       %>
              </div>

        </div>
        <br><br><br>
        <%@include file="footer.jsp" %>
</div>



</body>
</html>