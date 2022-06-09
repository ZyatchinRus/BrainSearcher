<%@ page import="EntityManagers.VacancyEntityManager" %>
<%@ page import="Entities.Vacancy" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Ilya
  Date: 15.05.2022
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Личный кабинет BS</title>
</head>

<body class="empl-form">
<link rel="stylesheet" type="text/css" href="designe/styles.css">
<header>
    <div class="logotip">
        <img src="designe/brainLogo.svg" height="50px" width="50px">
        <a>BrainSearcher</a>
        <hr>
    </div>
</header>
<div class="main-menu">
    <ul>
        <li><a href="/">Выйти</a></li>
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
                <div class="empl-form-data-point-name">Ф.И.О: <span>${admin.name}<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Полномочия: <span>Администратор<br></span></div>
            </div>
            <hr>
            <div class="empl-form-data-point">
                Статистика:<br>
                <button class="vacancyes-form-vacancyes-box" onclick="window.location.href='/Admin?activity=stat'">Получить статистику</button>
            </div>
        </div>
        
    </div>
    <div class="empl-form-change-data" id="emp-form-2">
        <div class ="empl-form-data-box">
            Непроверенных вакансий на данное время:<span id="VacancyesCount">
            <%
                //лист всех вакансий
                VacancyEntityManager vacancyEntityManager = new VacancyEntityManager();
                List<Vacancy> vacancyList = vacancyEntityManager.getAll();
                List<Vacancy> clearList = new ArrayList<>();
                Iterator<Vacancy> iterator;
                if(vacancyList!=null){
                    iterator = vacancyList.iterator();
                    while(iterator.hasNext()){
                        Vacancy vacancy = iterator.next();
                        if(vacancy.getStatus().equals("На рассмотрении")){
                            clearList.add(vacancy);
                        }
                    }
                    iterator=vacancyList.iterator();
                    out.print(clearList.size());
                }
            %>
        </span>
            <%
                //получение всех вакансий работодателя
                if(clearList!=null) {
                    iterator = clearList.iterator();
                    while (iterator.hasNext()) {
                        Vacancy vacancy = iterator.next();
                        out.print("<div class=\"vacancyes-form-vacancyes-box\">" +
                                "<div class=\"vacancyes-form-vacancyes-box-vacancy>\"" +
                                "Вакансия:<a>" + vacancy.getName() + "</a>" +
                                "<br>" +
                                "Категория:<span>" + vacancy.getCategory() + "</span>" +
                                "<br>" +
                                "Компания:<span>" + vacancy.getCompany() + "</span>" +
                                "<br>" +
                                "График работы:<span>" + vacancy.getWorkSchedule() + "</span>" +
                                "<br>" +
                                "Заработная плата (рубли/месяц):<span>" + vacancy.getSalary().toString() + "</span>" +
                                "<br>" +
                                "О вакансии:" +
                                "<div class=\"vacancyes-form-vacancyes-box-vacancy-about-box\">" +
                                "<span>" + vacancy.getDescription() + "</span>" +
                                "<br>" +
                                "</div>" +
                                "</div>");
                        out.print("<button class=\"vacancyes-form-vacancyes-box\" onclick=\"window.location.href=\'/Admin?vacid="+vacancy.getId()+"\'\">Одобрить вакансию</button>");
                        out.print("<button class=\"vacancyes-form-vacancyes-box\" onclick=\"window.location.href=\'/Admin?noid="+vacancy.getId()+"\'\">Отклонить вакансию</button>");
                        out.print("</div>");
                    }
                }%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
