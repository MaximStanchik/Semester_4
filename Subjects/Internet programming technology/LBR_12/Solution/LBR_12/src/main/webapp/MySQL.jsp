<%@ page import="java.sql.Connection" %>
<%@ page import="Settings.DataBaseHandler" %><%--
  Created by IntelliJ IDEA.
  User: Maxim Stanchik
  Date: 17.05.2024
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MySQL</title>
</head>
<body>
<%
  DataBaseHandler handler = new DataBaseHandler();
  Connection connection = handler.getDbConnection();
  request.setAttribute("dbConnection", connection);
%>

<sql:query dataSource="${dbConnection}" var="result">
  SELECT * FROM UsernameInfo
</sql:query>

<table>
  <thead>
  <tr>
    <th>Username</th>
    <th>Password</th>
    <th>RoleInSystem</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="row" items="${result.rows}">
    <tr>
      <td>${row.Username}</td>
      <td>${row.Password}</td>
      <td>${row.RoleInSystem}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
