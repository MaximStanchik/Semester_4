package ex_9.ex_9_realization;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "clientLogin", value = "/clientLogin")
public class clientLogin extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String phoneNumber = request.getParameter("phoneNumber");

    }

}