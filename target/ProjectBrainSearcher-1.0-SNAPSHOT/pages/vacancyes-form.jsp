<%@ page contentType="text/html;charset=UTF-8" language="java" %>-->
<!DOCTYPE html>
<html>

<head>
    <title>Вакансии BS</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
    <header>
        <div class="logotip">
            <img src="brainLogo.svg" height="50px" width="50px" />
            <a href="\">BrainSearcher</a>
            <hr>
        </div>
    </header>
    <div class="main-menu">
        <ul>
            <li><a href="vacancyes-form.jsp">Вакансии</a></li>
            <li><a href="">Личный кабинет</a></li>
        </ul>
    </div>
    <div class="vacancyes-form">
        <div class="vacancyes-search-field">
            <h1 id="VacancyCount">Всего вакансий на данный момент: 0
            </h1>
            <p>Найдите подходящую прямо сейчас!
                <hr>
            <h1>Параметры поиска:
            </h1>
            <div class="vacancyes-search-field-flex">
                <div class="vacancyes-search-field-box">
                    Город:<input type="text">
                </div>
                <div class="vacancyes-search-field-box">
                    Компания:<input type="text">
                </div>
                <div class="vacancyes-search-field-box">
                    Категория вакансии:<br>
                    <select size="0" class="vacancyes-search-field-select">
                        <option>Выберите категорию</option>
                        <option>IT</option>
                        <option>Быстрое питание</option>
                    </select>
                </div>
                <div class="vacancyes-search-field-box">
                    График работы:<br>
                    <select size="0" class="vacancyes-search-field-select">
                        <option>Выберите график</option>
                        <option>Полный день</option>
                        <option>Сменный график</option>
                        <option>Удалённая работа</option>
                    </select>
                </div>
                <div class="vacancyes-search-field-box">
                    Заработная плата (рубли):<br>
                    <select size="0" class="vacancyes-search-field-select">
                        <option>Выберите зарплату</option>
                        <option>0-40 000</option>
                        <option>40 000 - 100 000</option>
                        <option>100 000 - 250 000</option>
                        <option>250 000+</option>
                    </select>
                </div>
            </div>
            <button>Начать поиск</button>
            </p>
        </div>
        <br>
        <h1 class="vacancyes-form h1"><span>Новые вакансии:</span><span> </span></h1>
        <div class="vacancyes-form-vacancyes-field">
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
                </div>
                <button class="vacancyes-form-vacancyes-box">Откликнуться</button>
            </div>
            <div class="vacancyes-form-vacancyes-box">
                <div class="vacancyes-form-vacancyes-box-vacancy">
                    Вакансия:<a href="">Официант (5/2)</a><br>
                    Категория:<span>Сети быстрого питания</span><br>
                    Компания:<span>Макдоналдс Россия</span><br>
                    Город:<span>Самара</span><br>
                    График работы:<span>Сменный график</span><br>
                    Заработная плата (рубли/месяц):<span>30 000</span><br>
                    О вакансии:<div class="vacancyes-form-vacancyes-box-vacancy-about-box"><span>Дружный коллектив,
                            возможности карьерного роста!</span><br></div>
                </div>
                <button class="vacancyes-form-vacancyes-box">Откликнуться</button>
            </div>
        </div>
    </div>
</body>