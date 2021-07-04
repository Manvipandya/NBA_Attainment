package com.updatetesttemplate;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class updatetesttemplate2
 */
@WebServlet("/updatetesttemplate2")
public class updatetesttemplate2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
try{
			
			int i,j;
			String data;
			String mydata="";
			HttpSession session=request.getSession();
			int ques_no = Integer.parseInt((String)session.getAttribute("ques_no"));
			
			for(i=1;i<=ques_no;i++)
			{
				
						String concat=Integer.toString(i);
						data=request.getParameter(concat);
					
						mydata=mydata+data;
						
				
			}
			
			session.setAttribute("myarray1", mydata);
			response.sendRedirect("updatemaxmarks-co.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();		
		}
		
		
		
		
	}

	}
