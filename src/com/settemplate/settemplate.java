package com.settemplate;

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

@WebServlet("/settemplate")
public class settemplate extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession session=request.getSession();
		String ques_no = request.getParameter("ques_no");
		String test_id = request.getParameter("test_id");
		int courseid =Integer.parseInt((String)session.getAttribute("subject"));
		int classid =Integer.parseInt((String)session.getAttribute("class1"));
		session.setAttribute("ques_no",ques_no);
		session.setAttribute("test_id",test_id);
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
		Statement st;
		ResultSet rs1;
		st=con.createStatement();
		rs1=st.executeQuery("select year(CURDATE()) as year1");
		rs1.next();
		int acad_year=rs1.getInt("year1");
		
		
		st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from test where test_id='"+test_id+"'and course_id='"+courseid+"'and class_id='"+classid+"'and acad_year='"+acad_year+"'");
		if(rs.next())
		{
			response.sendRedirect("updatetesttemplate2.jsp");
		}
		else
		{
			response.sendRedirect("settesttemplate2.jsp");
		}
		
		
		
		}
		catch(Exception e)
		{
			
		}
	}


}
