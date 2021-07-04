package com.login2;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.mysql.jdbc.Connection;
import java.sql.*;

@WebServlet("/login2")
public class login2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String designation = request.getParameter("designation");
		String class1 = request.getParameter("class");
		String subject1 = request.getParameter("subject");
		
		
		try{
     		//System.out.print("try");
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");   
    		int subject = Integer.parseInt(subject1);
			Statement st=con.createStatement();
			
			ResultSet rs,rs2,rs1;
			
		rs2 = st.executeQuery("Select year(CURDATE()) as year1");
		rs2.next();
		int acad_year = rs2.getInt("year1");
		//System.out.print("acad_year" +acad_year);
			
		int unit,ten,three=3;
		unit=subject%10;
		ten=subject/10;
		
		int concat=Integer.parseInt(Integer.toString(ten)+Integer.toString(three)+Integer.toString(unit));
		st=con.createStatement();
	
		
		
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
        
		}
		catch(Exception e)
		{
			
		}
		HttpSession session=request.getSession();
		session.setAttribute("designation",designation);
		session.setAttribute("class1",class1);
		session.setAttribute("subject",subject1);
		
		response.sendRedirect("dashboard.jsp");
		
	}

	
}
