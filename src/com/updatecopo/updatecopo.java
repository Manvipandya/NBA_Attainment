package com.updatecopo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
@WebServlet("/updatecopo")
public class updatecopo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
		
		int i,j;
		String data;
		int data1=0;
		ResultSet rs;
		HttpSession session=request.getSession();
		int courseid=Integer.parseInt((String)session.getAttribute("subject"));
		int count=0;
		 Statement st=con.createStatement();
			ResultSet rs1=st.executeQuery("select * from co where course_id='"+courseid+"'");
			while(rs1.next())
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
					//PrintWriter out=response.getWriter();
					if(data!=null && !(data.isEmpty()) )
					{
						data1=Integer.parseInt(data);
				
						try {
						st.executeUpdate("update copo set mapping='"+data1+"' where co_no='"+i+"' and po_no = '"+j+"'and course_id='"+courseid+"'");
						}
						catch(SQLException e )
						{
							System.out.println("Catch ");
							//out.println("Error : Enter proper values");
							response.sendRedirect("updatecopo.jsp");
						}
					
					
					}
	
			}
		}
		JOptionPane.showMessageDialog(null, "Updated Succesfully");
		response.sendRedirect("copo.jsp");
		
	}
	catch(Exception e)
	{
		e.printStackTrace();		
	}

	
	}

	

}
