<%-- 
    Document   : verifyForgotOTP
    Created on : 3 May, 2023, 1:54:15 AM
    Author     : DBName Sinha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <title>Verify OTP</title>

        <style>
            body{
                background:linear-gradient(130deg,#004e92,#000428);
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
            .form
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
            input[type=password]{
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
            input[type=password]:active,:focus{
                border:1px solid blue;
            }
            input[type=submit]
            {
                box-shadow: 2px 2px 15px rgba(0,0,0,0.5);
                border:none;
                margin-top: 4px;
                width: 150px;
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
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="form">
            <%

                // Get the OTP value from the request parameters
                String enteredOtp = request.getParameter("otp");

                // Get the OTP value from the session
                String generatedOtp = (String) session.getAttribute("otp");

                // Compare the entered OTP with the generated OTP
                if (enteredOtp != null && generatedOtp != null && enteredOtp.equals(generatedOtp)) {
                    // If the OTP is verified, display a success message
            %>
            <form action="http://localhost:8080/TestProject/ResetPass" method="post" onsubmit="return validate()">
                <label for="pass">Enter New Password</label>
                <input type="password" id="pass" name="pass" placeholder="Enter New Password" onblur="validatePass(this)">
                <label for="confpass">Confirm Your Password</label>
                <input type="password" id="confpass" name="confpass" placeholder="Confirm Your Password" onblur="validateConfirmPass(this)">
                <span id="passerr" style="color:red;font-size: 20px;display: block"></span>
                <span id="conferr" style="color:red;font-size: 20px;display: block"></span>
                <br>
                <input type="submit" value="Reset Password">
            </form>
            <%
                } else {
                    // If the OTP is not verified, display an error message
                    response.sendRedirect("http://localhost:8080/TestProject/Pages/HTML%20Pages/verifyForgot.jsp?status=invalid");
                }
            %>
        </div>
        <script>
            function validatePass(idval)
            {
                if (idval.value === "")
                {
                    document.getElementById("passerr").innerHTML = "Password is Empty";
                    return false;
                } else {
                    if (idval.value.match(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/))
                    {
                        document.getElementById("passerr").innerHTML = "";
                        return true;

                    } else
                    {
                        document.getElementById("passerr").innerHTML = "Password is Invalid";
                        document.getElementById("passerr").style = "color:orange";
                        return false;
                    }

                }
            }
            function validateConfirmPass(idval)
            {
                if (idval.value === "")
                {
                    document.getElementById("conferr").innerHTML = "Confirm Password is Empty";
                    return false;
                } else
                {
                    x = document.getElementById("pass").value;
                    if (idval.value.match(x))
                    {
                        document.getElementById("conferr").innerHTML = "";
                        return true;
                    } else
                    {
                        document.getElementById("conferr").innerHTML = "Passwords don't match";
                        return false;
                    }
                }
            }
                function validate()
                {
                    
                    b = validatePass(document.getElementById("pass"));
                    c = validateConfirmPass(document.getElementById("confpass"));
                    if ( b && c)
                    {
                        return true;
                    } else
                        return false;
                }
        </script>
    </body>
</html>
