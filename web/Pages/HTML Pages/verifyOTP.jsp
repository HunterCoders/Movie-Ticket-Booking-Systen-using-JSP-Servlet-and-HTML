<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>OTP Verification</title>
</head>
<body>
	<h1>OTP Verification</h1>
        <form action="" method="post">
	<%
		// Get the OTP value from the request parameters
		String enteredOtp = request.getParameter("otp");

		// Get the OTP value from the session
		String generatedOtp = (String) session.getAttribute("otp");

		// Compare the entered OTP with the generated OTP
		if (enteredOtp != null && generatedOtp != null && enteredOtp.equals(generatedOtp)) {
			// If the OTP is verified, display a success message
			response.sendRedirect("http://localhost:8080/TestProject/Pages/HTML%20Pages/UploadToDb.jsp");
		} else {
			// If the OTP is not verified, display an error message
			response.sendRedirect("http://localhost:8080/TestProject/Pages/HTML%20Pages/verify.jsp?status=invalid");;
		}
	%>
        </form>
</body>
</html>
