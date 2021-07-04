<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "java.sql.*"%>
<!DOCTYPE HTML> 
<html>
    <head>
<title>type</title>
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

button
{
    background-color:white;
    color:black;
    width:100%;
    height:3vh;
    margin-top:7px;
    text-align:center;
}
table {
  
  width: 100%;
  border-width:2px;
}

th, td {
  text-align:center;
  padding: 8px;
  color: black;
  font-family:bold;
  font-size:2vh;
}

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
<body>

    <div class="container-fluid">
    <%@include file="header.jsp" %>
    <div class="row" >
    	<div class="col-lg-2">
    		<%@include file="dashboardoriginal.jsp" %>
    	</div>
    	<div class="col-lg-9">
    	<br>
    	<form action="updatemaxmarksco" >
        <div class="row" id="a1">
        	
        <div class="col-lg-3">
            <h2>Question NO</h2>
        </div>
        <div class="col-lg-3">
            <h2>Sub-Question</h2>
            
        </div>
        <div class="col-lg-3">
            <h2>MAX-Marks</h2>
            
        </div>
        <div class="col-lg-3">
            <h2>COs</h2>
           
         </div>
        </div>
    
    <%
   
int ques_no = Integer.parseInt((String)session.getAttribute("ques_no"));
    String array = (String)session.getAttribute("myarray1");
    int []arr=new int[array.length()];
    try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");

   int course_id=Integer.parseInt((String)session.getAttribute("subject"));
   int class_id=Integer.parseInt((String)session.getAttribute("class1"));
  
   Statement  st=con.createStatement();
	ResultSet rs1=st.executeQuery("select year(CURDATE()) as year1");
	rs1.next();
	int acad_year=rs1.getInt("year1");
   
   int j;
   int test_id=Integer.parseInt((String)session.getAttribute("test_id"));
  st=con.createStatement();
   st.executeUpdate("delete from question where course_id='"+course_id+"'and class_id='"+class_id+"'and test_id='"+test_id+"'and acad_year='"+acad_year+"'");
   for(int i=0;i<array.length();i++)
   {
	   arr[i]=(int)(array.charAt(i));
	   arr[i] -= 48;
	    j=i+1;
	    System.out.println("arr[]"+arr[i]);
	   
	    st=con.createStatement();
	 	
	    st.executeUpdate("insert into question values('"+test_id+"','"+course_id+"','"+class_id+"','"+j+"','"+arr[i]+"','"+acad_year+"')");
   }
    }
    catch(Exception e)
    {
    	
    }
    
    	int i,j;
    	for(i=1;i<=ques_no;i++)
    	{
    %>
    	<br>
        <div class="row" >
         <div class="col-lg-3">
                <table>
                    <tr>
                        <td>
                           <h4> Question-<%=i %>)</h4>
                        </td>
                    </tr>
                </table>
             </div>
             <div class="col-lg-9">
             <% 	for( j=1;j<=arr[i-1];j++)
                   {
              %>
             <div class="row">
		              <div class="col-lg-4">
		                    <table>
		             			 <tr>
		                                <td><%=j %>)</td>
		                            </tr>
		                     </table>
		             </div>
		
		            <div class="col-lg-4">
		                    <table>   
		                            <tr>
		                                <td><input type="text" name="<%=i%><%=j%>"></td>
		                            </tr>
		                        </table>
		                                
		            </div>
		             <div class="col-lg-4">
		                    <table>
		                    <tr>
		                       <td><input type="text" name="c<%=i%><%=j%>"></td>
		                            </tr>
		                            </table>
					</div>   
            </div>
            <%} %>
            </div>
        </div>
        <%
    	}
    	%>
        
        <div class="row">
        	<div class="col-lg-3"></div>
        	<div class="col-lg-4">
        	<br>
        		<input type="submit" value="Update">
        		
        	</div>
        </div>
        </form>
        <br>
        </div>
        </div>
        
        <%@include file="footer.jsp" %>
        
        </div>
</body>
</html>




    

        