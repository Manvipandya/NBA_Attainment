package com.entermarks;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

import java.lang.Math;


@WebServlet("/Entermarks")
public class Entermarks extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	@SuppressWarnings("resource")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ques,subques,i,j,k,test_id,cono=0,data1=0;
	
		String data;
		int num=10;
		int minusone=-1;
		int level1=0,level2=0,level3=0;
		int maxmarks;
		
		float tl1,tl2,tl3,l1a,l2a,l3a;
		
		 int one=1;
		 int two=2;
		 int three=3;
	
		 ResultSet rs1,rs2;
		 int temp=0;
		 float pl1,pl2,pl3;
		
		HttpSession session=request.getSession();
		int classid=Integer.parseInt((String)session.getAttribute("class1"));
		int courseid=Integer.parseInt((String)session.getAttribute("subject"));
		test_id=Integer.parseInt((String)session.getAttribute("test_id"));
		int ques_no = 0;
		ResultSet rs;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
			Statement st;
			PreparedStatement st0;
			st=con.createStatement();
		
			CallableStatement csmt=con.prepareCall("{call calc_date()}");
			
			rs1=csmt.executeQuery();
			rs1.next();
			int acad_year=rs1.getInt("year1");
			st=con.createStatement();
			rs=st.executeQuery("select * from question where test_id='"+test_id+"'and course_id='"+courseid+"'and class_id='"+classid+"'and acad_year='"+acad_year+"'");
			
			
			while(rs.next())
			{
				ques_no++;
			}
			
			st=con.createStatement();
			rs=st.executeQuery("select * from test where course_id='"+courseid+"' and test_id = '"+test_id+"'and class_id='"+classid+"'and acad_year='"+acad_year+"'");
			while(rs.next())
			{
			cono=rs.getInt("co_no");
			maxmarks=rs.getInt("maxmarks");
			
			st=con.createStatement();
			rs1=st.executeQuery("select * from comarks where course_id='"+courseid+"' and test_id = '"+test_id+"'and class_id='"+classid+"'and co_no='"+cono+"'and acad_year='"+acad_year+"'");
			if(rs1.next())
			{
				st=con.createStatement();
				temp=maxmarks+rs.getInt("maxmarks");
				st.executeUpdate("update comarks set maxmarks='"+temp+"'where co_no='"+cono+"' and test_id = '"+test_id+"'and course_id='"+courseid+"'and class_id='"+classid+"'and acad_year='"+acad_year+"'");
			}
			else
			{
				st=con.createStatement();
				st.executeUpdate("insert into comarks values('"+courseid+"','"+classid+"','"+test_id+"','"+cono+"','"+maxmarks+"','"+acad_year+"')");
			}
			}
			
			
			int count,absent_students=0;
			for(i=1;i<=num;i++)
			{
				
				for(j=1;j<=ques_no;j++) 
				{		
					st=con.createStatement();
					rs=st.executeQuery("select * from question where test_id='"+test_id+"'and course_id='"+courseid+"'and class_id='"+classid+"'and ques_no='"+j+"'and acad_year='"+acad_year+"'");
	  	 			rs.next();
	  	 			count=rs.getInt("sub_ques_no");
	  	 			
					for(k=1;k<=count;k++)
					{
						
						//Statement st00 = con.createStatement();
						//ResultSet rs00 = st00.executeQuery("select maxmarks from test where course_id='"+courseid+"'and class_id='"+classid+"'and test_id='"+test_id+"'and acad_year='"+acad_year+"'and ques_no='"+j+"'and sub_ques_no='"+k+"'");
						//rs00.next();
						//int mymarks=rs00.getInt("maxmarks");
					//	call maxmarks_proc(mymarks);
						String concat=Integer.toString(i)+Integer.toString(j)+Integer.toString(k);
						data=request.getParameter(concat);
						
						if(data!=null && !(data.isEmpty()))
						{
							data1=Integer.parseInt(data);
						//	System.out.println("Entermarks");
							st=con.createStatement();
							st.executeUpdate("insert into entermarks values('"+courseid+"','"+test_id+"','"+classid+"','"+i+"','"+j+"','"+k+"','"+data1+"','"+acad_year+"')");
	
						}
						else
						{
							
							st=con.createStatement();
							st.executeUpdate("insert into entermarks values('"+courseid+"','"+test_id+"','"+classid+"','"+i+"','"+j+"','"+k+"','"+minusone+"','"+acad_year+"')");
						}
						
					
						
					}
					
				}
			}
			
			st=con.createStatement();
			rs=st.executeQuery("select * from entermarks where course_id='"+courseid+"'and class_id='"+classid+"'and test_id='"+test_id+"'and ques_no='"+one+"'and sub_ques_no='"+one+"'and marks='"+minusone+"'and acad_year='"+acad_year+"'");
			while(rs.next())
			{
				absent_students++;
			}
			//System.out.println("Absent Students e:"+absent_students);
			int present_students=num-absent_students;
			
			
			st=con.createStatement();
			 rs= st.executeQuery("select * from target where course_id='"+courseid+"'and test_id='"+test_id+"'and acad_year='"+acad_year+"'");
			 rs.next();
			 tl1=rs.getFloat("level1");
			 tl2=rs.getFloat("level2");
			 tl3=rs.getFloat("level3");
			 
			float sum=0;
			st=con.createStatement();
			rs=st.executeQuery("select * from comarks where course_id='"+courseid+"'and class_id='"+classid+"'and test_id='"+test_id+"'and acad_year='"+acad_year+"'");
			while(rs.next())//Distinct co loop
			{
				
				cono=rs.getInt("co_no");
				maxmarks=rs.getInt("maxmarks");
				
				level1=0;level2=0;level3=0;
				for(i=1;i<=num;i++)//Student
				{
					System.out.println("Inside for");
					st=con.createStatement();
					rs1=st.executeQuery("select * from test where course_id='"+courseid+"'and class_id='"+classid+"'and test_id='"+test_id+"'and co_no='"+cono+"'and acad_year='"+acad_year+"'");
					sum=0;
					while(rs1.next())
					{
						ques=rs1.getInt("ques_no");
						subques=rs1.getInt("sub_ques_no");
						
						st=con.createStatement();
						rs2=st.executeQuery("select * from entermarks where course_id='"+courseid+"'and class_id='"+classid+"'and test_id='"+test_id+"'and roll_no='"+i+"'and ques_no='"+ques+"'and sub_ques_no='"+subques+"'and acad_year='"+acad_year+"'");
						rs2.next();	
						if(rs2.getInt("marks")==-1)
						{
							sum=-1;
						}
						else
						{
							sum+=rs2.getInt("marks");
						}
							
					}
					if(sum!=-1)
					{
						if(sum>=0.4*maxmarks)
						{
							level1++;
						}
						if(sum>=0.6*maxmarks)
						{
							level2++;
						}
						if(sum>=0.66*maxmarks)
						{
							level3++;
						}
					}

				}
				
				st=con.createStatement();
				/*String sql="call calculate_attainment(?,?,?,?,?,?,?,?,?,?,?)";
				st0=con.prepareStatement(sql);
				st0.setFloat(1,level1);
				st0.setFloat(2,level2);
				st0.setFloat(3,level3);
				st0.setInt(4,num);
				st0.setInt(5,courseid);
				st0.setInt(6,classid);
				st0.setInt(7,test_id);
				st0.setFloat(8,tl1);
				st0.setFloat(9,tl2);
				st0.setFloat(10,tl3);
				st0.setInt(11,cono);
				rs=st0.executeQuery();*/
				
				st.executeUpdate("insert into levels values ('"+courseid+"','"+classid+"','"+test_id+"','"+one+"','"+cono+"','"+level1+"','"+level2+"','"+level3+"','"+present_students+"','"+acad_year+"')");
			//	System.out.println("Level 1 :"+level1+"Level2 :"+level2+"Level3 :"+level3);
				pl1=((float)level1/(float)present_students)*100;
				pl2=((float)level2/(float)present_students)*100;
				pl3=((float)level3/(float)present_students)*100;
				
			//	System.out.println("Pl1 :"+pl1+"Pl2 :"+pl2+"Pl3 :"+pl3);
				l1a=pl1/tl1;
				l2a=(pl2/tl2)*2;
				l3a=(pl3/tl3)*3;
				st=con.createStatement();
				st.executeUpdate("insert into levels values ('"+courseid+"','"+classid+"','"+test_id+"','"+two+"','"+cono+"','"+l1a+"','"+l2a+"','"+l3a+"','"+present_students+"','"+acad_year+"')");
			//	System.out.println("l1a :"+l1a+"l2a :"+l2a+"l3a :"+l3a);
				
				
				
			}
			
			
			float data0;
			maxmarks=70;
			st=con.createStatement();
			//System.out.println("Jaju screams more than shreya");
			rs=st.executeQuery("select * from target where course_id='"+courseid+"'and acad_year='"+acad_year+"'and test_id='"+two+"'");
			rs.next();
			tl1=rs.getInt("level1");
			tl2=rs.getInt("level2");
			tl3=rs.getInt("level3");
			System.out.println("Targets ::: "+tl1+tl2+tl3);
			st=con.createStatement();
			rs=st.executeQuery("select * from sppumarks where course_id='"+courseid+"'and acad_year='"+acad_year+"'");
			while(rs.next())
			{
				
				data0=rs.getInt("marks");
				if(data0>=0.4*maxmarks)
				{
					level1++;
				}
				if(data0>=0.6*maxmarks)
				{
					level2++;
				}
				if(data0>=0.66*maxmarks)
				{
					level3++;
				}
			}
			st=con.createStatement();
			st.executeUpdate("insert into levels values ('"+courseid+"','"+classid+"','"+3+"','"+one+"','"+minusone+"','"+level1+"','"+level2+"','"+level3+"','"+10+"','"+acad_year+"')");
			
			
			pl1=((float)level1/10)*100;
			pl2=((float)level2/10)*100;
			pl3=((float)level3/10)*100;
			
			l1a=pl1/tl1;
			l2a=(pl2/tl2)*2;
			l3a=(pl3/tl3)*3;
			
			if(l1a>1)
			{
				l1a=1;
			}
			
			if(l2a>2)
			{
				l2a=2;
			}
			
			if(l2a>3)
			{
				l3a=3;
			}
			
		/*	CallableStatement csmt=con.prepareCall("{call calc_levels(?,?,?,?,?,?)}");
			csmt.setFloat(1,l1a);
			csmt.setFloat(2,l2a);
			csmt.setFloat(3,l3a);
			csmt.setInt(4, courseid);
			csmt.setInt(5,classid);
			csmt.setInt(6,acad_year);
			csmt.executeQuery();
			//call calc_levels(l1a,l2a,l3a,courseid,classid,acad_year);*/
			//st=con.createStatement();
			//st.executeUpdate("insert into levels values ('"+courseid+"','"+classid+"','"+3+"','"+two+"','"+minusone+"','"+l1a+"','"+l2a+"','"+l3a+"','"+10+"','"+acad_year+"')");
		
			float attainment1=(l1a+l2a+l3a)/6;
			st=con.createStatement();
			st.executeUpdate("insert into attainment values('"+courseid+"','"+classid+"','"+test_id+"','"+attainment1+"','"+acad_year+"')");
		response.sendRedirect("dashboard.jsp");
		
		
		}
			
		catch(Exception e)
		{
			e.printStackTrace();		
		}

	
}
}
