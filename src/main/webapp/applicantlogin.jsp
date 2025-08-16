<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/ls.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>

<body>
    <nav>
        <div class="logo">
            <a href="https://google.com"><img src="logo3.png" id="logoid"></a>
        </div>

        <ul id="menuList">
            <li><a class="currentpg" href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Programs</a></li>
            <li><a href="#">Student Life</a></li>
            <li><a href="#">News & updates</a></li>
        </ul>
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleMenu()"></i>
        </div>
    </nav>

    <main>
        <div class="cont">
            
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <form method="post" action="${pageContext.request.contextPath}/applicantlogin">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" required>
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>

                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
    </main>

    <br>
    <div class="footersec">
        <footer>
            <div class="footer-cols">
                <div class="footer-col">
                    <h4>School</h4>
                    <ul>
                        <li><a href="#"><i class="fa-solid fa-building-columns"></i> About</a></li>
                        <li><a href="#"><i class="fa-solid fa-user-graduate"></i> Programs</a></li>
                        <li><a href="#"><i class="fa-solid fa-newspaper"></i> News & updates</a></li>
                        <li><a href="#"><i class="fa-solid fa-briefcase"></i> Careers</a></li>
                        <li><a href="Registration.jsp"><i class="fa-solid fa-right-to-bracket"></i> Sign Up</a></li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4>Contact</h4>
                    <ul>
                        <li><a href="#"><i class="fa-solid fa-phone"></i> +1 323 556 6755</a></li>
                        <li><a href="#"><i class="fa-solid fa-envelope"></i> info@mwhs.com</a></li>
                        <li><a href="#"><i class="fa-solid fa-location-dot"></i> 5431 Venice Blvd. <br> Los Angeles<br> California 90019</a></li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4>Follow</h4>
                    <div class="icons">
                        <i class="fa-brands fa-linkedin"></i>
                        <i class="fa-brands fa-square-instagram"></i>
                        <i class="fa-brands fa-youtube"></i>
                        <i class="fa-brands fa-square-facebook"></i>
                    </div>
                </div>
                <br>

                <div class="footer-col">
                    <div class="footerlogo">
                        <img src="footerlogo.png" id="flogoid">
                    </div>
                </div>

            </div>

            <div class="crt">
                <p>&copy; All rights reserved 2025</p>
            </div>
        </footer>
    </div>

    <script>
        let menuList = document.getElementById("menuList");
        menuList.style.maxHeight = "0px";

        function toggleMenu() {
            if (menuList.style.maxHeight == "0px") {
                menuList.style.maxHeight = "300px";
            } else {
                menuList.style.maxHeight = "0px"
            }
        }
    </script>
</body>
</html>
