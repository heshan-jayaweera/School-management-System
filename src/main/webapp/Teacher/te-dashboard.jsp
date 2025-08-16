<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="./te.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	
</head>

<body>
    <nav>
        <div class="logo">
            <a href="https://google.com"><img src = "logo3.png" id="logoid"></a>
        </div>

        <ul id="menuList">
            <li><a class="currentpg" href="#">Dashboard</a></li>
            <li><a href="te-class.jsp">My Classes</a></li>
            <li><a href="te-result.jsp">Results</a></li>
            <li><a href="te-inq.jsp">Inquiries</a></li>
            <li><a href="te-profile.jsp"><i class="fa-solid fa-user"></i>Teacher Profile</a></li> <!-- Comment -->
            
            <!-- Comment -->
        </ul>
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleMenu()"></i>
        </div>
    </nav>


     <main>
      


        <div class="cont">
        <h2>WELCOME!</h2> 
    
       <div class="dashboard-grid">
        <div class="dashboard-card">
            <h3><i class="fa-solid fa-chart-column"></i> Assignment Grading</h3> 
            <ul>
                <li>CM-Assignment 1 = Grading is in progress. </li> 
                <li>CM Assignment 2= Results has been completed and uploaded.</li>
                  
            </ul>
            <a href="te-result.jsp">View All</a>
         </div>
        
        <div class="dashboard-card">
            <h3><i class="fa-solid fa-folder-open"></i>Assignments</h3>
            <ul>
                <li>PHYSICS Report - Due 28th April</li>
                <li>Chemistry lab test report - Due 2nd May</li>
            </ul><br><br>
            <a href="te-class.jsp">Go to Assignments</a>
        </div>
        
        <div class="dashboard-card">
            <h3><i class="fa-solid fa-bullhorn"></i>Announcements</h3> 
            <ul>
                <li>There will be a quiz in CM covering up to unit 4.</li>
                 <li>Physics=Quiz 1 gets 20% from overall marks.</li> 
            </ul>
            <a href="announcement.jsp">See All</a>
        </div>
        
        <div class="dashboard-card">
            <h3><i class="fa-solid fa-book-open"></i> Study Materials</h3> 
            <ul>
                <li>Unit 2 Physics Notes</li>
                <li>CM lessons Summary</li>
                <li>Pastpapers</li>
            </ul>
            <a href="te-class.jsp">Browse Materials</a>
        </div>
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