package sumyearrelization.sumyear;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sumyearrelization.Settings.DataBaseHandler;

@WebServlet(name = "mainServlet", urlPatterns = {"/mainServlet"})
public class MainServlet extends HttpServlet {
    private DataBaseHandler dataBaseHandler;

    public void init() {
        dataBaseHandler = new DataBaseHandler();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String yearValue = request.getParameter("yearValue");
        String sumValue = request.getParameter("sumValue");

        if (yearValue == null || sumValue == null || yearValue.isEmpty() || sumValue.isEmpty()) {
            response.sendRedirect("Error.jsp");
            return;
        }
        else {
            Connection dbCon = dataBaseHandler.getDbConnection();
            if (dbCon != null) {
                try {
                    String selectQuery = "select * from SumYear where sum > " + sumValue + " and year = " + yearValue;
                    Statement statement = dbCon.createStatement();
                    ResultSet resultSet = statement.executeQuery(selectQuery);
                    List<String> resultList = new ArrayList<>();
                    float totalSum = 0;
                    while (resultSet.next()) {
                        String column1 = resultSet.getString("sum");
                        String column2 = resultSet.getString("year");
                        String resultString = column1 + " - " + column2;
                        resultList.add(resultString);
                        float currentSum = resultSet.getFloat("sum");
                        totalSum += currentSum;
                    }
                    if (totalSum <= 0) {
                        response.sendRedirect("Error.jsp");
                        return;
                    }
                    request.setAttribute("resultList", resultList);
                    request.setAttribute("totalSum", totalSum);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
            } else {
                System.out.println("Возникла ошибка при подключении к базе данных. Подключение отсутствует");
            }
        }
    }

    public void destroy() {
    }
}