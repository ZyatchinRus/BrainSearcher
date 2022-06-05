
<%--
  Created by IntelliJ IDEA.
  User: Ilya
  Date: 15.05.2022
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>-->
<html>
<head>
    <title>Личный кабинет BS</title>
</head>

<body class="empl-form">
<link rel="stylesheet" type="text/css" href="styles.css">
<header>
    <div class="logotip">
        <img src="brainLogo.svg" height="50px" width="50px">
        <a href="\">BrainSearcher</a>
        <hr>
    </div>
</header>
<div class="main-menu">
    <ul>
        <li><a href="vacancyes-form.jsp">Вакансии</a></li>
        <li><a href="persAccountAdmin.jsp">Личный кабинет</a></li>
    </ul>
</div>
<div class="empl-form-head-container">
    Личный кабинет
    <hr>
</div>
<div class="empl-form-data-container">
    <div class="sidenav" id="sidenav">
        <button onclick="change1()">Личные данные</button>
        <button onclick="change2()">Непроверенные вакансии</button>
        <script>
            function change1() {
                var element1 = document.getElementById("emp-form-1");
                element1.style.display = "flex";
                var element2 = document.getElementById("emp-form-2");
                element2.style.display = "none";
            }
            function change2() {
                var element1 = document.getElementById("emp-form-1");
                element1.style.display = "none";
                var element2 = document.getElementById("emp-form-2");
                element2.style.display = "flex";
            }
        </script>
    </div>
    <div class="empl-form-data-photo-box" id="emp-form-1">
        <div class="empl-form-data-box">
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Ф.И.О: <span>Зятчин Руслан Дмитриевич<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Полномочия: <span>Администратор<br></span></div>
            </div>
            <hr>
            <div class="empl-form-data-point">
                Статистика:<br>
                <button class="vacancyes-form-vacancyes-box">Получить статистику</button>
            </div>
        </div>
        
    </div>
    <div class="empl-form-change-data" id="emp-form-2">
        <div class ="empl-form-data-box">
            Непроверенных вакансий на данное время:<span id="VacancyesCount">1</span>
            <div class="vacancyes-form-vacancyes-box">
                <div class="vacancyes-form-vacancyes-box-vacancy">
                    Вакансия:<a href="">Java Developer Junior</a><br>
                    Категория:<span>IT</span><br>
                    Компания:<span>Magenta Technology</span><br>
                    Город:<span>Самара</span><br>
                    График работы:<span>Удалённая работа</span><br>
                    Заработная плата (рубли/месяц):<span>50 000</span><br>
                    О вакансии:<div class="vacancyes-form-vacancyes-box-vacancy-about-box"><span>Разработка
    корпоративного программного обеспечения в сегментах B2B, B2G. Участие в проектной работе и
    реализации исследовательских решений.Знание Java Core, Spring (Data, Boot, Security),
    Database\SQL, MessageBrokers\RabbitMQ, Stream API, Rest API, SOLID. Знание принципов
    интеграции приложений...</span><br></div>
                    Статус вакансии:<span>На рассмотрении</span><br>
                </div>
                <button class="vacancyes-form-vacancyes-box">Одобрить вакансию</button>
                <button class="vacancyes-form-vacancyes-box">Отклонить вакансию</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
