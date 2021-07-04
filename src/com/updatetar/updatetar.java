package com.updatetar;

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


@WebServlet("/updatetar")
public class updatetar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
			
			int i,j;
			String data;
			int data1=0;
			
			HttpSession session=request.getSession();
			 int subject = Integer.parseInt((String)session.getAttribute("subject"));
			 Statement st=con.createStatement();
				//st=con.createStatement();
				ResultSet rs,rs2,rs1;
			 st=con.createStatement();
				rs2 = st.executeQuery("Select year(CURDATE()) as year1");
				rs2.next();
				int  acad_year = rs2.getInt("year1");
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
							
							if(i ==1){
								st=con.createStatement();
								st.executeUpdate("update target set level1='"+data1+"' where  test_id = '"+j+"'and course_id='"+subject+"' and acad_year = '"+acad_year+"'");
							}else if( i==2){st=con.createStatement();
								st.executeUpdate("update target set level2='"+data1+"' where test_id = '"+j+"'and course_id='"+subject+"' and acad_year = '"+acad_year+"'");
							}else if(i == 3){st=con.createStatement();
							st.executeUpdate("update target set level3='"+data1+"' where test_id = '"+j+"'and course_id='"+subject+"' and acad_year = '"+acad_year+"'");
							}	
						}
		
						
						
					
				} 
			}
			response.sendRedirect("settarget.jsp");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();		
		}
	
		
	}

	
}
