<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div style="display: flex; flex-direction: column">
    <p>${loginErrorMessage}</p>
    <form>
        <p><input type="text" name="userLogin" placeholder="Login" size="18" maxlength="30" required/></p>
        <p><input type="password" name="userPassword" placeholder="Password" size="18" maxlength="30" required/></p>
        <p>
            <button action="Login" type="submit" name="action" value="login">Login to account</button>
        </p>
    </form>
</div>
<%@ include file="footer.jsp"%>