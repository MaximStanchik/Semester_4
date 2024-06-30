package com.example.ex_5_realization;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "/mainServlet", urlPatterns = {"/mainServlet"})
public class MainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String message;

    public void init() {

    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String loginValue = request.getParameter("login");
        HttpSession session = request.getSession();
        if (!loginValue.equals("user") && !loginValue.equals("admin")) {
            response.sendRedirect("Error.jsp");
            LoggerUtil.logError("Invalid login value: " + loginValue);
        }
        else {
            if (loginValue.equals("user")) {
                session.setMaxInactiveInterval(20);
            } else {
                session.setMaxInactiveInterval(10);
            }
            session.setAttribute("userRole", loginValue);
            session.setAttribute("sessionId", session.getId());
            session.setAttribute("sessionCreationTime", session.getCreationTime());
            session.setAttribute("loginURL", request.getRequestURL().toString());

            LoggerUtil.logInfo(loginValue, session.getId(), session.getCreationTime(), request.getRequestURL().toString());

            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    public void destroy() {
        LoggerUtil.closeLogger();
    }
}