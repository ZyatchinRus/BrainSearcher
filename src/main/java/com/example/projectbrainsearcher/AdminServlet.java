package com.example.projectbrainsearcher;

import Entities.Admin;
import Entities.Client;
import Entities.Response;
import Entities.Vacancy;
import EntityManagers.ClientEntityManager;
import EntityManagers.ResponseEntityManager;
import EntityManagers.VacancyEntityManager;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.stream.Collectors;


public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("vacid")!=null){
            Integer id = Integer.parseInt(request.getParameter("vacid"));
            VacancyEntityManager vacancyEntityManager = new VacancyEntityManager();
            Vacancy vacancy = vacancyEntityManager.get(id);
            vacancy.setStatus("Одобрена");
            vacancyEntityManager.update(vacancy);
        }else if(request.getParameter("noid")!=null){
            Integer id = Integer.parseInt(request.getParameter("noid"));
            VacancyEntityManager vacancyEntityManager = new VacancyEntityManager();
            Vacancy vacancy = vacancyEntityManager.get(id);
            vacancy.setStatus("Отклонена");
            vacancyEntityManager.update(vacancy);
        }else if(request.getParameter("activity")!=null){
            ServletContext context = getServletContext();
            ServletOutputStream out = response.getOutputStream();
            String fileText = "";
            VacancyEntityManager vacancyEntityManager = new VacancyEntityManager();
            Admin admin = (Admin) request.getSession().getAttribute("admin");
            List<Vacancy> vacancySet = vacancyEntityManager.getAll();
            long countOfVacancy = vacancySet.size() ;
            long countOfOk =  vacancySet.stream().filter((vacancy)->vacancy.getStatus().equals("Одобрена")).count();
            long countOfNotOk = vacancySet.stream().filter((vacancy)->vacancy.getStatus().equals("Отклонена")).count();
            long countOfNoData = countOfVacancy-countOfNotOk-countOfOk;

            //получение максимально встречающихся категорий вакансий через работу с потоками
            String maxType = vacancySet.stream()
                    .map(Vacancy::getCategory)
                    .collect(Collectors.groupingBy(
                            vacancy -> vacancy, LinkedHashMap::new,
                            Collectors.summingInt(x -> 1)
                    ))
                    .entrySet().stream()
                    .max(Map.Entry.comparingByValue())
                    .map(Map.Entry::getKey)
                    .orElse(null);
            //получение максимально встречающихся компаний через работу с потоками
            String maxTypeComp = vacancySet.stream()
                    .map(Vacancy::getCompany)
                    .collect(Collectors.groupingBy(
                            vacancy -> vacancy, LinkedHashMap::new,
                            Collectors.summingInt(x -> 1)
                    ))
                    .entrySet().stream()
                    .max(Map.Entry.comparingByValue())
                    .map(Map.Entry::getKey)
                    .orElse(null);
            Date date = new Date();
            fileText+="Статистика:\n";
            fileText+="Администратор:"+ admin.getName()+"\n";
            fileText+="ID:"+admin.getId()+"\n";
            fileText+="Дата:"+date.toString()+"\n";
            fileText+="---------------------------------------------------\n";
            fileText+="Вакансий в базе данных всего:"+countOfVacancy+"\n";
            fileText+="Одобрены:"+countOfOk+"\n";
            fileText+="Не одобрены:"+countOfNotOk+"\n";
            fileText+="На рассмотрении:"+countOfNoData+"\n";
            fileText+="Наиболее встречающаяся категория вакансий:"+maxType+"\n";
            fileText+="Компания, наиболее часто публикующая вакансии:"+maxTypeComp+"\n";
            byte[]byteArray = fileText.getBytes(StandardCharsets.UTF_8);
            response.setHeader("Content-Disposition", "attachment; filename=\"statistic.txt\"");
            out.write(byteArray);
            out.flush();
            out.close();
        }
        getServletContext().getRequestDispatcher("/persAccountAdmin.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
