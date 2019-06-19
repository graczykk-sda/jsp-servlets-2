package pl.sdacademy.jsp.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(
        filterName = "login",
        urlPatterns = "/login"
)
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        PrintWriter writer = response.getWriter();
        writer.println("Login filter: before servlet<br/>");

        chain.doFilter(request, response);

        writer.println("Login filter: after servlet<br/>");

    }
}
