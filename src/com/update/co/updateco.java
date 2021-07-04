


package com.update.co;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateco")
public class updateco extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		int i;
		String data;
		
		
		int courseid=314477;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
			
			
			for(i=1;i<=6;i++)
			{	
						
						Statement st=con.createStatement();
						String concat=Integer.toString(i);
						data=request.getParameter(concat);
						
						if(data!=null && !(data.isEmpty()) )
						{
							System.out.println("Data : "+data);
							st.executeUpdate("update co set co_des='"+data+"' where co_no='"+i+"' and course_id='"+courseid+"'");
							
						}
		
						
						
				
					
				}
			
			response.sendRedirect("co.jsp");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();		
		}
	
		
}

	

}
