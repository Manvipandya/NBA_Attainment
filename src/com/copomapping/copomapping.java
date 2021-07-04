package com.copomapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
@WebServlet("/copomapping")
public class copomapping extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int i,j;
		String data;
		int data1=0;
		ResultSet rs;
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		 String subject2 = (String)session.getAttribute("subject");
         int courseid = Integer.parseInt(subject2);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
		
			
			Statement st;
			PreparedStatement st0;
			st=con.createStatement();
			int count=0;
			rs=st.executeQuery("select * from co where course_id='"+courseid+"'");
			while(rs.next())
			{
				count++;
			}
			for(i=1;i<=count;i++)
			{
				for(j=1;j<=12;j++)
				{		
					
						
					 st=con.createStatement();
						String concat=Integer.toString(i)+Integer.toString(j);
						data=request.getParameter(concat);
						
						if(data!=null && !(data.isEmpty()) )
						{
							data1=Integer.parseInt(data);
							st=con.createStatement();
								try {
								st.executeUpdate("insert into copo values('"+courseid+"','"+i+"','"+j+"','"+data1+"')");
								
								}
								catch(SQLException e )
								{
									
									System.out.println("Catch ");
									out.println("Error : Enter proper values");
									st=con.createStatement();
									st.executeUpdate("delete from copo where course_id='"+courseid+"'");
									//response.sendRedirect("setcopo.jsp");
								}
							
						}
						else 
						{
							data1 =-1;
							st=con.createStatement();
							rs=st.executeQuery("select * from copo");
							if(rs.next())
							{
							st.executeUpdate("insert into copo values('"+courseid+"','"+i+"','"+j+"','"+data1+"')");
							}
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

