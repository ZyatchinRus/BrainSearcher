<%@ page import="EntityManagers.VacancyEntityManager" %>
<%@ page import="Entities.Vacancy" %>
<%@ page import="java.util.stream.Stream" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Вакансии BS</title>
    <link rel="stylesheet" type="text/css" href="designe/styles.css">
</head>

<body>
    <header>
        <div class="logotip">
            <img src="designe/brainLogo.svg" height="50px" width="50px" />
            <a href="\">BrainSearcher</a>
            <hr>
        </div>
    </header>
    <div class="main-menu">
        <ul>
            <li><a href="/Vacancy">Вакансии</a></li>
            <%
                String WhoIAm="";
                if(session.getAttribute("employer")!=null){
                out.print("<li><a href=/Employer>Личный кабинет</a></li>");
                WhoIAm="employer";
                }
                else if(session.getAttribute("client")!=null){
                    out.print("<li><a href=/Client>Личный кабинет</a></li>");
                    WhoIAm="client";
                }
            %>
        </ul>
    </div>
    <div class="vacancyes-form">
        <div class="vacancyes-search-field">
            <h1 id="VacancyCount">Всего вакансий на данный момент:
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
                            if(vacancy.getStatus().equals("Одобрена")){
                                clearList.add(vacancy);
                            }
                        }
                        iterator=vacancyList.iterator();
                        out.print(clearList.size());
                    }
                %>
            </h1>
            <p>Найдите подходящую прямо сейчас!
                <hr>
            <h1 class="vacancyes-form h1"><span>Новые вакансии:</span><span> </span></h1>
        </div>
        <br>
        <%
            int count=0;
        //получение всех вакансий работодателя
        if(clearList!=null){
            iterator = clearList.iterator();
        while (iterator.hasNext()) {
            Vacancy vacancy = iterator.next();
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
                                "О вакансии:" +
                                        "<div class=\"vacancyes-form-vacancyes-box-vacancy-about-box\">" +
                                            "<span>" + vacancy.getDescription() + "</span>" +
                                            "<br>"+
                                        "</div>"+
                            "</div>");
                if(WhoIAm=="client"){
                    out.print("<button class=\"vacancyes-form-vacancyes-box\" onclick=\"window.location.href=\'/Vacancyes?vacid="+vacancy.getId().toString()+"\'\"->Откликнуться</button>");

                }
                out.print("</div>");
            }
    }%>
        </div>
    </div>
</body>