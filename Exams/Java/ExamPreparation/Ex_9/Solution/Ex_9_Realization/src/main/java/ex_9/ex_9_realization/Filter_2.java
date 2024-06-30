package ex_9.ex_9_realization;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter(filterName = "Filter_2")
public class Filter_2 {
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

    }
    public void destroy() {

    }
}
