<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <title>Verify OTP</title>

        <script>
</body>
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
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function () {
            };</script> 

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
            <%}%>

            if (count > 45)
                document.getElementById("etimer").style.visibility = "visible";
        </script>
        <style>
            body{
                background:linear-gradient(130deg,#0e0f28,#000428);
                height: 1000px;
                overflow-y: hidden;
                overflow-x: hidden;
                width: 100%;
            }
            .sub
            {
                font-family: 'Poppins',sans-serif;
                box-shadow: 1px 5px 10px rgba(0,0,0,0.5);
                margin:100px;
                padding: 25px;
                color:white;
                border-radius: 10px;
                max-width: 400px;
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
            .sub input[type=submit]
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
            h1
            {
                text-shadow:1px 1px 10px black;
                margin: auto;
                display: block;
                margin-bottom: 25px;
                padding:2px;
                width:200px;
                border-radius: 10px;
                background: linear-gradient(150deg,blueviolet,red);
            }
            .resend
            {
                width:200px;
            }
            #res
            {
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

        <form action="verifyOTP.jsp" method="post" onsubmit="return validate()" class="sub">
            <h1>Verify OTP</h1>
            <label for="otp">Enter the OTP sent to your email:</label>
            <%=request.getSession(false).getAttribute("email")%>
            <br>
            <input type="text" id="otp" name="otp" placeholder="Enter The OTP" onblur="validate()" onkeydown="document.getElementById('err').innerHTML = ''"><br>
            <span id="err" style="color:red;font-size: 20px;"></span>
            <br>

            <%
                String error = request.getParameter("status");
                if (error != null && error.equals("invalid")) {
                    out.println("<span class=\"error-message\" id=\"er\">Invalid OTP. Retry</span>");
                }
            %>
            <br>

            <input type="submit" value="Verify">
        </form>
        <div class=resend" style="width:100%">
            <form action="http://localhost:8080/TestProject/ResendOTP" method="post" style="text-align:center">
                <p id="timer" style="color:red;font-size: 25px"></p>
                <span id="etimer" style="color:red;font-size: 25px" hidden></span>
                <br>
                <input id="res" type="submit"  value="Resend OTP" disabled onclick="click()" >
            </form>
        </div>

</html>
