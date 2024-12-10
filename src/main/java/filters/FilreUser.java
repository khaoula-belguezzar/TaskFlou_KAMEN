package filters;

import jakarta.servlet.Filter;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebFilter(filterName = "FilreUser", servletNames = {"UserHomeServlet","",""})

public class FilreUser implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession(false);
        if (session == null || session.getAttribute("userRole") == null) {
            System.out.println("not session");
            System.out.println(session);
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login.jsp");
            return;
        }

        String userRole = (String) session.getAttribute("userRole");

        if ("User".equals(userRole)) {
            System.out.println("session filter");
            System.out.println(session);
            chain.doFilter(request, response);
        } else {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/unauthorized.jsp");
        }
    }

}
