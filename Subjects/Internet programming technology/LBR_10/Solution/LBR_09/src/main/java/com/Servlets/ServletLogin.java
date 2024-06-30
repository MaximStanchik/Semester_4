package com.Servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "ServletLogin", value = "/ServletLogin")
public class ServletLogin extends HttpServlet {
    static Settings.DataBaseHandler handler = new Settings.DataBaseHandler();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userLogin = request.getParameter("userLogin");
        String userPassword = request.getParameter("userPassword");

        boolean userExists = findUserInDB(userLogin, userPassword);

        if (userExists == true) {
            request.setAttribute("loginErrorMessage", "Неверный логин и/или пароль!");
        }
        else {
            response.sendRedirect("Welcome.jsp");
        }
    }

    public static boolean findUserInDB(String username, String userpassword) {
        boolean rowExists = false;
        try {
            String select = "SELECT * FROM UsernameInfo WHERE Username = ? AND Password = ?";
            PreparedStatement st = handler.getDbConnection().prepareStatement(select);
            st.setString(1, username);
            st.setString(2, userpassword);
            ResultSet resultSet = st.executeQuery();
            if (resultSet.next()) {
                rowExists = true;
            } else {
                rowExists = false;
            }
        }
        catch (SQLException e) {
            System.out.println("MySQL error in login: " + e.getMessage());
        }
        return rowExists;
    }
}
