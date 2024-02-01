<%-- 
    Document   : SeeTick
    Created on : 18 May, 2023, 4:13:35 PM
    Author     : DBName Sinha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>See Customers </title>
    </head>
    <body>
        <h1></h1>
    </body>
</html>
<%-- 
    Document   : DeAllocate
    Created on : 12 Apr, 2023, 1:04:17 AM
    Author     : DBName Sinha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            /* Set styles for the table */
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
            }

            /* Set styles for the table header */
            .table-header {
                background-color: #333;
                color: #fff;
                height: 50px;
                line-height: 50px;
                padding: 0 20px;
                font-size: 18px;
            }

            /* Set styles for table rows */
            tr:hover {
                background-color: #f5f5f5;
            }

            /* Set styles for alternating table rows */
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            #home
            {
                background-color: #0069d9;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
                color: #ffffff;
            }
            #back
            {
                background-color: #4CAF50;;;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
                color: #ffffff;
            }
            #btn
            {
                text-align: center;
            }

        </style>
        <meta charset="UTF-8">
        <title>Movies</title>
        <link rel="stylesheet" type="text/css" href="">
        <script> function funSub()
            {
                if (confirm("Are you sure to remove this account???") === true)
                    return true;
                else
                    return false;
            }
        </script>
    </head>
    <body>
        <header>
            <h1>Ticket/Customers</h1>
        </header>

        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Seats</th>
                    <th>Movie Name</th>
                    <th>Booking City</th>
                    <th>Payment Mode</th>
                    <th>Ticket Id</th>
                    <th>Amount Paid</th>
                    <th>Customer Id</th>
                    <th>Show Time</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    // Connect to the database
                    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@LAPTOP-DBORBG65:1521:ORCLE", "DBName", "Sinha");

                    // Retrieve movies for the selected city from the database
                    String query = "SELECT * FROM customers order by tickid";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                    // Loop through the results and display each movie in a table row
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getLong(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><%= rs.getInt(8)%></td>
                    <td><%= rs.getString(9)%></td>
                    <td><%= rs.getInt(10)%></td>
                    <td><%= rs.getString(12)%></td>

                    </form>
                    </td>
                </tr>

                </form>
                <%
                    }

                    // Close the database connection
                    conn.close();
                %>

            </tbody>
        </table>
        <br>
        <div id="btn">

            <br>
            <form action="http://localhost:8080/TestProject/Pages/HTML%20Pages/DeAssign.jsp" method="post">
                <button id="back">Back</button>
            </form>
            <form action="http://localhost:8080/TestProject/Pages/HTML%20Pages/AdminOptions.jsp" method="post">
                <button id="home">Admin Home</button>
            </form>
        </div>
    </body>
</html>
