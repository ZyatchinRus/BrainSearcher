<!--<%--
  Created by IntelliJ IDEA.
  User: Ilya
  Date: 14.05.2022
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>-->
<html>
<head>
    <title>Регистрация</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="styles.css">
<header>
    <div class="logotip">
        <img src="brainLogo.svg" height="50px" width="50px"/>
        <a href="\">BrainSearcher</a>
        <hr>
    </div>
</header>
<h1 href="\">Регистрация</h1>
<div class="form1">
    <div class ="input-form">
        <input type = "text" placeholder = "ФИО">
    </div>
    <div class ="input-form">
        <input type = "date" placeholder = "Дата Рождения">
    </div>
    <div class ="input-form">
        <input type = "text" placeholder = "Email">
    </div>
    <div class ="input-form">
        <input type = "text" placeholder = "Логин">
    </div>
    <div class ="input-form">
        <input type = "text" placeholder = "Пароль">
    </div>
    <div class ="input-form">
        <input type = "text" placeholder = "Номер телефона">
    </div>
    <div class ="input-form">
        <input type = "text" placeholder = "Место работы">
    </div>
    <div>
        <button onclick="window.location.href='persAccountEmployer.jsp'" class="buttonRegistration">Зарегистрироваться</button>
    </div>
</div>
</body>
</html>