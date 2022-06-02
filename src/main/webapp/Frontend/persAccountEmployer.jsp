<!--<%--
  Created by IntelliJ IDEA.
  User: Ilya
  Date: 16.05.2022
  Time: 16:36
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
        <li><a href="persAccountEmployer.jsp">Личный кабинет</a></li>
    </ul>
</div>
<div class="empl-form-head-container">
    Личный кабинет
    <hr>
</div>
<div class="empl-form-data-container">
    <div class="sidenav" id="sidenav">
        <button onclick="change1()">Личные данные</button>
        <button onclick="change2()">Редактировать данные</button>
        <button onclick="change3()">Мои вакансии</button>
        <button onclick="change4()">Новая вакансия</button>
        <script>
            function change1() {
                var element1 = document.getElementById("emp-form-1");
                element1.style.display = "flex";
                var element2 = document.getElementById("emp-form-2");
                element2.style.display = "none";
                var element3 = document.getElementById("emp-form-3");
                element3.style.display = "none";
                var element4 = document.getElementById("emp-form-4");
                element4.style.display = "none";
            }
            function change2() {
                var element1 = document.getElementById("emp-form-1");
                element1.style.display = "none";
                var element2 = document.getElementById("emp-form-2");
                element2.style.display = "flex";
                var element3 = document.getElementById("emp-form-3");
                element3.style.display = "none";
                var element4 = document.getElementById("emp-form-4");
                element4.style.display = "none";
            }
            function change3() {
                var element1 = document.getElementById("emp-form-1");
                element1.style.display = "none";
                var element2 = document.getElementById("emp-form-2");
                element2.style.display = "none";
                var element3 = document.getElementById("emp-form-3");
                element3.style.display = "flex";
                var element4 = document.getElementById("emp-form-4");
                element4.style.display = "none";
            }
            function change4() {
                var element1 = document.getElementById("emp-form-1");
                element1.style.display = "none";
                var element2 = document.getElementById("emp-form-2");
                element2.style.display = "none";
                var element3 = document.getElementById("emp-form-3");
                element3.style.display = "none";
                var element4 = document.getElementById("emp-form-4");
                element4.style.display = "flex";
            }
        </script>
    </div>
    <div class="empl-form-data-photo-box" id="emp-form-1">
        <div class="empl-form-data-box">
            Личные данные:<br>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Ф.И.О.:<span>Гусев Илья Александрович<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Дата рождения:<span>05.05.2001<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Email:<span>gjjnkmnm@gmail.com<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Номер телефона:<span>88005553535<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Место работы:<span>Самарский Университет<br></span></div>
            </div>
        </div>
        <div class="photo">
            <img src="https://catherineasquithgallery.com/uploads/posts/2021-02/1612447191_70-p-chelovechek-na-serom-fone-82.jpg"
                 style="width: 80%;height: 30%;">
        </div>
    </div>
    <div class="empl-form-change-data" id="emp-form-2">
        <div class ="empl-form-data-box">
            Изменить ФИО:<br><input type="text" value="Гусев Илья Александрович"><br>
            Изменить дату рождения:<br><input type="date" value="2001-05-05"><br>
            Изменить Email:<br><input type="text" value="gjjnkmnm@gmail.com"><br>
            Изменить номер телефона:<br><input type="text" value="88005553535"><br>
            Изменить место работы:<br><input type="text" value="Самарский Университет"><br>
            Изменить изображение:<br><input type="file"><br>
            <button class="employer-buttons">Сохранить изменения</button><br>
            Смена пароля:<br>
            Введите старый пароль:<br><input
                type="password" value=""><br>
            Введите новый пароль:<br><input type="password" value=""><br>
            <button class="employer-buttons">Сменить пароль</button><br>
        </div>
    </div>
    <div class="empl-form-change-data" id="emp-form-3">
        <div class ="empl-form-data-box">
            Размещено вакансий на данное время:<span id="VacancyesCount">1</span>
            <div class="vacancyes-form-vacancyes-box">
                <div class="vacancyes-form-vacancyes-box-vacancy">
                    Вакансия:<a>Java Developer Junior</a><br>
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
                    Статус вакансии:<span>Одобрена</span><br>
                    Отклики:<a href="otclick-form.html" target="_blank">5</a>
                </div>
                    <button class="vacancyes-form-vacancyes-box" onclick="window.location.href='vacancy-red-form.html'">Редактировать вакансию</button>
            </div>
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
                    Статус вакансии:<span>Одобрена</span><br>
                    Отклики:<a>5</a>
                </div>
                <button class="vacancyes-form-vacancyes-box">Редактировать вакансию</button>
            </div>
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
                    Статус вакансии:<span>Одобрена</span><br>
                    Отклики:<a>5</a>
                </div>
                <button class="vacancyes-form-vacancyes-box" onclick= " window.location.host= 'vacancy-red-form.html' " target="_blank">Редактировать вакансию</button>
            </div>
        </div>
    </div>
    <div class="empl-form-change-data" id="emp-form-4">
        <div class ="empl-form-data-box">
            Название вакансии:
            <input type="text" value=""><br>
            Категория:
            <select size="0" class="vacancyes-search-field-select">
                <option>Выберите категорию</option>
                <option>IT</option>
                <option>Быстрое питание</option>
            </select><br>
            Город:<br><input type="text" value=""><br>
            Компания:<br><input type="text" value=""><br>
            График работы:
            <select size="0" class="vacancyes-search-field-select">
                <option>Выберите график</option>
                <option>Полный день</option>
                <option>Сменный график</option>
                <option>Удалённая работа</option>
            </select><br>
            Заработная плата (рубли):<br><input type="text" value=""><br>
            Описание вакансии:<br>
            <textarea></textarea>
            <button class="employer-buttons">Разместить вакансию</button><br>
        </div>
    </div>
</div>
</body>
</html>
