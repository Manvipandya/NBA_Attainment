<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>update CO-PO</title>
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
     #nv
     {
         height:5vh;
     }
     .header{
         height:5vh;
         width: 100%;
        background-color: rgb(242, 253, 193);
        color: white;
        font-family: zebrazil;
        
        
     }
     .header2{
         height:5vh;
         width: 100%;
        background-color: rgb(235, 247, 171);
        color: white;
     }
     footer{
         height:12vh;
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: rgb(221, 216, 216);
        color: white;
        text-align: center;
     }
     #bdy
     {
         height:72vh;
     }
     #navbar {
 
 
  height:5vh;
        
         width: 100%;
  background-color: rgb(250, 253, 236);
  overflow: hidden;
  font-family: zebrazil;
  font-size:25px;
}
#nv a {
  float: left;
  display: block;
  color: #252323;
  text-align: center;
 padding :0px;
 margin:0px;
  text-decoration: none;
  font-size: 30px;
  width:100%;
}

#nv a:hover {
  background-color: rgb(36, 236, 18);
  color: black;
}

#nv a.active {
  background-color: rgb(75, 216, 79);
  color: rgb(29, 20, 20);
}

#navbar a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

#navbar a:hover {
  background-color: #000;
  color: black;
}

#navbar a.active {
  background-color: rgb(75, 216, 79);
  color: white;
}



input
{
	width:8vh;
	 padding: 0px,0px,0px,0px;
	 border:none;
	 
}
img{
    height:10vh;
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

.sidenav {
  height: 70%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
  margin-top :15vh;
  
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
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
            
            
            <form onsubmit="return getConfirmation()" action="updatecopo">

 <br><br>
  <div class="row" >
  
      <div class="col-lg-1" id="a1">COs</div>
      <div class="col-lg-10" id="a1">
      <div class="row">
      	<div class="col-lg-4">PSO1</div>
      	<div class="col-lg-4">PSO2</div>
      	<div class="col-lg-4">PSO3</div>
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
                                    String query = "Select * from copso where course_id = '"+subject1+"'";
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(query);
                                    rs.next();
                                    
                                    int count=0;
                                    Statement st=conn.createStatement();
                        			ResultSet rs1=st.executeQuery("select * from co where course_id='"+subject+"'");
                        			while(rs1.next())
                        			{
                        				count++;
                        			}
                   %>
    <br>
    <%
    	int i;
    for(i=1;i<=count;i++)
    {
    %>
    <div class="row" >
      <div class="col-lg-1" id="a2">CO<%=i %></div>
      <div class="col-lg-10">
      <div class="row " >
      <%
      	int j;
      for(j=1;j<=3;j++)
      {
      if(rs.getInt("mapping") != -1)
							    	  {
							    	  %>
      	<div class="col-lg-4" ><input type="text" name="<%=i %><%=j%>"  placeholder=<%=rs.getInt("mapping")%>></div>
      		<% }
							    	  else
							    	  {%>
							    		  <div class="col-lg-4" ><input type="text" name="<%=i%><%=j%>"  placeholder="-" ></div>
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
    
  
    
   
   

	<br><br>
	<div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-2"><input type="submit" value="Update"></div>
        <div class="col-lg-3"></div>
        <div class="col-lg-2"><input type="reset"></div>
    </div>
    
        <%                 
                                }
                                catch(Exception e)
                                {
                                  
                                }

                       %>
</form>
            </div>
            
            
        </div>
<%@include file="footer.jsp" %>
    </div>
    <script type="text/javascript">
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
</body>
</html>
    