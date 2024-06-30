package com.Servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "ServletRegister", value = "/ServletRegister")
public class ServletRegister extends HttpServlet {
    static Settings.DataBaseHandler handler = new Settings.DataBaseHandler();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userLogin = request.getParameter("userLogin");
        String userPassword = request.getParameter("userPassword");
        if (userLogin.length() == 0 && userPassword.length() == 0) {
            try {
                String select = "insert into UsernameInfo (Username, Password, RoleInSystem) values(?,?,Client);";
                PreparedStatement st = handler.getDbConnection().prepareStatement(select);
                st.setString(1, userLogin);
                st.setString(2, userPassword);
                ResultSet resultSet = st.executeQuery();
                response.sendRedirect("Welcome.jsp");
            }
            catch (SQLException e) {
                System.out.println("MySQL error in registration: " + e.getMessage());
            }
        }
        else if ( findUserInDB(userLogin) == true) {
            request.setAttribute("registrationErrorMessage", "Имя уже занято. Выберите другое");
        }
        else {
            request.setAttribute("registrationErrorMessage", "Не все поля заполнены!");
        }
    }

    public static boolean findUserInDB(String username) {
        boolean rowExists = false;
        try {
            String select = "SELECT * FROM UsernameInfo WHERE Username = ?";
            PreparedStatement st = handler.getDbConnection().prepareStatement(select);
            st.setString(1, username);
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
