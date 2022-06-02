
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
            <li><a href="responseInformation.jsp">Главная</a></li>
            <li><a href="">Вакансии</a></li>
            <li><a href="">Личный кабинет</a></li>
        </ul>
    </div>
    <div class="empl-form-head-container">
        Личный кабинет
        <hr>
    </div>
    <div class="empl-form-data-container">
        <aside>

            <div class="sidenav">
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
        </aside>
        
        <div class="empl-form-data-photo-box" id="emp-form-1">
            <div class="empl-form-data-box">
                Личные данные:<br>
                <div class="empl-form-data-point">
                    <div class="empl-form-data-point-name">Ф.И.О.:<span><br></span></div>
                </div>
                <div class="empl-form-data-point">
                    <div class="empl-form-data-point-name">Дата рождения:<span><br></span></div>
                </div>
                <div class="empl-form-data-point">
                    <div class="empl-form-data-point-name">Email:<span><br></span></div>
                </div>
                <div class="empl-form-data-point">
                    <div class="empl-form-data-point-name">Номер телефона:<span><br></span></div>
                </div>
                <div class="empl-form-data-point">
                    <div class="empl-form-data-point-name">Место учёбы:<span><br></span></div>
                </div>
                <div class="empl-form-data-point">
                    <div class="empl-form-data-point-name">Место учёбы:<span>Самарский университет</span></div>
                </div>
            </div>
            <div class="photo">
                <img src="https://catherineasquithgallery.com/uploads/posts/2021-02/1612447191_70-p-chelovechek-na-serom-fone-82.jpg"
                    style="width: 80%;height: 30%;">
            </div>
        </div>
        <div class="empl-form-change-data" id="emp-form-2">
            <div class ="empl-form-data-box">
                Изменить ФИО:<br><input type="text" value=""><br>
                Изменить дату рождения:<br><input type="date" value=""><br>
                Изменить Email:<br><input type="text" value=""><br>
                Изменить номер телефона:<br><input type="text" value=""><br>
                Изменить место работы:<br><input type="text" value=""><br>
                Изменить изображение:<br><input type="file"><br>
                <button class="employer-buttons">Сохранить изменения</button><br>
                Смена пароля:<br>
                Введите старый пароль:<br><input type="password" value=""><br>
                Введите новый пароль:<br><input type="password" value=""><br>
                <button class="employer-buttons">Сменить пароль</button><br>
            </div>
        </div>
        <div class="empl-form-change-data" id="emp-form-3">
            <div class ="empl-form-data-box">
                Размещено вакансий на данное время:<span id="VacancyesCount">1</span>
                <div class="vacancyes-form-vacancyes-box">
                    <div class="vacancyes-form-vacancyes-box-vacancy">
                        Вакансия:<a href=""></a><br>
                        Категория:<span></span><br>
                        Компания:<span></span><br>
                        Город:<span></span><br>
                        График работы:<span></span><br>
                        Заработная плата (рубли/месяц):<span></span><br>
                        О вакансии:<div class="vacancyes-form-vacancyes-box-vacancy-about-box"><span></span><br></div>
                        Статус вакансии:<span></span><br>
                        Отклики:<a>1</a>
                    </div>
                    <button class="vacancyes-form-vacancyes-box">Редактировать вакансию</button>
                </div> 
            </div>
        </div>
        <div class="empl-form-change-data" id="emp-form-4">
            <div class ="empl-form-data-box">
                Название вакансии:<br>
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