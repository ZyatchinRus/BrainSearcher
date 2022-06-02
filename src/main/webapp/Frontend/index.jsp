<!--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>-->
<!DOCTYPE html>
<html>
<head>
    <title>BrainSearcher</title>
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
<div class="photoMain1">
        <div class="form">
            <h1>Вход</h1>
            <div class ="input-form">
                <input type = "text" placeholder = "Логин">
            </div>
            <div class ="input-form">
                <input type = "password" placeholder = "Пароль">
            </div>
            <div class ="input-form">
                <a href="#" class ="forget">Забыли пароль?</a>
            </div>
            </br>
            <div class = "btn">
                <input type="checkbox" id="mod">
                <label class="btn" for="mod">Зарегистрироваться</label>
                </br>
                <a href = "persAccountAdmin.jsp" class = "btn"></br>Войти</a>
                <form action="" class="popup">
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