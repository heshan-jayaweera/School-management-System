<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Home</title>
    <link rel="stylesheet" href="./mg.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom-styles.css">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
    <nav>
        <div class="logo">
            <a href="https://google.com"><img src="logo3.png" id="logoid"></a>
        </div>
        <ul id="menuList">
            <li><a href="mg-dashboard.jsp">Dashboard</a></li>
            <li><a class="currentpg" href="mg-app.jsp">Applicants</a></li>
            <li><a href="mg-payment.jsp">Payment</a></li>
            <li><a href="mg-inq.jsp">Inquiries</a></li>
            <li><a href="mg-profile.jsp"><i class="fa-solid fa-user"></i> Manager Profile</a></li>
        </ul>
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleMenu()"></i>
        </div>
    </nav>

    <main>
        <form action="${pageContext.request.contextPath}/mgrapplicant" method="post">
            <button type="submit">All Applicants</button>
        </form>
        <div class="cont">
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-header bg-primary text-white text-center">
                    <h2>Applicant Details</h2>
                </div>
                <div class="card-body">
                    <table class="table table-hover table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>Email</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Full Name</th>
                                <th>Phone</th>
                                <th>Stream</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="app" items="${applicant}">
                                <tr>
                                    <td>${app.email}</td>
                                    <td>${app.firstName}</td>
                                    <td>${app.lastName}</td>
                                    <td>${app.fullName}</td>
                                    <td>${app.phone}</td>
                                    <td>${app.stream}</td>
                                    <td>${app.status}</td>
                                    <td>
                                        <c:if test="${app.status != 'approved'}">
                                            <form action="${pageContext.request.contextPath}/mgrapplicant" method="post">
                                                <input type="hidden" name="email" value="${app.email}">
                                                <input type="hidden" name="action" value="approve">
                                                <button type="submit" class="btn btn-success">Approve</button>
                                            </form>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
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
                        <li><a href="#"><i class="fa-solid fa-right-to-bracket"></i>Logout</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Contact</h4>
                    <ul>
                        <li><a href="#"><i class="fa-solid fa-phone"></i> +1 323 556 6755</a></li>
                        <li><a href="#"><i class="fa-solid fa-envelope"></i> info@mwhs.com</a></li>
                        <li><a href="#"><i class="fa-solid fa-location-dot"></i> 5431 Venice Blvd. <br> Orange County<br> California 90019</a></li>
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
            <div class="crt"><p>&copy; All rights reserved 2025</p></div>
        </footer>    
    </div>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
