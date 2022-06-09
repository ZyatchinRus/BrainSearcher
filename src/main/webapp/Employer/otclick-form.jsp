<%@ page import="java.util.Base64" %>
<%@ page import="Entities.Response" %>
<%@ page import="EntityManagers.VacancyEntityManager" %>
<%@ page import="Entities.Vacancy" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>-->
<!DOCTYPE html>
<html>

<head>
    <title>Вакансии BS</title>
    <link rel="stylesheet" type="text/css" href="../designe/styles.css">
</head>

<body>
    <header>
        <div class="logotip">
            <img src="../designe/brainLogo.svg" height="50px" width="50px" />
            <a href="\">BrainSearcher</a>
            <hr>
        </div>
    </header>
    <div class="main-menu">
        <ul>
            <li><a href="/Vacancyes">Вакансии</a></li>
            <li><a href="/Employer">Личный кабинет</a></li>
        </ul>
    </div>
    <div class="vacancyes-form">
        <h1 class="vacancyes-form h1"><span>Отклики на вакансию:</span>
            <%
                Integer id = Integer.parseInt(request.getParameter("vacid"));
                VacancyEntityManager vacancyEntityManager  = new VacancyEntityManager();
                Vacancy vacancy=vacancyEntityManager.get(id);
                out.print(vacancy.getResponseSet().size());
            %>

            <span> </span></h1>
        <div class="vacancyes-form-vacancyes-field">
            <%
                Set<Response> responseSet = vacancy.getResponseSet();
                Iterator<Response> responseIterator = responseSet.iterator();
                while(responseIterator.hasNext()){
            Response response1 = responseIterator.next();
            out.print("<div class=\"vacancyes-form-vacancyes-box\">");
            out.print("ФИО:<span>"+response1.getIdClient().getName()+"</span><br>");
            out.print("Дата рождения:<span>"+response1.getIdClient().getDate()+"</span><br>");
            out.print("Адрес:<span>"+response1.getIdClient().getAdress()+"</span><br>");
            out.print("О себе:<span>"+response1.getIdClient().getAboutMe()+"</span><br>");
            out.print("Номер телефона:<span>"+response1.getIdClient().getPhoneNumber()+"</span><br>");
            out.print("Место учёбы:<span>"+response1.getIdClient().getStudyPlace()+"</span><br>");
            out.print("<span>Фото:</span>");
            String url = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(response1.getIdClient().getPhoto());
            out.println("<div class=\"photo\">"+
                "<img src=\""+url+"\""+
                " style=\"width: 30%;height: 45%;\">"+
                "</div>");
            out.print("</div>");
            }%>
        </div>
    </div>
</body>