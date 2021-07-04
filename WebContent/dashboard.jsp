<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import = "java.sql.*"%>
  <%@page import= "javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>dashboard page</title>
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
     footer{
     	position:fixed;
     }

</style>
 <script type="text/javascript">
	function disableBackButton()
	{
		window.history.forward();
	}
	history.pushState(null,null,location.href);
	window.onpopstate = function(){
		history.go(1);
	}
	
</script>
</head>
<body> 
<!--  onload= "disableBackButton();">-->
    <div class="container-fluid">
        <%@include file="header.jsp" %>
       <%    //  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	//response.setHeader("Pragma","no-cache");
	//response.setDateHeader("Expires",0);%>
	

           
             <div class="row" id="bdy">
                    <br><br>
                    <div class="col-lg-2" >
        
                            <br><br>
        
                                  <%@include file="dashboardoriginal.jsp" %>
                      
                    </div>
            </div>

       
        <%@include file="footer.jsp" %>
</div>


</body>
</html>