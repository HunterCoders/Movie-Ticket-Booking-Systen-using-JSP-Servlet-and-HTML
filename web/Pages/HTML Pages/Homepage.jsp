<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Movie Ticket Booking Homepage</title>
        <link rel="stylesheet" type="text/css" href="..\CSS\HomepageCSS.css">
    </head>
    <body style="">
        <!-- Menu bar -->
        <div class="menu">
            <a href="http://localhost:8080/TestProject/Pages/HTML%20Pages/Homepage.jsp">
                <img id="logo" src="..\..\Images\Logo.png" >
            </a>
            <% if (session.getAttribute("loggedInUser") == null) {%>
            <a href="http://localhost:8080/TestProject/Pages/HTML%20Pages/Register.jsp">Register</a>

            <a href="http://localhost:8080/TestProject/Pages/HTML%20Pages/Login.jsp">Login</a>
            <% }%>  
            <a href="http://localhost:8080/TestProject/Pages/HTML%20Pages/Book%20Ticket.jsp">Book Tickets</a>
            <a href="http://localhost:8080/TestProject/Pages/HTML%20Pages/Admin%20Login.jsp">Admin Login</a>
            <% if (session.getAttribute("loggedInUser") != null) {%>
            <a href="showTickets.jsp" method="post"> See Booked Tickets
            </a>
            <a href="LogOut.jsp" method="post"> Log Out
            </a>
            <%}%>
        </div>

        <!-- Slide show of images -->
        <div class="slide-container">
            <img src="..\..\Images\Slide Images\Layer 1.png" class="active" alt="IMG 1">
            <img src="..\..\Images\Slide Images\Layer 2.png">
            <img src="..\..\Images\Slide Images\Layer 3.png">
        </div>
        <p class="top-right">Welcome 
            <%
                HttpSession sess = request.getSession(false);
                if (sess.getAttribute("loggedInUser") == null) {

                } else {
                    out.println(sess.getAttribute("loggedInUser"));
                }

            %>!</p>
        <br>
        <br>

        <br>

            <h3 id="rec"> RECOMMENDED MOVIES</h3>
            <div class="row">
                <%            Class.forName("oracle.jdbc.driver.OracleDriver");
                    // Connect to the database
                    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@LAPTOP-DBORBG65:1521:ORCLE", "DBName", "Sinha");

                    // Retrieve movies for the selected city from the database
                    String query = "SELECT * FROM reco";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                    // Loop through the results and display each movie in a table row
                    while (rs.next()) {
                %>
                <div class="column" >
                    <table style="">
                        <thead>
                        </thead>
                        <tbody>
                            <tr>
                            <tr> <th><%= rs.getString(1)%></th></tr>

                        <td ><%
                            Blob imageBlob = rs.getBlob("poster");
                            byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                            out.write("<img style='width:140px;height:235px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");

                            %>
                        </td>
                        <tr><td><%= rs.getString(3)%></td><tr>
                            <td><%= rs.getString(2)%>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <%
                    }

                %>
            </div>
            <div id="lower">
                <label >
                Copyright @2023 &REG; Movie Lovers Entertainment.
                The content and images used on this site are copyright protected and copyrights vests with the respective owners. The usage of the content and images on this website is intended to promote the works and no endorsement of the artist shall be implied. Unauthorized use is prohibited and punishable by law.
                </label>
                <div class="logo">
                    <div class="line"><hr  ></div>
                       
                        <div class="line2"><hr></div>
                </div>
            </div>
        <!-- JavaScript to change the active image in the slide show -->
        <script>
            var slideIndex = 0;
            var slides = document.getElementsByClassName("slide-container")[0].getElementsByTagName("img");
            slides[0].classList.add("active");

            function showSlides() {
                for (var i = 0; i < slides.length; i++) {
                    slides[i].classList.remove("active");
                }
                slideIndex++;
                if (slideIndex >= slides.length) {
                    slideIndex = 0;
                }
                slides[slideIndex].classList.add("active");
                setTimeout(showSlides, 3000);
            }
            showSlides();

        </script>
    </body>
</html>
