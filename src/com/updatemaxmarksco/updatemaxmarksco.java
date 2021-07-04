package com.updatemaxmarksco;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class updatemaxmarksco
 */
@WebServlet("/updatemaxmarksco")
public class updatemaxmarksco extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		 HttpSession session=request.getSession();
			int ques_no = Integer.parseInt((String)session.getAttribute("ques_no"));
			int courseid = Integer.parseInt((String)session.getAttribute("subject"));
			int test_id = Integer.parseInt((String)session.getAttribute("test_id"));
			int class_id = Integer.parseInt((String)session.getAttribute("class1"));
			String username = (String)session.getAttribute("username");
			    
			    String array = (String)session.getAttribute("myarray1");
			 
			    int data,data1;
			   int []arr=new int[array.length()];
			   for(int i=0;i<array.length();i++)
			   {
				   arr[i]=(int)(array.charAt(i));
				   arr[i] -= 48;
			   }
			   int i,j;
			   try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
					
					Statement st=con.createStatement();
					ResultSet rs1=st.executeQuery("select year(CURDATE()) as year1");
					rs1.next();
					int acad_year=rs1.getInt("year1");
					
					
					Statement st2=con.createStatement();
					st2.executeUpdate("delete from entermarks where course_id='"+courseid+"'and class_id='"+class_id+"'and test_id='"+test_id+"'and acad_year='"+acad_year+"'");
					st=con.createStatement();
					st.executeUpdate("delete from test where course_id='"+courseid+"'and class_id='"+class_id+"'and test_id='"+test_id+"'and acad_year='"+acad_year+"'");
			   
					
					for(i=1;i<=ques_no;i++)
				   {
					   for(j=1;j<=arr[i-1];j++)
					   {
						   st=con.createStatement();
							String concat=Integer.toString(i)+Integer.toString(j);
							data1=Integer.parseInt(request.getParameter(concat));
							String concat2="c"+Integer.toString(i)+Integer.toString(j);
							data=Integer.parseInt(request.getParameter(concat2));
							 st.executeUpdate("insert into test values('"+test_id+"','"+courseid+"','"+class_id+"','"+i+"','"+j+"','"+data+"','"+data1+"','"+username+"','"+acad_year+"')");
					   }
				   }
			   
			   response.sendRedirect("dashboard.jsp");
			   }
			   catch(Exception e)
			   {
				   
			   }
	}

	

}
