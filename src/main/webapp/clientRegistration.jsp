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
<link rel="stylesheet" type="text/css" href="designe/styles.css">
<header>
    <div class="logotip">
        <img src="designe/brainLogo.svg" height="50px" width="50px"/>
        <a href="\">BrainSearcher</a>
        <hr>
    </div>
</header>
<h1 href="\">Регистрация</h1>
<div class="form1">
    <form method="post" action="/Client">
        <div class ="input-form">
            <input type = "text" required name="name" placeholder = "ФИО">
        </div>
        <div class ="input-form">
            <input type = "date" required name="date" placeholder = "Дата Рождения">
        </div>
        <div class ="input-form">
            <input type = "text"  name="email" placeholder = "Email">
        </div>
        <div class ="input-form">
            <input type = "text" required name="login" placeholder = "Логин">
        </div>
        <div class ="input-form">
            <input type = "password" required name="password" placeholder = "Пароль">
        </div>
        <div class ="input-form">
            <input type = "text" name="phone" placeholder = "Номер телефона">
        </div>
        <div class ="input-form">
            <input type = "text" name="address" placeholder = "Адрес">
        </div>
        <div class="input-form">
            <input type = "text" name = "stadyplace" placeholder = "Место учёбы">
        </div>
        <input name="formaction" value="regform" hidden>
        <div>
            <button type="submit" class="buttonRegistration">Зарегистрироваться</button>
        </div>
    </form>
</div>
</body>
</html>
