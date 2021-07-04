package com.settar;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/settar")
public class settar extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
			
			int i,j;
			String data;
			int data1=0;
			Statement st=con.createStatement();
			ResultSet rs1=st.executeQuery("select year(CURDATE()) as year1");
			rs1.next();
			int acad_year=rs1.getInt("year1");
			
			int courseid=314477;
			for(i=1;i<=3;i++)
			{
				for(j=1;j<=2;j++)
				{		
					
						 st=con.createStatement();
						String concat=Integer.toString(i)+Integer.toString(j);
						data=request.getParameter(concat);
						
						if(data!=null && !(data.isEmpty()) )
						{
							data1=Integer.parseInt(data);
							System.out.println("Data : "+data1);
							st.executeUpdate("insert into target values('"+courseid+"','"+j+"','"+i+"','"+data1+"','"+acad_year+"')");
							
						}
		
						
						
					
				}
			}
			response.sendRedirect("dashboard.jsp");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();		
		}
	
		
	}

	

}
