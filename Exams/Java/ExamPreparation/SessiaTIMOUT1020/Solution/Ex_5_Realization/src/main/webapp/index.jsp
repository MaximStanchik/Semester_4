<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Sign in</title>
</head>
<body>
<form action="mainServlet" method="get">
  <input type="text" name="login"></input>
  <button type = "submit">Sign in</button>
</form>
<p>Your role in system: ${userRole}</p>
<p>Session ID: ${sessionId}</p>
<p>Session creation time: ${sessionCreationTime}</p>
<p>Login URL: ${loginURL}</p>
</body>
</html>