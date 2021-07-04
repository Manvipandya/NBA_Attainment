<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>set target</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
 
     body{
         height:100%;
         margin: 0;
         background-color:rgb(250, 253, 236);
     }
    

footer{
	position:absolute;
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
    width:37vh;
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
            <form action="updatetar">
                <br><br>
                        <center><h3>TARGET</h3></center><br>
                        <div class="row" >
                            <div class="col-lg-4" id="tar"><h4>Target</h4></div>
                            <div class="col-lg-4" id="tar"><h4>UT</h4></div>
                            
                            <div class="col-lg-4"  id="tar"><h4>SPPU</h4></div>
                        </div>
                        <br>
                         <%
                     	try{
                     		//System.out.print("try");
                    		Class.forName("com.mysql.jdbc.Driver");
                    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");   
                        int subject = Integer.parseInt((String)session.getAttribute("subject"));
          				//int username = Integer.parseInt((String)session.getAttribute("username"));
           				//int class1 = Integer.parseInt((String)session.getAttribute("class1"));
           				//String designation = (String)session.getAttribute("designation");
                       // System.out.print("subject :" +subject);
           				Statement st=con.createStatement();
           				//st=con.createStatement();
           				ResultSet rs,rs2,rs1;
           				/* //st=con.createStatement();
           				//System.out.print("try2");
        				rs2 = st.executeQuery("Select year(CURDATE()) as year1");
        				rs2.next();
        				int acad_year = rs2.getInt("year1");
        				//System.out.print("acad_year" +acad_year);
           				
           				float avg1l1=0,avg1l2=0,avg1l3=0,avg2l1=0,avg2l2=0,avg2l3=0;
           				for(int i=0;i<3;i++)
           				{
           					acad_year -= 1;
           					String query = "Select * from record where course_id = '"+subject+"' and acad_year = '"+acad_year+"' and test_id = 1";
               				st=con.createStatement();
               				rs = st.executeQuery(query);
               				rs.next();
               				avg1l1 += rs.getFloat("level1");
               				avg1l2 += rs.getFloat("level2");
               				avg1l3 += rs.getFloat("level3");
           				}
           				avg1l1 = avg1l1/3;
           				avg1l2 = avg1l2/3;
           				avg1l3 = avg1l3/3;
           				st=con.createStatement();
        				rs2 = st.executeQuery("Select year(CURDATE()) as year1");
        				rs2.next();
        				 acad_year = rs2.getInt("year1");
        				 System.out.print("acad_year" +acad_year);
           				for(int i=0;i<3;i++)
           				{
           					acad_year -= 1;
           					String query1 = "Select * from record where course_id = '"+subject+"'  and acad_year = '"+acad_year+"' and test_id = 2";
    						st=con.createStatement();
               				rs1 = st.executeQuery(query1);
               				rs1.next();
               				avg2l1 += rs1.getFloat("level1");
               				avg2l2 += rs1.getFloat("level2");
               				avg2l3 += rs1.getFloat("level3");
           				}
           				avg2l1 = avg2l1/3;
           				avg2l2 = avg2l2/3;
           				avg2l3 = avg2l3/3;
           				
           				
           				st=con.createStatement();
        				rs2 = st.executeQuery("Select year(CURDATE()) as year1");
        				rs2.next();
        				 acad_year = rs2.getInt("year1");
        				 
           				st=con.createStatement();
        				st.executeUpdate("insert into target values ('"+subject+"',1,'"+avg1l1+"','"+avg1l2+"','"+avg1l3+"','"+acad_year+"' )");
                          
        				st=con.createStatement();
        				st.executeUpdate("insert into target values ('"+subject+"',2,'"+avg2l1+"','"+avg2l2+"','"+avg2l3+"','"+acad_year+"' )");
                         */
        				
        				rs2 = st.executeQuery("Select year(CURDATE()) as year1");
        				rs2.next();
        				int acad_year = rs2.getInt("year1");
        				 st=con.createStatement();
         				rs = st.executeQuery("Select * from target where test_id = 1 and course_id='"+subject+"' and acad_year = '"+acad_year+"'");
         				rs.next();
         				st=con.createStatement();
         				rs1 = st.executeQuery("Select * from target where test_id = 2 and course_id='"+subject+"' and acad_year = '"+acad_year+"'");
         				rs1.next();
                   %>
                        <div class="row">
                            <div class="col-lg-4" id="tar"><h4>Level1</h4></div>
                            <div class="col-lg-4"><input type="text" name ="11"placeholder = <%=rs.getFloat("level1") %>></div>
                         
                            <div class="col-lg-4"><input type="text" name ="12"placeholder = <%=rs1.getFloat("level1") %>  ></div>
                          
                           
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-4" id="tar"><h4>Level2</h4></div>
                            <div class="col-lg-4"><input type="text" name ="21" placeholder = <%=rs.getFloat("level2") %>></div>
                         
                            <div class="col-lg-4"><input type="text" name ="22" placeholder = <%=rs1.getFloat("level2") %> ></div>
                       
                            
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-4" id="tar"><h4>Level3</h4></div>
                            <div class="col-lg-4"><input type="text" name ="31" placeholder = <%=rs.getFloat("level3") %>></div>
                         
                            <div class="col-lg-4"><input type="text" name ="32" placeholder = <%=rs1.getFloat("level3") %>></div>
                       
                        </div>
                 
     
     
	   <br><br>   
    <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-3">
            
                <input type="submit" value="Update">
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

	<%
                     	}
                         catch(Exception e)
                         {
                        	 
                         }
	%>
</body>
</html>