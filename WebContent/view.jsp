<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    	request.getRequestDispatcher("Login.jsp").forward(request, response);
%>
<%} 
    else {
%>
<%@ page import="java.util.*" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>

<link rel="stylesheet" type="text/css" href="styles1.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<section id="team" class="pb-5">
	<div>
		<div class="input-group-prepend">
			<span class="input-group-text"><i class="fa fa-user"></i></span>
			<h5 style="color:white;"><%=session.getAttribute("userid")%></h5 >
			<form method="POST" action="<%=request.getContextPath()%>/Logout"><button type="submit" class="btn float-right login_btn"> LogOut</button></form>
		</div>
	</div>
    <div class="container">
        <h5 class="section-title h1">DOCTOR DETAILS</h5>
        <div class="row">
        <%
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {

                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="https://sunlimetech.com/portfolio/boot4menu/assets/imgs/team/img_01.png" alt="card image"></p>
                                    <h4 class="card-title">Dr.  <%=pList.get(0) %> </h4>
                                    <p class="card-text">MOBILE NO. : <%=pList.get(3)%></p>
                                    <p class="card-text">SPECIALIZATION : <%=pList.get(5)%></p>
                                    <a href="#" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Dr.  <%=pList.get(0)%></h4>
                                    <p class="card-text">LOCATION : <%=pList.get(2)%></p>
                                    <p class="card-text">EMAIL : <%=pList.get(4)%> </p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-skype"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-google"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
            <!-- ./Team member -->   
            <%
                if (count == 0) {
            %>
            <tr>
                <h5 class="section-title h1">No Records Found!!</h5>    
            </tr>
            <%            }
            %>
        </div>
    </div>
</section>
<!-- Team -->
<%
    }
%>