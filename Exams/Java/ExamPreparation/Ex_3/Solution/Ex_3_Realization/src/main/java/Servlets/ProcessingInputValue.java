package Servlets;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "ProcessingInputValue", urlPatterns = {"/ProcessingInputValue"})
public class ProcessingInputValue extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userInputValue = request.getParameter("contractNumber");
        boolean isTheDocumentValid = checkUserValue(userInputValue);
        request.setAttribute("documentValidity", isTheDocumentValid);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private boolean checkUserValue(String userInputValue) {
        String contractNumberRegex = "[A-Za-z]{2}\\d{4,6}/20";
        return userInputValue.matches(contractNumberRegex);
    }
}
