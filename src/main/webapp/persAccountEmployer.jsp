<%@ page import="Entities.Employer" %>
<%@ page import="java.util.Base64" %>
<%@ page import="Entities.Vacancy" %>
<%@ page import="java.util.List" %>
<%@ page import="EntityManagers.EmployerEntityManager" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="EntityManagers.VacancyEntityManager" %>
<%@ page import="java.util.Set" %>
<!--<%--
  Created by IntelliJ IDEA.
  User: Ilya
  Date: 16.05.2022
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

    <head>
        <title>BrainSearcher ЛК</title>
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
                <li><a href="/Vacancyes">Вакансии</a></li>
                <li><a href="/Employer">Личный кабинет</a></li>
                <li><a href="/">Выйти</a></li>
            </ul>
        </div>
        <div class="empl-form-head-container">
            Личный кабинет работодателя
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
                    <div class="empl-form-data-point-name">Ф.И.О.:<span>${sessionScope.employer.getName()}<br></span></div>
                </div>
                <div class="empl-form-data-point">
                    <div class="empl-form-data-point-name">Дата рождения:<span>${sessionScope.employer.getBirthday()}<br></span>
                    </div>
                </div>
                 <div class="empl-form-data-point">
                    <div class="empl-form-data-point-name">Email:<span>${sessionScope.employer.getEmail()}<br></span></div>
                 </div>
                    <div class="empl-form-data-point">
                        <div class="empl-form-data-point-name">Номер телефона:<span>${sessionScope.employer.getPhoneNumber()}<br></span></div>
                    </div>
                <div class="empl-form-data-point">
                    <div class="empl-form-data-point-name">Место работы:<span>${sessionScope.employer.getWorkPlace()}<br></span></div>
            </div>
        </div>
        <%
            //скриплет вывода фото работодателя
            Employer employer = (Employer)session.getAttribute("employer");
            //если у данного работодателя не загружена фотография - вывод стандартной
            if(employer.getPhoto()==null){
                out.println("<div class=\"photo\">"+
            "<img src=\"https://catherineasquithgallery.com/uploads/posts/2021-02/1612447191_70-p-chelovechek-na-serom-fone-82.jpg\""+
               " style=\"width: 80%;height: 30%;\">"+
            "</div>");
            }
            else{
                //иначе создаём урл на картинку из бд
                String url = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(employer.getPhoto());
                out.println("<div class=\"photo\">"+
                        "<img src=\""+url+"\""+
                        " style=\"width: 100%;height: 40%;\">"+
                        "</div>");
            }
        %></div>

            <div class="empl-form-change-data" id="emp-form-2">

        <div class ="empl-form-data-box">
            <form method="post" action="/Employer" enctype="multipart/form-data">
            Изменить ФИО:<br><input name="newName" required type="text" value="${sessionScope.employer.getName()}" ><br>
            Изменить дату рождения:<br><input name="date" required type="date" value="${sessionScope.employer.getBirthday()}"><br>
            Изменить Email:<br><input type="text" required name="newEmail" value="${sessionScope.employer.getEmail()}"><br>
            Изменить номер телефона:<br><input type="text" required name="newNumber" value="${sessionScope.employer.getPhoneNumber()}"><br>
            Изменить место работы:<br><input type="text" required name="newWorkPlace" value=" ${sessionScope.employer.getWorkPlace()}"><br>
                Изменить изображение:<br><input type="file" name="newPhoto" value=" ${sessionScope.employer.getPhoto()}"><br>
                <input hidden name="formaction" value="update" type="text">
            <button class="employer-buttons" type="submit">Сохранить изменения</button><br>
            </form>
            Смена пароля:<br>
            <form method="post" action="/Employer" enctype="multipart/form-data">
                Введите старый пароль:<br><input
                    type="password" required name="oldPassword" value=""><br>
                Введите новый пароль:<br><input name="newPassword" type="password" value=""><br>
                <input hidden required type="text" name="formaction" value="updatePassword">
                <button class="employer-buttons" type="submit">Сменить пароль</button><br>
            </form>
        </div>
    </div>

            <div class="empl-form-change-data" id="emp-form-3">
        <div class ="empl-form-data-box">
            Размещено вакансий на данное время:<span id="VacancyesCount">
            <%
                Set<Vacancy> vacancySet = null;
                if(employer.getVacancySet()!=null) {
                    //получение количества вакансий на работодателе
                    vacancySet = employer.getVacancySet();
                        out.print(vacancySet.size());
                }else{
                    out.print("0");
                }
            %></span>
            <%
                //получение всех вакансий работодателя
                if(vacancySet!=null){
            Iterator<Vacancy> vacancyIterator = vacancySet.iterator();
                while (vacancyIterator.hasNext()){
                        Vacancy vacancy = vacancyIterator.next();
                    out.print("<div class=\"vacancyes-form-vacancyes-box\">"+
                            "<div class=\"vacancyes-form-vacancyes-box-vacancy>\""+
                            "Вакансия:<a>" + vacancy.getName() + "</a>"+
                            "<br>"+
                            "Категория:<span>" + vacancy.getCategory() + "</span>"+
                            "<br>"+
                            "Компания:<span>" + vacancy.getCompany() + "</span>"+
                            "<br>"+
                            "График работы:<span>" + vacancy.getWorkSchedule() + "</span>"+
                            "<br>"+
                            "Заработная плата (рубли/месяц):<span>" + vacancy.getSalary().toString() + "</span>"+
                            "<br>"+
                            "Статус вакансии:<span>" + vacancy.getStatus() + "</span>"+"<br>"+
                            "О вакансии:" +
                            "<div class=\"vacancyes-form-vacancyes-box-vacancy-about-box\">" +
                            "<span>" + vacancy.getDescription() + "</span>" +
                            "<br>"+
                            "</div>");
                        if(vacancy.getResponseSet()!=null && vacancy.getResponseSet().size()!=0){
                            out.print("Отклики:<a href=\"\\Employer\\Responses?vacid="+vacancy.getId()+"\" target=\"_blank\" >"+vacancy.getResponseSet().size()+"</a></div>");
                                 }else {
                            out.print("Отклики:<a>0</a></div>");
                        }
                        out.print("</div>");
                    }
                }
            %>
        </div>
        </div>
            <div class="empl-form-change-data" id="emp-form-4">
                <form method="post" action="/Employer" enctype="multipart/form-data">
                    <div class ="empl-form-data-box">
                        Название вакансии:
                        <input type="text" name="name" value=""><br>
                        Категория:
                        <select size="0"  class="vacancyes-search-field-select" required name="category">
                            <option>Выберите категорию</option>
                            <option>Автомобильный бизнес</option>
                            <option>Домашний, обслуживающий персонал</option>
                            <option>Искусство,развлечения</option>
                            <option>Наука, образование</option>
                            <option>Продажи</option>
                            <option>IT</option>
                            <option>Быстрое питание</option>
                            <option>Медицина, фармацевтика</option>
                        </select><br>
                        Компания:<br><input name="company" type="text" value=""><br>
                        График работы:
                        <select size="0" class="vacancyes-search-field-select" name="schedule">
                            <option>Выберите график</option>
                            <option>Полный день</option>
                            <option>Сменный график</option>
                            <option>Удалённая работа</option>
                        </select><br>
                        Заработная плата (рубли):<br><input name="salary" type="text" value=""><br>
                        Описание вакансии:<br>
                        <textarea name="description"></textarea>
                        <input hidden name="formaction" value="newVacancy">
                        <button type="submit" class="employer-buttons">Разместить вакансию</button><br>
                    </div>
                </form>
            </div>
    </body>
</html>
