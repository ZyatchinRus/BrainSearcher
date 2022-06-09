<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>BrainSearcher</title>
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
<div class="photoMain1">
        <div class="form">
            <h1>Вход</h1>
            <form method="post">
                <div class ="input-form">
                    <input type = "text" required placeholder = "Логин" name="login">
                </div>
                <div class ="input-form">
                    <input type = "password" required placeholder = "Пароль" name="password">
                </div>
                <div class = "form-reg"><button type = submit name = "entry">Войти</button></div>
            </form>
            </br>
            <div class = "btn">
                <input type="checkbox" id="mod">
                <label class="btn" for="mod">Зарегистрироваться</label>
                </br>
                <form class="popup">
                    </br>
                    <a href="employerRegistration.jsp" class = "btn">
                        Работодатель
                    </a>
                    <a href="clientRegistration.jsp" class="btn">
                        Студент
                    </a>
                    <label class ="close" for="mod">+</label>
                </form>
            </div>
        </div>
</div>
</body>
</html>