<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<div class="registration" style="display: flex; flex-direction: column">
  <form action="Ex_3">
    <p><input type="text" name="userLogin" placeholder="Login" size="18" maxlength="30" required/></p>
    <p><input type="password" name="userPassword" placeholder="Password" size="18" maxlength="30" required/></p>
    <p>
      <button type="submit" name="action" value="login">Send</button>
    </p>
  </form>
</div>
</body>
</html>
