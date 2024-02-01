
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String DB_URL = "jdbc:oracle:thin:@username:1521:ORCLE";
    private static final String USER = "DBName";
    private static final String PASS = "DBPass";

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // get form data
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            HttpSession sess = request.getSession(true);
            sess.setAttribute("name", name);
            sess.setAttribute("phone", phone);
            sess.setAttribute("dob", dob);
            sess.setAttribute("email", email);
            sess.setAttribute("password", password);
            sess.setAttribute("gender", gender);
            System.out.println(name);

            // insert data into database
            Connection conn = null;
            PreparedStatement stmt = null;

            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.prepareStatement("Select * from users where email='" + email + "'");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                response.sendRedirect("http://localhost:8080/TestProject/Pages/HTML%20Pages/Register.jsp?error=invalid");
            } else {
                try {
                    // Get the OTP from your database
                    Random random = new Random();

                    // generate a random number between 100000 and 999999
                    String otp =String.valueOf( random.nextInt(900000) + 100000);
                    

// Set up the email session
                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");

                    Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("yourbrandemailid", "yourbrandpassword");
                        }
                    });

// Set up the email message
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress("yourbrandemailid"));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                    message.setSubject("Verify Your Account");
                    message.setText("Good Morning, "+name+".\n Welcome to Movie Lovers! \n Your One-Time Password is " + otp+"\n Keep Watching! Keep Playing.");

// Send the email
                    Transport transport = session.getTransport("smtp");
                    transport.connect("smtp.gmail.com", "yourbrandemailid", "yourbrandpassword");
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();
                    sess.setAttribute("otp", otp);
                    response.sendRedirect("http://localhost:8080/TestProject/Pages/HTML%20Pages/verify.jsp?email=" + email);
                } catch (MessagingException ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
//        } catch (SQLException | IOException | ClassNotFoundException | ParseException se) {
//            System.out.println(se.toString());
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
