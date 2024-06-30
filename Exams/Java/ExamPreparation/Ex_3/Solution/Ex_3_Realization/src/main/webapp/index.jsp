<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<form action="ProcessingInputValue">
<p>Enter the contract number and press the button</p>
<input type="text" name="contractNumber"></input>
<button type="submit">Check</button>
</form>
<p>Result of checking: ${documentValidity}</p>
</body>
</html>