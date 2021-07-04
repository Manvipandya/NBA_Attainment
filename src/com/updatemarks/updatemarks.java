package com.updatemarks;

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

@WebServlet("/updatemarks")
public class updatemarks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		HttpSession session=request.getSession();
		int classid=Integer.parseInt((String)session.getAttribute("class1"));
		int courseid=Integer.parseInt((String)session.getAttribute("subject"));
		int test_id=Integer.parseInt((String)session.getAttribute("test_id"));
		int ques_no = 0;
		ResultSet rs;
		int num = 10;
		int i,j,k,data1;
		String data;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
			Statement st;
			st=con.createStatement();
			ResultSet rs1=st.executeQuery("select year(CURDATE()) as year1");
			rs1.next();
			int acad_year=rs1.getInt("year1");
			st=con.createStatement();
			rs=st.executeQuery("select * from question where test_id='"+test_id+"'and course_id='"+courseid+"'and class_id='"+classid+"'and acad_year='"+acad_year+"'");
			while(rs.next())
			{
				ques_no++;
			}
			
			int count;
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
						String concat=Integer.toString(i)+Integer.toString(j)+Integer.toString(k);
						
						data=request.getParameter(concat);
				
						
						if(data!=null && !(data.isEmpty()) )
						{
							
							data1=Integer.parseInt(data);
							
							st=con.createStatement();
						
							st.executeUpdate("update entermarks set marks='"+data1+"' where test_id='"+test_id+"' and course_id = '"+courseid+"'and class_id='"+classid+"' and roll_no = '"+i+"' and ques_no  = '"+j+"' and sub_ques_no  = '"+k+"'and acad_year='"+acad_year+"'");
						
						}
						
					}
					
				}
				
				System.out.println("Hello Shyamal"); 
			}
			int one=1;
			int minusone=-1;
			int two=2;
			
			int cono,absent_students=0,present_students,maxmarks,level1,level2,level3,ques,subques;
			ResultSet rs2;
			float tl1,tl2,tl3,l1a,l2a,l3a,pl1,pl2,pl3;
			
			st=con.createStatement();
			rs=st.executeQuery("select * from entermarks where course_id='"+courseid+"'and class_id='"+classid+"'and test_id='"+test_id+"'and ques_no='"+one+"'and sub_ques_no='"+one+"'and marks='"+minusone+"'and acad_year='"+acad_year+"'");
			while(rs.next())
			{
				absent_students++;
			}
			
			System.out.println("Absent Students :"+absent_students);
			present_students=num-absent_students;
			
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
				System.out.println("Hello Manvi cono :"+cono);
				maxmarks=rs.getInt("maxmarks");
				
				level1=0;level2=0;level3=0;
				for(i=1;i<=num;i++)//Student
				{
					
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
				
				/*st=String sql="call calculate_attainment(?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement st0=con.prepareStatement(sql);
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
				
				
				st=con.createStatement();
				st.executeUpdate("update levels set level1='"+level1+"' where test_id='"+test_id+"' and course_id = '"+courseid+"'and class_id='"+classid+"' and mykey='"+one+"'and co_no='"+cono+"'and acad_year='"+acad_year+"'");
				st=con.createStatement();
				st.executeUpdate("update levels set level2='"+level2+"' where test_id='"+test_id+"' and course_id = '"+courseid+"'and class_id='"+classid+"' and mykey='"+one+"'and co_no='"+cono+"'and acad_year='"+acad_year+"'");
				st=con.createStatement();
				st.executeUpdate("update levels set level3='"+level3+"' where test_id='"+test_id+"' and course_id = '"+courseid+"'and class_id='"+classid+"' and mykey='"+one+"'and co_no='"+cono+"'and acad_year='"+acad_year+"'");
				//st.executeUpdate("insert into levels values ('"+courseid+"','"+classid+"','"+test_id+"','"+1+"','"+cono+"','"+level1+"','"+level2+"','"+level3+"','"+present_students+"')");
				System.out.println("Level 1 :"+level1+"Level2 :"+level2+"Level3 :"+level3);
				pl1=((float)level1/(float)present_students)*100;
				pl2=((float)level2/(float)present_students)*100;
				pl3=((float)level3/(float)present_students)*100;
				
				System.out.println("Pl1 :"+pl1+"Pl2 :"+pl2+"Pl3 :"+pl3);
				l1a=pl1/tl1;
				l2a=(pl2/tl2)*2;
				l3a=(pl3/tl3)*3;
				//st=con.createStatement();
				st=con.createStatement();
				
				st.executeUpdate("update levels set level1='"+l1a+"' where test_id='"+test_id+"' and course_id = '"+courseid+"'and class_id='"+classid+"' and mykey='"+two+"'and co_no='"+cono+"'and acad_year='"+acad_year+"'");
				st=con.createStatement();
				st.executeUpdate("update levels set level2='"+l2a+"' where test_id='"+test_id+"' and course_id = '"+courseid+"'and class_id='"+classid+"' and mykey='"+two+"'and co_no='"+cono+"'and acad_year='"+acad_year+"'");
				st=con.createStatement();
				st.executeUpdate("update levels set level3='"+l3a+"' where test_id='"+test_id+"' and course_id = '"+courseid+"'and class_id='"+classid+"' and mykey='"+two+"'and co_no='"+cono+"'and acad_year='"+acad_year+"'");
				
				//st.executeUpdate("insert into levels values ('"+courseid+"','"+classid+"','"+test_id+"','"+2+"','"+cono+"','"+l1a+"','"+l2a+"','"+l3a+"','"+present_students+"')");
				System.out.println("l1a :"+l1a+"l2a :"+l2a+"l3a :"+l3a);
	
			
		}
			response.sendRedirect("showmarks.jsp");
		}
			catch(Exception e)
			{
				e.printStackTrace();		
			}
		
	
	}

}
