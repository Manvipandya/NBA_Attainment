<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

       <%@page import = "java.sql.*"%>
<!DOCTYPE html >
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
	width:100%;
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
 
  <%
  
  String class_id = (String)session.getAttribute("class1");
	 String username = (String)session.getAttribute("username");
	
	String testid = (String)session.getAttribute("test_id");
	String designation = (String)session.getAttribute("designation");
	int classid = Integer.parseInt(class_id);
	 int courseid = Integer.parseInt((String)session.getAttribute("subject"));
	int test_id = Integer.parseInt(testid);           				
                                try{
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                                    String query = "Select * from entermarks where course_id = '"+courseid+"'and test_id='"+test_id+"'and class_id='"+classid+"'";
                                    Statement stm1 = conn.createStatement();
                                    ResultSet rs1 = stm1.executeQuery(query);
                                    rs1.next();
                                   
                   %>
  <br>
   <%
  	int i;
  int num=10;
 

	

  int ques_no=0,data=0;
  Statement stm = conn.createStatement();
  ResultSet rs ;
		rs=stm.executeQuery("select * from question where test_id='"+test_id+"'and course_id='"+courseid+"'and class_id='"+classid+"'");
		while(rs.next())
		{
			ques_no++;
		}
		System.out.println("ques-no :"+ques_no);
		int space = 10/(ques_no);
		
		%>
			<div class="row" id="a1">
				<div class="col-lg-2"><h3>ROLL_NO</h3></div>
				<%
					for(i=1;i<=ques_no;i++){
				%>
				<div class="col-lg-<%=space %>" style="text-align:center;"><h2>Question-<%=i %></h2></div>
				<%} %>
			</div>
			<br>
  <%
  int k,count,j,data1;
  for(i=1;i<=num;i++)
  {
	  %>
	  	<div class="row" id="one">
	  	 	<div class="col-lg-2" id="a2">3<%=classid%><%=i%></div>
	  	 	<%
	  	 		
	  	 		for(j=1;j<=ques_no;j++)
	  	 		{
	  	 			rs=stm.executeQuery("select * from question where test_id='"+test_id+"'and course_id='"+courseid+"'and class_id='"+classid+"'and ques_no='"+j+"'");
	  	 			rs.next();
	  	 			%>
	  	 			<div class="col-lg-<%=space%>">
	  	 			<div class="row">
	  	 			<%

  	 				count=rs.getInt("sub_ques_no");
  	 			System.out.println("sub-ques:"+count);
  	 			int space2 = 12/(count);
	  	 				for(k=1;k<=count;k++)
	  	 				{
	  	 					if(rs1.getInt("marks") != -1)
					    	  {
	  	 						
					    	  %>
	  	 				
	  	 					
	  	 					<div class="col-lg-<%=space2%>" ><input type="text" name="<%=i%><%=j%><%=k%>" placeholder=<%=rs1.getInt("marks")%>  ></div>
	  	 					<%}else { %>
	  	 						<div class="col-lg-<%=space2%>" ><input type="text" name="<%=i%><%=j%><%=k%>" placeholder ="-"  >  </div>
	  	 						<%} %>
	  	 					<%rs1.next(); %>
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
</div>

   
</body>
</html>
    