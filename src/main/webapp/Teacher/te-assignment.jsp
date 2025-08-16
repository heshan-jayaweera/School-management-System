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
	
	<style>
      .assignment-form {
        background: #fff;
        max-width: 600px;
        margin: 50px auto;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        font-family: Arial, sans-serif;
      }

      .form-group {
        margin-bottom: 20px;
      }

      .form-group label {
        display: block;
        margin-bottom: 6px;
        font-weight: bold;
        color: #555;
      }

      .form-group input,
      .form-group select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
      }

      .form-group input[type="file"] {
        padding: 5px;
      }

      .submit-btn {
        width: 100%;
        padding: 12px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s ease;
      }

      .submit-btn:hover {
        background-color: #0056b3;
      }
    </style>
	
</head>

<body>
    <nav>
        <div class="logo">
            <a href="https://google.com"><img src = "logo3.png" id="logoid"></a>
        </div>

        <ul id="menuList">
           <li><a href="te-dashboard.jsp">Dashboard</a></li>
            <li><a class="currentpg" href="#">My Classes</a></li>
            <li><a href="te-result.jsp">Results</a></li>
            <li><a class="te-inq.jsp">Inquiries</a></li>
            <li><a href="te-profile.jsp"><i class="fa-solid fa-user"></i>Teacher Profile</a></li> <!-- Comment -->
            
            <!-- Comment -->
        </ul>
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleMenu()"></i>
        </div>
    </nav>


    <main>
      <div class="cont">

        <form class="assignment-form" action="${pageContext.request.contextPath}/createassign" method="POST" enctype="multipart/form-data">

   
      <div class="form-group">
        <label for="assignmentID">Assignment ID</label>
        <input type="text" id="assignmentID" name="assignmentID" required>
      </div>

      <div class="form-group">
        <label for="Name">Assignment Name</label>
        <input type="text" id="Name" name="Name" required>
      </div>

      <div class="form-group">
        <label for="date">Date</label>
        <input type="date" id="date" name="date" required>
      </div>
      
      <div class="form-group">
        <label for="deadline">Deadline Date</label>
        <input type="date" id="deadline" name="deadline" required>
      </div>

      <div class="form-group">
        <label for="tid">Teacher ID</label>
        <input type="text" id="tid" name="tid" required>
      </div>

      <div class="form-group">
        <label for="Stream">Stream</label>
        <select id="Stream" name="Stream" required>
          <option value="" disabled selected>Select Stream</option>
          <option value="ICT">ICT</option>
          <option value="Science">Science</option>
          <option value="Commerce">Commerce</option>
          <option value="Arts">Arts</option>
        </select>
      </div>

      <!-- Hidden status field -->
      <input type="hidden" id="status" name="status" value="Pending">

      <div class="form-group">
        <label for="document">Upload Document</label>
        <input type="file" id="document" name="document" accept=".pdf,.doc,.docx" required>
      </div>

      <button type="submit" class="submit-btn">Submit</button>
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