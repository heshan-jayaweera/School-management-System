<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="${pageContext.request.contextPath}/Admin/ad2.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	
</head>

<body>
    <nav>
        <div class="logo">
            <a href="https://google.com"><img src = "logo3.png" id="logoid"></a>
        </div>

        <ul id="menuList">
            <li><a href="./ad-index.jsp">Dashboard</a></li>
            <li><a class="currentpg" href="#">Users</a></li>
            <li><a href="./ad-prg.jsp">Programs</a></li>
            <li><a href="#">Inquiries</a></li>
            <li><a href="#"><i class="fa-solid fa-user"></i> Admin Profile</a></li> <!-- Comment -->
            
            <!-- Comment -->
        </ul>
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleMenu()"></i>
        </div>
    </nav>


    <main>
        <div class="cont">
        
        	<div class = "titlebar">
        		<h1>All Users</h1>
        		<div class = "opbar"><ul><li id="adduserbtn">Add User</li><li id="showtble">View All</li></ul></div>
        	</div>
        	
        	<div class = "addnewuser" id="addnewuser">
        	
        	<div class = "usrform">
        	
        	<form method = "post" action ="${pageContext.request.contextPath}/addUser">
        	
        	<div class = "usrform">
        	
        	<br><br>
        		<div class="formdetails">
        		<label>User Type</label> <br>
        		<select id = "utype" name="utype">
        			<option value = "Student">Student</option>
        			<option value = "Teacher">Teacher</option>
        			<option value = "Manager">Manager</option>
        			<option value = "Admin">Admin</option>
        		</select>
        		</div>
        		
        		<div class="formdetails">
        		<label>User ID</label><br>
        		<input type="text" name="uid">
        		</div>
        		
        		<div class="formdetails">
        		<label>User Name</label><br>
        		<input type="text" name="uname">
        		</div>
        		
        		<div class="formdetails">
        		<label>Email</label><br>
        		<input type="email" name="uemail">
        		</div>
        		
        		<div class="formdetails">
        		<label>Password</label><br>
        		<input type="password" name="pass">
        		</div>
        		
        		<div class="formdetails">
        		<label>Phone </label><br>
        		<input type="tel" name="phone">
        		</div><br>
        		
        		<input type ="submit" id="sbtn">
        		</div>
        	</form>
        	
        	
        	
        	</div></div>
        	
        	<div class = "usertable" id="usrtble">
        	<form action="${pageContext.request.contextPath}/allUserDetails" method="post"><button type="submit">View All</button></form>
        		<table class="usertb">
 						<thead>
    						<tr>
      							<th >User ID</th>
     							<th >Name</th>
      							<th >Type</th>
							    <th >Email</th>
							    <th >Password</th>
							    <th >Phone</th>
							    <th >Actions</th>
    						</tr>
  						</thead>
  						<tbody>
    						<c:forEach var ="usr" items="${user}">
    							<tr>
    								<td>${usr.uid}</td>
    								<td>${usr.name}</td>
    								<td>${usr.type}</td>
    								<td>${usr.email}</td>
    								<td>${usr.password}</td> 							
    								<td>${usr.phone}</td>
    								<td><div class = "actbar"><ul><li id="edituserbtn">
    								<form action="./Admin/ad-users-editud.jsp" method="post">
    									<input type="hidden" name="userid" value="${usr.uid}">
    									<input type="hidden" name="username" value="${usr.name}">
    									<input type="hidden" name="usertype" value="${usr.type}">
    									<input type="hidden" name="useremail" value="${usr.email}">
    									<input type="hidden" name="userpw" value="${usr.password}">
    									<input type="hidden" name="userph" value="${usr.phone}">
    									
    									<input type="submit" value = "Edit">
    								</form>
    								
    								</li><li id="deleteudbtn"><form action = "${pageContext.request.contextPath}/deleteUser" method = "post">
    									<input type="hidden" name="useridn" value="${usr.uid}">
    									<input type="submit" value = "Delete">
    								</form></li></ul></div></td>
    							
    							</tr>
    						</c:forEach>
    							
 					 	</tbody>
				</table>
        	</div>
        	
        	
        	<div class = "titlebar">
        		<h1>Teachers</h1>
        		<div class = "opbar"><ul><li>View All</li></ul></div>
        	</div>
        	
        	<div class = "titlebar">
        		<h1>Students</h1>
        		<div class = "opbar"><ul><li><a href = "ad-users-student.jsp">View All</a></li></ul></div>
        	</div>
        	
        	<div class = "titlebar">
        		<h1>Managers</h1>
        		<div class = "opbar"><ul><li>View All</li></ul></div>
        	</div>
        
        </div>


    </main>

    <br>
    <!----------------------  FOOTER  ---------------------->
    <div class="footersec">
        <footer>
            <div class="footer-cols">
        <div class="footer-col">
            <h4>School</h4>
            <ul>
                <li><a href="#"><i class="fa-solid fa-building-columns"></i> About</a></li>
                <li><a href="#"><i class="fa-solid fa-user-graduate"></i> Programs</a></li>
                <li><a href="#"><i class="fa-solid fa-newspaper"></i> News & updates</a></li>
                <li><a href="#"><i class="fa-solid fa-briefcase"></i> Carieers</a></li>
                <li><a href="#"><i class="fa-solid fa-right-to-bracket"></i>Logout</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Contact</h4>
            <ul>
                
                <li><a href="#"><i class="fa-solid fa-phone"></i> +1 323 556 6755</a></li>
                <li><a href="#"><i class="fa-solid fa-envelope"></i> info@mwhs.com</a></li>
                <li><a href="#"><i class="fa-solid fa-location-dot"></i> 5431 Venice Blvd. <br>  Orange County<br>  California 90019</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Follow</h4>
            
                <div class="icons">
                <i class="fa-brands fa-linkedin"></i>
                <i class="fa-brands fa-square-instagram"></i>
                <i class="fa-brands fa-youtube"></i>
                <i class="fa-brands fa-square-facebook"></i>
                <!--<li><a href="#">LinkedIN</a></li>
                <li><a href="#">Instagram</a></li>
                <li><a href="#">Facebook</a></li> -->
                </div>
        </div>
        <br>
        
        <div class="footer-col">
            <div class="footerlogo">
                <img src = "footerlogo.png" id="flogoid"> 
            </div>
        </div>

    </div>

    <div class="crt"><p>&copy; All rights reserved 2025</p></div>
    </footer>    
    </div>
    
   <!----------------------  JAVA SCRIPT  ---------------------->
   <script>
        let menuList = document.getElementById("menuList");
        menuList.style.maxHeight = "0px";

        function toggleMenu(){
            if(menuList.style.maxHeight == "0px"){
                menuList.style.maxHeight = "300px";
            }else{
                menuList.style.maxHeight = "0px"
            }
        }
        
        let showtble = document.getElementById("showtble");
        showtble.addEventListener("click", function(){
        	const usertble = document.getElementById("usrtble");
        	
        	if (usertble.style.display==="none"){
        		usertble.style.display = "block";
        	}else {
        		usertble.style.display = "none";
        	}
        })
        
        let adduserbtn = document.getElementById("adduserbtn");
        adduserbtn.addEventListener("click", function(){
        	const addnewuser = document.getElementById("addnewuser");
        	
        	if (addnewuser.style.display==="none"){
        		addnewuser.style.display = "block";
        	}else {
        		addnewuser.style.display = "none";
        	}
        })
        
        
        
           
   </script>
   <!----------------------  /JAVA SCRIPT  ---------------------->
</body>
</html>