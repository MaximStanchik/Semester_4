package coockiesreal.coockiesrealization;

import jakarta.servlet.ServletException;

import java.io.FileReader;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

@WebServlet(name = "mainServlet", urlPatterns = {"/mainServlet"})
public class MainServlet extends HttpServlet {
    @Override
    public void init() {
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String filePath = "D:/User/Desktop/StudyAtBSTU/Course_2/Semester_4/Exams/Java/ExamPreparation/CookieGroupsAndCources/Solution/CoockiesRealization/src/main/java/coockiesreal/coockiesrealization/file.json";
        JSONTokener tokener = new JSONTokener(new FileReader(filePath));
        JSONObject json = new JSONObject(tokener);

        JSONArray cardArray = json.getJSONObject("cards").getJSONArray("card");

        StringBuilder tableHtml = new StringBuilder();
        tableHtml.append("<table>");
        tableHtml.append("<tr><th>NAME</th><th>SUM</th></tr>");

        for (int i = 0; i < cardArray.length(); i++) {
            JSONObject card = cardArray.getJSONObject(i);
            String name = card.getString("name");
            String sum = card.getString("sum");

            tableHtml.append("<tr>");
            tableHtml.append("<td>").append(name).append("</td>");
            tableHtml.append("<td>").append(sum).append("</td>");
            tableHtml.append("</tr>");
        }

        tableHtml.append("</table>");

        request.setAttribute("tableHtml", tableHtml.toString());

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    public void destroy() {
    }
}
