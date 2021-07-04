</html><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
          <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>update target</title>
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
    background-color:rgb(205, 252, 193);
    text-align:center;
    border-style:solid;
}

input{
    border-style:solid;
    height:6vh;
    width:35vh;
     text-align:center;
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

input[type=reset]:hover {
  background-color:red;
}

footer{
	position:absolute;
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
            <form action="updatemarks">
                <br><br>
                        <center><h3>TARGET</h3></center><br>
                        <div class="row" >
                            <div class="col-lg-4" id="tar"><h4>Target</h4></div>
                            <div class="col-lg-4" id="tar"><h4>UT</h4></div>
                            <div class="col-lg-4" id="tar"><h4>SPPU</h4></div>
                           
                        </div>
                        <br>
                        <%
                        
                        String subject = (String)session.getAttribute("subject");
         				 String username = (String)session.getAttribute("username");
          				String class1 = (String)session.getAttribute("class1");
          				String designation = (String)session.getAttribute("designation");
                                     try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                    String query = "Select * from target";
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    rs.next();
                   %>
                        <div class="row">
                            <div class="col-lg-4" id="tar"><h4>Level1</h4></div>
                            <div class="col-lg-4"><input type="text" name ="11" placeholder=<%=rs.getInt("target")%>></div>
                            <%rs.next(); %>
                            <div class="col-lg-4"><input type="text" name ="12" placeholder=<%=rs.getInt("target")%>></div>
                           <%rs.next(); %>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-4" id="tar"><h4>Level2</h4></div>
                            <div class="col-lg-4"><input type="text" name ="21" placeholder=<%=rs.getInt("target")%>></div>
                            <%rs.next(); %>
                            <div class="col-lg-4"><input type="text" name ="22" placeholder=<%=rs.getInt("target")%>></div>
                            <%rs.next(); %>
                            
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-4" id="tar"><h4>Level3</h4></div>
                            <div class="col-lg-4"><input type="text" name ="31" placeholder=<%=rs.getInt("target")%>></div>
                            <%rs.next(); %>
                            <div class="col-lg-4"><input type="text" name ="32" placeholder=<%=rs.getInt("target")%>></div>
                           
                        </div>
                        
                     
                  <%                 
                                }
                                catch(Exception e)
                                {
                                  
                                }

                       %>
   
             
       <br><br>
                  <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-3"><input type="submit" value="UPDATE"></div>
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3"><input type="reset"></div>
                </div>

</form>
            </div>
            

        </div>

        
<%@include file="footer.jsp" %>
</div>


</body>

