<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Main page</title>
</head>
<body>
<form action="/clientLogin">
  <h3>Sign in</h3>
  <p>Username:</p> <input type="text" name = "username"></input>
  <p>Phone number:</p> <input type="text" name = "phoneNumber"></input>
  <br>
  <button type="submit">Send</button>
</form>
</body>
</html>