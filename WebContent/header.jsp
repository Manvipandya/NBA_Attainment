<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width:100%;
  height:6vh;
}

input[type=submit]:hover {
  background-color: #45a049;
}


#nv
     {
         height:5vh;
     }
     .header{
         height:5vh;
         width: 100%;
        background-color: rgb(242, 253, 193);
        color: white;
        font-family: zebrazil;
        
        
     }
     .header2{
         height:5vh;
         width: 100%;
        background-color: rgb(235, 247, 171);
        color: white;
     }
     
  #navbar {
 
 
  height:5vh;
        
         width: 100%;
  background-color: rgb(250, 253, 236);
  overflow: hidden;
  font-family: zebrazil;
  font-size:25px;
}
#nv a {
  float: left;
  display: block;
  color: #252323;
  text-align: center;
 padding :0px;
 margin:0px;
  text-decoration: none;
  font-size: 30px;
  width:100%;
}

#nv a:hover {
  background-color: rgb(36, 236, 18);
  color: black;
}

#nv a.active {
  background-color: rgb(75, 216, 79);
  color: rgb(29, 20, 20);
}

#navbar a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

#navbar a:hover {
  background-color: #000;
  color: black;
}



#navbar a.active {
  background-color: rgb(75, 216, 79);
  color: white;
}




img{
    height:10vh;
}

.scroll-right {
 height: 50px;	
 overflow: hidden;
 position: relative;
 color:black;
 text-align:center;

}
.scroll-right h5 {
 position: absolute;
 width: 100%;
 height: 100%;
 margin: 0;
 line-height: 50px;
 text-align: center;
 /* Starting position */
 -moz-transform:translateX(-100%);
 -webkit-transform:translateX(-100%);	
 transform:translateX(-100%);
 /* Apply animation to this element */	
 -moz-animation: scroll-right 15s linear infinite;
 -webkit-animation: scroll-right 15s linear infinite;
 animation: scroll-right 15s linear infinite;
}
/* Move it (define the animation) */
@-moz-keyframes scroll-right {
 0%   { -moz-transform: translateX(-100%); }
 100% { -moz-transform: translateX(100%); }
}
@-webkit-keyframes scroll-right {
 0%   { -webkit-transform: translateX(-100%); }
 100% { -webkit-transform: translateX(100%); }
}
@keyframes scroll-right {
 0%   { 
 -moz-transform: translateX(-100%); /* Browser bug fix */
 -webkit-transform: translateX(-100%); /* Browser bug fix */
 transform: translateX(-100%); 		
 }
 100% { 
 -moz-transform: translateX(100%); /* Browser bug fix */
 -webkit-transform: translateX(100%); /* Browser bug fix */
 transform: translateX(100%); 
 }
}
 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row" >
            
                <div class="col-lg-1">
                    <img src="pict.jpg">
                </div>
                   <div class="col-lg-10 ">
    
                        <div id="navbar" >
                                <div class="row">
                                     
                                    <div class="col-lg-3" id="nv"></div>
                                    <div class="col-lg-8" id="nv">PUNE INSTITUTE OF COMPUTER TECHNOLOGY</div>
                                    
                                </div>
                        </div>
                        
                            <div class="header">
                                    <div class="row">
                                            <div class="col-lg-10" id="nv" style="text-align:center;padding-left:20vh;color:black;font-size:12px;">
                                                    Affiliated to University Pune.AICTE Approved.NAAC Accredited.ISO-9001-2008
                                          </div>
                                           
                                           <div class="col-lg-1" id="nv">
                                                   <a  href="dashboard.jsp"><i class= "fa fa-home"></i></a>
                                           </div>
                                           
                                           <div class="col-lg-1" id="nv">
                                                  
                                                   <form action="logout">
	 											     <button type="submit" formaction="logout" style="height:5vh;background-color:red;"><i class="fa fa-sign-out"></i></button>
	 												
									<!-- <input type="submit" value="logout" style="height:4vh;background-color:red;">
	 								 -->				</form>
                                           </div>
                                       </div>
                            </div>
                   </div>
                    
            </div>
             <%
            	String designation1 = (String)session.getAttribute("designation");
            String username1 = (String)session.getAttribute("username");
            int course_id1 = Integer.parseInt((String)session.getAttribute("subject"));
            int class10 = Integer.parseInt((String)session.getAttribute("class1"));
            int class20 = class10/10;
            String data5 = "";
            if(class20 == 2)
            	data5="SE-";
            else if(class20 == 3)
            	data5="TE-";
            else if(class20 == 4)
            	data5="BE-";
            int class8 = class10%10;
            class8 += 8;
            %>
            <div class="row">
                <div class="header2">
                <div class="scroll-right">
                       <h5>Hey <%=username1 %> ! </h5>
                    </div> 
                </div> 
            </div>
            <br>
            <div class="row">
            	<div class="col-lg-3"></div>
            	<div class="col-lg-8"><h5>You have Signed up as <%=designation1 %> for Course-ID <%=course_id1  %> and Class <%=data5 %><%=class8 %> !</h5>
            	</div>
            </div>
            </body>
</html>