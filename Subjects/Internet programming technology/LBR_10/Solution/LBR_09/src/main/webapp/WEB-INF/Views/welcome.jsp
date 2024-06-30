<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%@ include file="header.jsp" %>

<h1>Welcome to LBR_10!</h1>
<h2>Ссылки на регистрацию и авторизацию:</h2>
<li><a href="register.jsp">Регистрация</a></li>
<li><a href="index.jsp">Авторизация</a></li>

<div class="table">
    <table>
        <tr>
            <th>Username</th>
            <th>Password</th>
            <th>RoleInSystem</th>
        </tr>
        <c:forEach var="row" items="${resultSet}">
            <tr>
                <td><c:out value="${row.Username}" /></td>
                <td><c:out value="${row.Password}" /></td>
                <td><c:out value="${row.RoleInSystem}" /></td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@ include file ="footer.jsp" %>