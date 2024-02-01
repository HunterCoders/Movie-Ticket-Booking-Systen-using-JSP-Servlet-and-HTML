<%-- 
    Document   : verifyForgot
    Created on : 3 May, 2023, 1:45:39 AM
    Author     : DBName Sinha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <title>Verify OTP</title>

        <script>
            function click()
            {
            <% int c = 0;
                if (request.getParameter("again") == null) {
                    c = 15;
                } else {
                    c = Integer.valueOf(request.getSession(false).getAttribute("count").toString());
                }
                request.getSession(false).setAttribute("count", c + 15);%>
            }

        </script>

        <script>
            var count = <%=c%>; // Set the time in seconds
            <%if (c < 45) {%>
            var timer = setInterval(function () {
                count--;
                if (count <= 0) {
                    clearInterval(timer);
                    document.getElementById("res").disabled = false;

                }
                document.getElementById("timer").innerHTML = "Time remaining: " + count + " seconds";
            }, 1000);
            <%} else {%>
            document.getElementById("err").innerHTML = "Retries Exhausted";
            <%}%>
        </script>
        <style>
            body{
                background:linear-gradient(130deg,#0e0f28,#000428);
                height: 1000px;
                overflow-y: hidden;
                overflow-x: hidden;
                width: 100%;
            }
            h1
            {
                text-shadow:1px 1px 10px black;
                margin: auto;
                display: block;
                margin-bottom: 25px;
                padding:2px;
                width:
                    300px;
                border-radius: 10px;
                background: linear-gradient(150deg,blueviolet,red);
            }
            #form
            {
                font-family: 'Poppins',sans-serif;
                box-shadow: 1px 5px 10px rgba(0,0,0,0.5);
                margin:100px;
                padding: 25px;
                color:white;
                border-radius: 10px;
                max-width: 500px;
                max-height: 500px;
                margin-left:Auto;
                margin-right: auto;
                text-align: center;
                position: relative;
                align-items: center;
                justify-content: center;
                background: rgba(0,0,0,0.2);
                backdrop-filter:blur(10px);
                border:0.2px solid gray;
            }
            input[type=text]{
                color:White;
                background-color: rgba(255,255,255,0.02);
                box-shadow: 2px 5px 10px rgba(255,255,255,0.1);
                border:1px solid purple;
                border-radius: 5px;
                margin:10px;
                padding:10px;
                width:90%;
                height:25px;
                font-size: 15px;
                border-bottom-width: 2px;
            }
            input[type=text]:active,:focus{
                border:1px solid blue;
            }
            input[type=submit]
            {
                box-shadow: 2px 2px 15px rgba(0,0,0,0.5);
                border:none;
                margin-top: 4px;
                width: 120px;
                background: linear-gradient(135deg, red,  purple);
                color: #ffffff;
                padding: 15px 0;
                font-size: 18px;
                font-weight: 400;
                border-radius: 5px;
                cursor: pointer;
                transition: .5s ease;
            }
            ::placeholder
            {
                color:lightgray;
            }
            label
            {
                display: block;
                font-size: 20px;
            }
            .error-message
            {
                display: block;
                color:red;
            }
            #res
            {
                margin: auto;
                box-shadow: 2px 2px 15px rgba(0,0,0,0.5);
                text-shadow:1px 1px 10px rgba(0,0,0,0.5);
                border:none;
                margin-top: 4px;
                width: 200px;
                background: linear-gradient(135deg, yellowgreen, green);
                color: #000;
                padding: 5px 0;
                font-size: 25px;
                font-weight: 400;
                border-radius: 5px;
                cursor: pointer;
                transition: .5s ease;
            }
            #res:disabled{
                cursor: not-allowed;
                background: gray;
            }
        </style>
        <meta charset="UTF-8">
        <title>Verify OTP</title>
    </head>
    <body>

        <form action="verifyForgotOTP.jsp" id="form" method="post" onsubmit="return validate()">
            <h1>Verify OTP</h1>
            <label for="otp">Enter the OTP sent to your email:</label><br>
            <input type="text" id="otp" name="otp" placeholder="Enter the OTP" onblur="validate()"><br>
            <br>
            <span id="err" style="color:red;font-size: 20px;display: block"></span>
            <%
                String error = request.getParameter("status");
                if (error != null && error.equals("invalid")) {
                    out.println("<span class=\"error-message\" id=\"er\">Invalid OTP. Retry</span>");
                }
            %>

            <input type="submit" id="ver" value="Verify" >
        </form>
        <form action="http://localhost:8080/TestProject/ResendForgotOTP" method="post" style="text-align:center">
            <p id="timer" style="color:red;font-size: 25px"></p>
            <input style="margin-left: 30px" type="submit" id="res" value="Resend OTP" disabled onclick="click()">
        </form>
        <script>
            function validate()
            {
                if (document.getElementById("otp").value === "") {
                    document.getElementById("err").innerHTML = "Enter The OTP";
                    return false;
                } else
                {
                    document.getElementById("err").innerHTML = "";
                    return true;
                }
            }
        </script>
    </body>

</html>