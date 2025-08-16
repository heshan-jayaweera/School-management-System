<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String assignmentID = request.getParameter("assignmentID");
    if (assignmentID == null || assignmentID.isEmpty()) {
        // Handle the case where assignmentID is missing in the URL
        response.getWriter().println("Error: Assignment ID is missing in the URL.");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="./std.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<style>
	
	.cont h2{
	
	color:white;
	padding:20px;
	text-align:center;
	}
	
	.assignment-form {
    display: flex;
    flex-direction: column;
    padding:30px;
    background-color:#994C00;
  }

  .form-group {
    margin-bottom: 15px;
  }

  .form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    padding:10px;
    color:black;
  }

  .form-group input[type="text"],
  .form-group input[type="date"],
  .form-group input[type="number"],
  .form-group input[type="file"] {
    width: 100%;
    padding: 8px;
    border-radius: 5px;
    border: none;
    background: #f1f1f1;
    color: #000;
  }

  .form-group button {
    background: #f1bc0d;
    color: #000;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
  }

  .form-group button:hover {
    background: #d9a30b;
  }
	
	</style>
	
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
            <h2>Submit Assignment</h2>
    <form action="${pageContext.request.contextPath}/assignsub" method="post" enctype="multipart/form-data" class="assignment-form">
    
    <input type="hidden" name="assignmentId" value="<%= assignmentID %>">
    
      <div class="form-group">
        <label for="submissionDate">Date</label>
        <input type="date" id="submissionDate" name="submissionDate" required>
      </div>

      <div class="form-group">
        <label for="document">Upload Document</label>
        <input type="file" id="document" name="document" accept=".pdf,.doc,.docx" required>
      </div>

      <!-- Hidden Status -->
      <input type="hidden" name="status" value="pending">

      <div class="form-group">
        <button type="submit">Submit Assignment</button>
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