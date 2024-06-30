package com.example.ex1;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet(name = "Servlet2", value = "/Servlet2")
public class Servlet2 extends HttpServlet {

    static {
        new DOMConfigurator().doConfigure("D:/studing/4_semestr/internet_programming_technology/Exam/Tasks from exam/Ex_1/Ex1/src/main/java/com/example/ex1/logINFO/log4j.xml", LogManager.getLoggerRepository());
    }

    private static final Logger LOG = Logger.getLogger(Servlet2.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOG.info("Start Servlet 2");
        int sum = 0;
        DataBaseConnection connectionString = new DataBaseConnection();
        try (Connection connection = connectionString.GetConnectionString()) {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

                String sql = "update users set sum = sum - 100 where login like ? AND sum >= 100";

                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
                        statement.setString(1, GlobalInfo.type);
                        int c = statement.executeUpdate();
                        if(c==0){
                            ServletContext servletContext = getServletContext();
                            RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/error.jsp");
                            request.setAttribute("name", "Недостаточно средств");
                            requestDispatcher.forward(request, response);
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }


            String sql2 = "select * from users where login like ?";
            PreparedStatement pstmt = connection.prepareStatement(sql2);
            pstmt.setString(1, GlobalInfo.type);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    sum = (rs.getInt("sum"));
                }
                rs.close();
                pstmt.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }

            LocalDate date = LocalDate.now();
            LocalTime time = LocalTime.now();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Результат отправки формы входа</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Добро пожаловать!</h1>");
            out.println("<p>После вычета 100 руб, текущий счёт:"+ sum +"<p>");
            out.println("<p>Текущее дата: " + date + "</p>");
            out.println("<p>Текущее время: " + time + "</p>");
            out.println("<p>ID сессии:"+ request.getSession().getId() +"<p>");
            out.println("<p><a href=\"action.jsp\">Вернуться назад</a></p>");
            out.println("</body>");
            out.println("</html>");
        }
            @Override
            public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}