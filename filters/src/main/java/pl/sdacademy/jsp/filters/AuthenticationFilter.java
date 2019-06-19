package pl.sdacademy.jsp.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(
        filterName = "authentication",
        urlPatterns = {"/index.jsp", "/hello"}
)
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        PrintWriter writer = response.getWriter();
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        Object logged = httpServletRequest.getSession().getAttribute("logged");
        if (logged == null) {
            httpServletResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);
            writer.println("Authorization required");
            return;
        }
        chain.doFilter(request, response);
    }
}
