package com.settemplate;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.settemplate.maxmarks.setmarksco;

@WebServlet("/settemplate2")
public class settemplate2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try{
			
			int i,j;
			String data;
			String mydata="";
			HttpSession session=request.getSession();
			int ques_no = Integer.parseInt((String)session.getAttribute("ques_no"));
			//int []arr=new int[ques_no];
			for(i=1;i<=ques_no;i++)
			{
				
						String concat=Integer.toString(i);
						data=request.getParameter(concat);
						//arr[i-1]=data; 
						mydata=mydata+data;
						
				
			}
			
			session.setAttribute("myarray", mydata);
			response.sendRedirect("setmaxmarks-co.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();		
		}
		
	}

	
}
