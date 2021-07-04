package com.selecttest;

import java.io.IOException;
import java.io.PrintStream;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;


/**
 * Servlet implementation class selecttest
 */
@WebServlet("/selecttest")
public class selecttest extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String test_id = request.getParameter("test_id");
		
		HttpSession session=request.getSession();
		session.setAttribute("test_id",test_id);
		
      		
      	  String subject2 = (String)session.getAttribute("subject");
          int subject3 = Integer.parseInt(subject2);
          String class_id = (String)session.getAttribute("class1");
          int classid = Integer.parseInt(class_id);
          try{
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
              Statement st=conn.createStatement();
  			ResultSet rs1=st.executeQuery("select year(CURDATE()) as year1");
  			rs1.next();
  			int acad_year=rs1.getInt("year1");
              
              String query3 = " Select * from test where course_id = '"+subject3+"'and test_id='"+test_id+"'and class_id='"+classid+"'and acad_year='"+acad_year+"'";
              Statement stm2 = conn.createStatement();
              ResultSet rs2 = stm2.executeQuery(query3);
              if(rs2.next())
              {
			              String query = " Select * from entermarks where course_id = '"+subject3+"'and test_id='"+test_id+"'and class_id='"+classid+"'and acad_year='"+acad_year+"'";
			              Statement stm = conn.createStatement();
			              ResultSet rs = stm.executeQuery(query);
			              if(!rs.next())
			              {
			            	  response.sendRedirect("setmarks.jsp");
			             }
			              else
			              {
			            	  response.sendRedirect("showmarks.jsp");
			              }
              }
              else
              {
            	 
            	  response.sendRedirect("settesttemplate.jsp");
              }
              
          }
          catch(Exception e)
          {
        	  
          }
          
	}

}
