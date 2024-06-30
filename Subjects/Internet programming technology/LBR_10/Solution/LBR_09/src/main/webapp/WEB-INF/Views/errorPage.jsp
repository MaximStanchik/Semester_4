<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ErrorPage</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h2 style = "text-align: center">Информация об ошибках</h2>
<div>
    <h1>Error:</h1>>
    <p>Status code: ${errorStatus}</p>>
</div>
<%@ include file ="footer.jsp" %>