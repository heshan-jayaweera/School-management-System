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
        		<h1>Edit User Details</h1>
        		
        	</div>
        	
        	<div class = "formbg">
        	<div class = "usrupdtform">
        	
        	<form method = "post" action ="${pageContext.request.contextPath}/updtUser">
        	
        	<div class = "usrupdtform">
        	
        	<br><br>
        		<div class="formdetails">
        		<label>User Type</label> <br>
        		<select id = "utype" name="utype" value="${param.usertype }">
        			<option value = "Student">Student</option>
        			<option value = "Teacher">Teacher</option>
        			<option value = "Manager">Manager</option>
        			<option value = "Admin">Admin</option>
        		</select>
        		</div>
        		
        		<div class="formdetails">
        		<label>User ID</label><br>
        		<input type="text" name="uid" value="${param.userid }">
        		</div>
        		
        		<div class="formdetails">
        		<label>User Name</label><br>
        		<input type="text" name="uname" value="${param.username }">
        		</div>
        		
        		<div class="formdetails">
        		<label>Email</label><br>
        		<input type="email" name="uemail" value="${param.useremail }">
        		</div>
        		
        		<div class="formdetails">
        		<label>Password</label><br>
        		<input type="text" name="pass" value="${param.userpw }">
        		</div>
        		
        		<div class="formdetails">
        		<label>Phone </label><br>
        		<input type="tel" name="phone" value="${param.userph }">
        		</div><br>
        		
        		<input type ="submit" id="sbtn" value="Update">
        		</div></div>
        	</form>
        	
        	
        	
        	</div></div>
        	
        	
        
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