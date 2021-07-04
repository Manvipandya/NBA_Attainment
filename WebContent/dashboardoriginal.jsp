<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
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


</style>

</head>
<body>
	 <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    
                     <%
                    String subject2 = (String)session.getAttribute("subject");
                    int subject3 = Integer.parseInt(subject2);
                    try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                        String query = " Select * from co where course_id = '"+subject3+"'";
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery(query);
                        
                       
                        
                    %><a href="co.jsp">COs</a>
                    
                    
                    <%   }
                    catch(Exception e)
                    {
                      
                    }

           %>
                    <a href="pos.jsp">POs</a>
                    
                    <%
                   
                    try{
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
                        String query = " Select * from copo where course_id = '"+subject3+"'";
                        Statement stm = conn.createStatement();
                        ResultSet rs = stm.executeQuery(query);
                        
                        Statement st=conn.createStatement();
            			ResultSet rs1=st.executeQuery("select year(CURDATE()) as year1");
            			rs1.next();
            			int acad_year=rs1.getInt("year1");
                        
                        String query0 = " Select * from co where course_id = '"+subject3+"'";
                        Statement stm0 = conn.createStatement();
                        ResultSet rs0 = stm0.executeQuery(query0);
                if(rs0.next())
                {
                        
			                        if(!rs.next())
			                        {
				
			              if(session.getAttribute("designation").equals( "coordinator")||session.getAttribute("designation").equals( "hod"))
			          	{
			          		%> 
			                    <a href="setcopo.jsp">Set CO-PO</a>
			                 <%} 
			                 
			               }
			               else
			               {  %>
			                    <a href="copo.jsp">Show CO-PO </a>
			                    
			              <%  }%>
              <%} %>
            <%--   <%
               query = " Select * from copso where course_id = '"+subject3+"'";
               stm = conn.createStatement();
               rs = stm.executeQuery(query);
              rs1=st.executeQuery("select year(CURDATE()) as year1");
  			rs1.next();
  			 acad_year=rs1.getInt("year1");
              String queryy = " Select * from co where course_id = '"+subject3+"'";
              Statement stmy = conn.createStatement();
              ResultSet rsy = stm0.executeQuery(queryy);
      if(rsy.next())
      {
              
	                        if(!rs.next())
	                        {
		
	              if(session.getAttribute("designation").equals( "coordinator")||session.getAttribute("designation").equals( "hod"))
	          	{
	          		%> 
	                    <a href="setcopso.jsp">Set CO-PSO</a>
	                 <%} 
	                 
	               }
	               else
	               {  %>
	                    <a href="copso.jsp">Show CO-PSO </a>
	                    
	              <%  }%>
    <%} %> --%>
    <% 
              
              String query2 = " Select * from record where course_id = '"+subject3+"'and acad_year='"+acad_year+"'";
              Statement stm1 = conn.createStatement();
               rs1 = stm1.executeQuery(query2);
              if(!rs1.next())
              {
              %>
                  <a href="settarget.jsp">Set target</a>
                <%  }%>     
                        
                    <a href ="settesttemplate.jsp">Set Test</a>
            
                  <a  href="selecttest.jsp">Set/Show Marks</a>

                 
                <%     
                    
                      if(session.getAttribute("designation").equals( "teacher"))
          	{
          		%>
                    <a href="reportteacher.jsp">Generate report</a>
                    <%}else { %>
                     <a href="report1.jsp">Generate report</a>
                     <%} %>
             </div>
             
              <span style="font-size:30px;cursor:pointer;font-size:25px;" onclick="openNav()" >&#9776;<b>DASHBOARD</b></span>
               <%   }
                                catch(Exception e)
                                {
                                  
                                }

                       %>
              
               <script>
                function openNav() {
                  document.getElementById("mySidenav").style.width = "250px";
                }
                
                function closeNav() {
                  document.getElementById("mySidenav").style.width = "0";
                }

              


                </script>
</body>
</html>