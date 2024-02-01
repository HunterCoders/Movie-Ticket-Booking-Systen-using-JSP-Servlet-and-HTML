<!DOCTYPE html>
<html>
    <head>
        <title>Choose City</title>
        <link rel="stylesheet" type="text/css" href="..\CSS\BookTicketCSS.css">
        <!--<script type="text/javascript" src="..\JS\BookTicketJS.js"></script>-->
    </head>
    <body>
        <div class="img">
            <a href="http://localhost:8080/TestProject/Pages/HTML%20Pages/Homepage.jsp" >
                <img id="logo" src="..\..\Images\Logo.png" >
            </a>
        </div>
        <div class="background">
            <div class="shape"></div>
            <div class="shape"></div>
        </div>
        <div class="container">
            <h1>Select your city</h1>
            <div class="city-buttons">
                <%
                    if (session.getAttribute("loggedInUser") != null) {%>
                <form action="http://localhost:8080/TestProject/Pages/HTML%20Pages/SelectMov.jsp" method="post">
                    <button name="city" value="kolkata">Kolkata</button>
                    <button name="city" value="chennai">Chennai</button>
                    <button name="city" value="newdelhi">New Delhi</button>
                    <button name="city" value="hyderabad">Hyderabad</button>
                    <button name="city" value="pune">Pune</button>
                </form>

                <% } else {
                        response.sendRedirect("http://localhost:8080/TestProject/Pages/HTML%20Pages/Login.jsp?error=login");
                    }
                %>


            </div>

        </div>
    </body>
</html>
