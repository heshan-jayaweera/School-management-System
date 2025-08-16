<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Student/st.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	
</head>

<body>
    <nav>
        <div class="logo">
            <a href="https://google.com"><img src = "logo3.png" id="logoid"></a>
        </div>

        <ul id="menuList">
            <li><a href="std-dashboard.jsp">Dashboard</a></li>
            <li><a href="std-assignment.jsp">Assignments</a></li>
            <li><a href="std-inq.jsp">Inquiries</a></li>
            <li><a class="std-profile.jsp" href="#"><i class="fa-solid fa-user"></i> Student Profile</a></li> 
            
           
        </ul>
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleMenu()"></i>
        </div>
    </nav>


    <main>
        <div class="cont">
        
        <form action="${pageContext.request.contextPath}/updtestd" method="post" class="profile-form">
        
            <div class="profile-group">
                <label for="STID">Student ID:</label>
                <input type="text" id="STID" name="STID" value="${sessionScope.STID}">
            </div>
                 
            <div class="profile-group">
                <label for="userName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" value="${sessionScope.fullName}" readonly>
            </div>

            <div class="profile-group">
                <label for="userName">Username:</label>
                <input type="text" id="userName" name="userName" value="${sessionScope.userName}">
                <button type="submit" name="updateField" value="userName">Update</button>
            </div>

            <div class="profile-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${sessionScope.email}">
                <button type="submit" name="updateField" value="email">Update</button>
            </div>

            <div class="profile-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="${sessionScope.password}">
                <button type="submit" name="updateField" value="password">Update</button>
            </div>
            
            <div class="profile-group">
                <label for="userName">Stream:</label>
                <input type="text" id="stream" name="stream" value="${sessionScope.stream}" readonly>
            </div>
            
            <div class="profile-group">
                <label for="userName">Class:</label>
                <input type="text" id="stclass" name="stclass" value="${sessionScope.stclass}" readonly>
            </div>
            
            <div class="profile-group">
                <label for="userName">Current Status:</label>
                <input type="text" id="cstatus" name="cstatus" value="${sessionScope.cstatus}" readonly>
            </div>

            <div class="profile-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="${sessionScope.phone}">
                <button type="submit" name="updateField" value="phone">Update</button>
            </div>

            <div class="profile-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${sessionScope.address}">
                <button type="submit" name="updateField" value="address">Update</button>
            </div>

        </form>
        
        	
        
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