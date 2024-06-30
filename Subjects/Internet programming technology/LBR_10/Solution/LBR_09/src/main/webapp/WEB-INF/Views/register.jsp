<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="wrapper" style="width: 300px; height: 250px">

    <div>
        <div class="name"><h2>Регистрация нового пользователя</h2></div>
    </div>

    <p>{registrationErrorMessage}</p>

    <form class="form" action="ServletRegister">
        <input type="text" placeholder="Введите логин" name="userLogin"size="18" maxlength="30" required>
        <input type="password" placeholder="Введите пароль" name="userPassword"size="18" maxlength="30" required>
        <input type="submit" class="btn" name="buttonRegister" value="Зарегистрироваться">
    </form>
</div>

<%@ include file ="footer.jsp" %>