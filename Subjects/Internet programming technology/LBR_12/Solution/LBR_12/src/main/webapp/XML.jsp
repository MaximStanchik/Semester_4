<%--
  Created by IntelliJ IDEA.
  User: Maxim Stanchik
  Date: 17.05.2024
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>XML</title>
</head>
<body>
<x:parse var="doc">
  <c:import url="xml/books.xml"/>
</x:parse>

<x:forEach select="$doc/books/book" var="stud">
  title:
  <x:out select="$stud/title"/><br/>
  author:
  <x:out select="$stud/author"/><br/>
</x:forEach>
</body>
</html>
