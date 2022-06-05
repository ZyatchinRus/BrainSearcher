<%@ page contentType="text/html;charset=UTF-8" language="java" %>-->
<html>

<head>
    <title>Редактирование вакансии</title>
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
            <li><a href="vacancyes-form.html">Вакансии</a></li>
            <li><a href="">Личный кабинет</a></li>
        </ul>
    </div>
    <div class="empl-form-head-container">
        Редактирование вакансии
        <hr>
    </div>
    
        <div class="vacancyes-form-vacancyes-box">
            <div class ="vacancy-red-form">
                Вакансия:<br><input type="text" value=""><br>
                Компания:<br><input type="text" value=""><br>
                Категория:<br>
                <select size="0" class="vacancy-red-form">
                    <option>Выберите категорию</option>
                    <option>IT</option>
                    <option>Быстрое питание</option>
                </select><br>
                Город:<br><input type="text" value=""><br>
                График работы:<br>
                <select size="0" class="vacancy-red-form">
                    <option>Выберите график</option>
                    <option>Полный день</option>
                    <option>Сменный график</option>
                    <option>Удалённая работа</option>
                </select><br>
                Заработная плата(рубли/месяц):<br><input type="text" value=""><br>
                Описание вакансии:<br>
                <textarea></textarea>
                    <button class="vacancyes-form-vacancyes-box" onclick="window.location.host= 'persAccountEmployer.html'" >Сохранить изменения</button> 
            </div>
            </div>     
    </div>
</body>
</html>