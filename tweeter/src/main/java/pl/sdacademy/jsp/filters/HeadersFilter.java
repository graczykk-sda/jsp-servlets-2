package pl.sdacademy.jsp.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(
        filterName = "headers-filter",
        urlPatterns = "/*"
)
public class HeadersFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setHeader("Pragma", "no-cache");
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }
}
