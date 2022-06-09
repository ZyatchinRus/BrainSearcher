<%@ page import="Entities.Client" %>
<%@ page import="java.util.Base64" %>
<%@ page import="Entities.Response" %>
<%@ page import="java.util.Set" %>
<%@ page import="EntityManagers.ResponseEntityManager" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="EntityManagers.VacancyEntityManager" %>
<%@ page import="Entities.Vacancy" %>
<!--<%--
  Created by IntelliJ IDEA.
  User: Ilya
  Date: 15.05.2022
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%> -->
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
        <li><a href="vacancyes-form.jsp">Вакансии</a></li>
        <li><a href="/Client">Личный кабинет</a></li>
        <li><a href="/">Выйти</a></li>
    </ul>
</div>
<div class="empl-form-head-container">
    Личный кабинет клиента
    <hr>
</div>
<div class="empl-form-data-container">
    <div class="sidenav" id="sidenav">
        <button onclick="change1()">Личные данные</button>
        <button onclick="change2()">Редактировать данные</button>
        <button onclick="change3()">Информация об откликах</button>
        <script>
            function change1() {
                var element1 = document.getElementById("emp-form-1");
                element1.style.display = "flex";
                var element2 = document.getElementById("emp-form-2");
                element2.style.display = "none";
                var element3 = document.getElementById("emp-form-3");
                element3.style.display = "none";
            }
            function change2() {
                var element1 = document.getElementById("emp-form-1");
                element1.style.display = "none";
                var element2 = document.getElementById("emp-form-2");
                element2.style.display = "flex";
                var element3 = document.getElementById("emp-form-3");
                element3.style.display = "none";
            }
            function change3() {
                var element1 = document.getElementById("emp-form-1");
                element1.style.display = "none";
                var element2 = document.getElementById("emp-form-2");
                element2.style.display = "none";
                var element3 = document.getElementById("emp-form-3");
                element3.style.display = "flex";
            }

        </script>
    </div>
    <div class="empl-form-data-photo-box" id="emp-form-1">
        <div class="empl-form-data-box">
            Личные данные:<br>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Ф.И.О.:<span>${sessionScope.client.getName()}<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Дата рождения:<span>${sessionScope.client.getDate()}<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Email:<span>${sessionScope.client.getEmail()}<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Номер телефона:<span>${sessionScope.client.getPhoneNumber()}<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Место учёбы:<span>${sessionScope.client.getStudyPlace()}<br></span></div>
            </div>
            <div class="empl-form-data-point">
                <div class="empl-form-data-point-name">Информация о себе:<span>${sessionScope.client.getAboutMe()}<br></span></div>
            </div>
        </div>
        <%
            //скриплет вывода фото Студента
            Client client = (Client) session.getAttribute("client");
            //если у данного работодателя не загружена фотография - вывод стандартной
            if(client.getPhoto()==null){
               out.println(
                        "<div class=\"photo\">"+
                                "<img src=\"https://catherineasquithgallery.com/uploads/posts/2021-02/1612447191_70-p-chelovechek-na-serom-fone-82.jpg\""+
                                "style=\"width: 80%;height: 30%;\">"+
                                "</div>");
            }else{
                //иначе создаём урл на картинку из бд
                String url = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(client.getPhoto());
                out.println("<div class=\"photo\">"+
                        "<img src=\""+url+"\""+
                        " style=\"width: 100%;height: 40%;\">"+
                        "</div>");
            }
        %>
    </div>
    <div class="empl-form-change-data" id="emp-form-2">
        <div class ="empl-form-data-box">
            <form method="post" enctype="multipart/form-data" action="/Client">
            Изменить ФИО:<br><input type="text" name="newName" value="${sessionScope.client.getName()}"><br>
            Изменить дату рождения:<br><input name="date" type="date" value="${sessionScope.client.getDate()}"><br>
            Изменить Email:<br><input type="text" name="newEmail" value="${sessionScope.client.getEmail()}"><br>
            Изменить номер телефона:<br><input type="text" name="newNumber" value="${sessionScope.client.getPhoneNumber()}"><br>
            Изменить место работы:<br><input type="text" name="newStadyPlace" value="${sessionScope.client.getStudyPlace()}"><br>
            Изменить изображение:<br><input name="newPhoto" type="file"><br>
            Изменить информацию о себе:<br>
            <textarea name="aboutMe">${sessionScope.client.getAboutMe()}</textarea>
                <input hidden name="formaction" type="text" value="update">
            <button type="submit" class="employer-buttons">Сохранить изменения</button><br>
            </form>
            <form method="post" action="/Client" enctype="multipart/form-data">
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
            Откликов на данный момент:<span id="VacancyesCount">
            <%
                Set<Response> responseSet = null;
                if(client.getResponseSet()!=null) {
                    //получение количества откликов на клиенте
                    responseSet = client.getResponseSet();
                    out.print(responseSet.size());
                }else{
                    out.print("0");
                }
            %>
        </span>
            <%
                //получение всех вакансий работодателя
                if(responseSet!=null){
                    ResponseEntityManager responseEntityManager = new ResponseEntityManager();
                    VacancyEntityManager vacancyEntityManager = new VacancyEntityManager();

                    Iterator<Response> responseIterator = responseSet.iterator();
                    while (responseIterator.hasNext()){
                         Response resp = responseIterator.next();
                         Vacancy vacancy = resp.getIdVacancy();
                        out.print("<div" +
                                " class=\"vacancyes-form-vacancyes-box\">");
                        out.print("<div " +
                                "class=\"vacancyes-form-vacancyes-box-vacancy>\"");
                        out.print("Вакансия:<a>"+vacancy.getName()+"</a><br>");
                        out.print("Категория:<span>"+vacancy.getCategory()+"</span><br>");
                        out.print("Компания:<span>"+vacancy.getCompany()+"</span><br>");
                        out.print("График работы:<span>"+vacancy.getWorkSchedule()+"</span><br>");
                        out.print("Заработная плата (рубли/месяц):<span>"+vacancy.getSalary().toString()+"</span><br>");
                        out.print("О вакансии:<div class=\"vacancyes-form-vacancyes-box-vacancy-about-box\"><span>"+vacancy.getDescription()+"</span><br></div>");
                        out.print("Статус отклика:<span>"+resp.getStatus()+"</span><br>");
                        out.print("</div></div>");

                    }
                }
            %>


            </div>
        </div>
    </div>
</div>
</body>
</html>