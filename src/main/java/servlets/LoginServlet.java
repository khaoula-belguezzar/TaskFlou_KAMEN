package servlets;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.AuthService;

import java.io.IOException;
@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet  extends HttpServlet{
    public final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("testtttttttttttttttttttt");

        System.out.println(request.getSession(false));
        response.sendRedirect("login.jsp");
    } //End of doPost()



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String password = request.getParameter("password");
        String email = request.getParameter("email");
        System.out.println(",assima's Home");

        try
        {
            String userValidate = authService.auhenticate(email,password,request);
            System.out.println( userValidate);

            if(userValidate.equals("Admin"))
            {
                System.out.println("Admin's Home");

                HttpSession session = request.getSession(); //Creating a session
                session.setAttribute("email", email); //setting session attribute\
                session.setAttribute("userRole", "Admin");
                request.setAttribute("email", email);
                System.out.println("loginservlet");
                System.out.println(session);
                response.sendRedirect("AdminServlet");
            }
            else if(userValidate.equals("User"))
            {
                System.out.println("User's Home");

                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(10*60);
                session.setAttribute("email", email);
                session.setAttribute("userRole", "User");
                response.sendRedirect("UserHomeServlet");
            }else if(userValidate.equals("Gestionner"))
            {
                System.out.println("Gestionner's Home");

                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(10*60);
                session.setAttribute("email", email);
                session.setAttribute("userRole", "Gestionner");
                response.sendRedirect("GestionnerHomeServlet");
            }
            else
            {
                System.out.println("Error message = "+userValidate);
                request.setAttribute("errMessage", userValidate);
                request.getRequestDispatcher("login.jsp").forward(request, response);

            }
        } catch (Exception e1)
        {
            e1.printStackTrace();
        }
    }
}
