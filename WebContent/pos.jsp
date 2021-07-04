<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>PO</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
div 
     {
        
         padding:0px 0px 0px 0px;
         
     }
     body{
         height:100%;
         margin: 0;
         background-color:rgb(250, 253, 236);
     }


#p1,#p3,#p5,#p7,#p9,#p11{
    background-color:rgb(205, 252, 193);
  color: rgb(0, 0, 0);
  margin: 12px 20px;
  border: none;
  border-radius: 10px;
  font-family:'Times New Roman', Times, serif;
  font-size:15px;
  width:100%;

}

#p2,#p4,#p6,#p8,#p10,#p12{
    background-color:rgb(177, 216, 168);
  color: rgb(0, 0, 0);
  margin: 12px 20px;
  border: none;
  border-radius: 10px;
  font-family:'Times New Roman', Times, serif;
  font-size:15px;
  width:100%;

}
#PO1,#PO2,#PO3,#PO4,#PO5,#PO6,#PO7,#PO8,#PO9,#PO10,#PO11,#PO12{
    display:block;
}
button
{
    background-color:white;
    color:black;
    width:100%;
    height:3vh;
    margin-top:7px;
    text-align:center;
}


.scroll-right {
 height: 50px;	
 overflow: hidden;
 position: relative;
 color:red;
 text-align:center;

}
.scroll-right p {
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
  </style>
   <script type="text/javascript">
	
	history.pushState(null,null,location.href);
	window.onpopstate = function(){
		history.go(1);
	}
	
</script>
</head>
<body>
    <div class="container-fluid">
        <%@include file="header.jsp" %>
             
           <!--   <div class="row">
                <div class="header2">
                    <div class="scroll-right">
                        <p>12 PO's AS PER NBA ARE GIVEN :</p>
                    </div>
                </div>
            </div>-->
            <div class="row" id="bdy">
                <br><br>
                <div class="col-lg-2" >
    
                        <br><br>
    
                               <%@include file="dashboardoriginal.jsp" %>
                  
                </div>
                <div class="col-lg-7">
                   
                    <div class="row" id="p1" >
                        
                        <div class="col-lg-2"><h3>PO-1</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction1()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Engineering Knowledge</h3>
                                <p id="PO1">
                                    Apply the knowledge of mathematics, science,engineering fundamentals and engineering specialization to the solution of complex engineering problem.
                                </p>
                            </div>
                        </div>

                     
                    <div class="row" id="p2" >
                        
                        <div class="col-lg-2"><h3>PO-2</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction2()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Problem Analysis</h3>
                                <p id="PO2">
                                    An ability to define a problem and provide a systematic solution with the help of conducting experiments, analyzing the problem and interpreting the data.
                                </p>
                            </div>
                        </div>


                     
                    <div class="row" id="p3" >
                        
                        <div class="col-lg-2"><h3>PO-3</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction3()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Design/development of solutions</h3>
                                <p id="PO3">
                                    An ability to design, implement, and evaluate a software or a software/hardware system, component, or process to meet desired needs within realistic constraints.
                                </p>
                            </div>
                        </div>


                 
                    <div class="row" id="p4" >
                        
                        <div class="col-lg-2"><h3>PO-4</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction4()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Conduct investigation of Complex Problems</h3>
                                <p id="PO4">
                                    An ability to identify, formulate, and provide systematic solutions to complex engineering/Technology problems.
                                </p>
                            </div>
                        </div>


                      
                    <div class="row" id="p5" >
                        
                        <div class="col-lg-2"><h3>PO-5</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction5()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Modern tool usage</h3>
                                <p id="PO5">
                                    An ability to use the techniques, skills, and modern engineering technology tools, standard processes necessary for practice as a IT professional.
                                </p>
                            </div>
                        </div>


                       
                    <div class="row" id="p6" >
                        
                        <div class="col-lg-2"><h3>PO-6</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction6()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >The engineer and society</h3>
                                <p id="PO6">
                                    An ability to apply mathematical foundations, algorithmic principles, and computer science theory in the modeling and design of computer-based systems with necessary constraints and assumptions.
                                </p>
                            </div>
                        </div>



                     
                    <div class="row" id="p7" >
                        
                        <div class="col-lg-2"><h3>PO-7</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction7()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Environment and sustainability</h3>
                                <p id="PO7">
                                    An ability to analyze and provide solution for the local and global impact of information technology on individuals, organizations and society.
                                </p>
                            </div>
                        </div>


                      
                    <div class="row" id="p8" >
                        
                        <div class="col-lg-2"><h3>PO-8</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction8()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Ethics</h3>
                                <p id="PO8">
                                    An ability to understand professional, ethical, legal, security and social issues and responsibilities.
                                </p>
                            </div>
                        </div>



                       
                    <div class="row" id="p9" >
                        
                        <div class="col-lg-2"><h3>PO-9</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction9()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Individual and team work</h3>
                                <p id="PO9">
                                    An ability to function effectively as an individual or as a team member to accomplish a desired goal(s).
                                </p>
                            </div>
                        </div>


                        
                    <div class="row" id="p10" >
                        
                        <div class="col-lg-2"><h3>PO-10</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction10()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Communication</h3>
                                <p id="PO10">
                                    An ability to engage in life-long learning and continuing professional development to cope up with fast changes in the technologies/tools with the help of electives, professional organizations and extra-curricular activities.
                                </p>
                            </div>
                        </div>
                    


                
                    <div class="row" id="p11" >
                        
                        <div class="col-lg-2"><h3>PO-11</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction11()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Project Management and Finance</h3>
                                <p id="PO11">
                                    An ability to communicate effectively in engineering community at large by means of effective presentations, report writing, paper publications, demonstrations.
                                </p>
                            </div>
                        </div>



                        
                    <div class="row" id="p12" >
                        
                        <div class="col-lg-2"><h3>PO-12</h3></div>
                        
                        <div class="col-lg-1" >
                                <button onclick="myFunction12()">-</button>
                                </div>
                            <div class="col-lg-8">
                                <h3 >Life-long learning</h3>
                                <p id="PO12">
                                    An ability to understand engineering, management, financial aspects, performance, optimizations and time complexity necessary for professional practice.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>

        </div>
 <%@include file="footer.jsp" %>
       
</div>

        <script>
               

                function myFunction1() {
  var x = document.getElementById("PO1");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
  }

 function myFunction2() {
 var x = document.getElementById("PO2");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

 function myFunction3() {
   var x = document.getElementById("PO3");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
function myFunction4() {
  var  x = document.getElementById("PO4");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

 function myFunction5() {
  var  x = document.getElementById("PO5");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

 function myFunction6() {
   var x = document.getElementById("PO6");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
 }


 function myFunction7() {

   var x = document.getElementById("PO7");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
 }

 function myFunction8() {
    var x = document.getElementById("PO8");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
 }

 function myFunction9() {
   var x = document.getElementById("PO9");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

 function myFunction10() {
var  x = document.getElementById("PO10");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
 }

 function myFunction11() {
  var  x = document.getElementById("PO11");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}


 function myFunction12() {
    var x = document.getElementById("PO12");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}







                </script>

</body>
</html>