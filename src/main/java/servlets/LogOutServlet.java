package servlets;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
@WebServlet(name = "LogOutServlet", value = "/LogOutServlet")
public class LogOutServlet extends HttpServlet   {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("tesssssssssssssssssssssst ");

        System.out.println("Session before invalidate: "+ request.getSession(false));
        // Invalidate the session.
        request.getSession(false).invalidate();

        // Print the session object in the console after invalidating the session.
        System.out.println("Session after invalidate: "+ request.getSession(false));
        response.sendRedirect("LoginServlet");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
