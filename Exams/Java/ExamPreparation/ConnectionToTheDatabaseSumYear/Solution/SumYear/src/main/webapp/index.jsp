<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Main page</title>
</head>
<body>
<h3>Welcome to the site!</h3>
<form action="mainServlet" method="get">
<p>Year:</p><input type="text" name="yearValue"></input>
<p>Sum:</p><input type="text" name="sumValue"></input>
<button type="submit">FIND</button>
</form>
<% List<String> resultList = (List<String>) request.getAttribute("resultList"); %>
<% if (resultList != null && !resultList.isEmpty()) { %>
<h4>Results:</h4>
<ul>
  <% for (String result : resultList) { %>
  <li><%= result %></li>
  <% } %>
</ul>
<% } %>
<p>Result sum: ${totalSum}</p>
</body>
</html>