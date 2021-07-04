package com.attainment;

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
 * Servlet implementation class attainment
 */
@WebServlet("/attainment")
public class attainment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
			
			HttpSession session=request.getSession();
			int classid=Integer.parseInt((String)session.getAttribute("class1"));
			int courseid=Integer.parseInt((String)session.getAttribute("subject"));
			int test_id=Integer.parseInt((String)session.getAttribute("test_id"));
			
			Statement st=con.createStatement();
			ResultSet rs,rs1;
			
			rs1=st.executeQuery("select year(CURDATE()) as year1");
			rs1.next();
			int acad_year=rs1.getInt("year1");
			
		
			float l1a,l2a,l3a;
			float attainment=0;
			int count=0;
			float attainment1=0;
			
		
		
			st=con.createStatement();
			rs=st.executeQuery("select * from levels where course_id='"+courseid+"'and class_id='"+classid+"'and test_id='"+test_id+"'and acad_year='"+acad_year+"'and mykey=2");
			while(rs.next())
			{
				count++;

				l1a=rs.getFloat("level1");
				if(l1a>1)
				{
					l1a=1;
				}
				l2a=rs.getFloat("level2");
				if(l2a>2)
				{
					l2a=2;
				}
				l3a=rs.getFloat("level3");
				if(l2a>3)
				{
					l3a=3;
				}
				
				attainment+=(l1a+l2a+l3a)/6;
				
				
			}
			attainment=attainment/count;
			double final_attainment=(0.3*attainment)+(0.7*attainment1);
			st=con.createStatement();
			st.executeUpdate("insert into attainment values('"+courseid+"','"+classid+"','"+test_id+"','"+final_attainment+"','"+acad_year+"')");
			
			System.out.println("Final :"+final_attainment);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();		
		}

		
	}

}
