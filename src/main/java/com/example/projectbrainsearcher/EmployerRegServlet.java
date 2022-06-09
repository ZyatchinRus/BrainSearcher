package com.example.projectbrainsearcher;

import Entities.Client;
import Entities.Employer;
import Entities.Vacancy;
import EntityManagers.ClientEntityManager;
import EntityManagers.EmployerEntityManager;
import EntityManagers.VacancyEntityManager;
import org.hibernate.engine.jdbc.BinaryStream;
import org.postgresql.util.ByteStreamWriter;
import javax.persistence.Converter;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.xml.bind.annotation.XmlMimeType;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@MultipartConfig
public class EmployerRegServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    getServletContext().getRequestDispatcher("/persAccountEmployer.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //установка кодировки для обработки параметров на кириллице
        request.setCharacterEncoding("UTF-8");
            if(request.getParameter("formaction").equals("regform")){
                //Создаём нового клиента и заносим его в бд
                EmployerEntityManager employerEntityManager = new EmployerEntityManager();
                Employer employer = new Employer();
                employer.setName(request.getParameter("name"));
                employer.setEmail(request.getParameter("email"));
                employer.setBirthday(LocalDate.parse(request.getParameter("date")));
                employer.setWorkPlace((request.getParameter("work")));
                employer.setLogin(request.getParameter("login"));
                employer.setPhoneNumber(request.getParameter("phone"));
                employer.setPassword(request.getParameter("password"));
                employerEntityManager.add(employer);
                //получаем клиента со сформированным ID
                employer = employerEntityManager.getByLogin(employer.getLogin());
                //создаём сессию и загружаем туда данные только что созданного клиента
                HttpSession session = request.getSession();
                session.setAttribute("employer", employer);
            }else if(request.getParameter("formaction").equals("update")){
                //получаем текущего работодателя из объекта сессии
                Employer employer = (Employer)request.getSession().getAttribute("employer");
                employer.setName(request.getParameter("newName"));
                employer.setBirthday(LocalDate.parse(request.getParameter("date")));
                employer.setEmail(request.getParameter("newEmail"));
                employer.setWorkPlace(request.getParameter("newWorkPlace"));
                employer.setPhoneNumber(request.getParameter("newNumber"));
                employer.setLogin(employer.getLogin());
                if(request.getPart("newPhoto").equals("")!=true) {
                    Part filePart = request.getPart("newPhoto");
                    InputStream inputStream = filePart.getInputStream();
                    DataInputStream dis = new DataInputStream(inputStream);
                    int count = 0;
                    while (dis.read() != -1) count++;
                    inputStream = filePart.getInputStream();
                    dis = new DataInputStream(inputStream);
                    byte[] bytes = new byte[count];
                    dis.readFully(bytes);
                    employer.setPhoto(bytes);
                }
                EmployerEntityManager employerEntityManager = new EmployerEntityManager();
                employerEntityManager.update(employer);
                request.getSession().setAttribute("employer",employer);
            }else if(request.getParameter("formaction").equals("updatePassword")){
                //получаем текущего работодателя из объекта сессии
                Employer employer = (Employer)request.getSession().getAttribute("employer");
                if(request.getParameter("oldPassword").equals(employer.getPassword())) {
                    employer.setPassword(request.getParameter("newPassword"));
                    EmployerEntityManager employerEntityManager = new EmployerEntityManager();
                    employerEntityManager.update(employer);
                    request.getSession().setAttribute("employer",employer);
                    request.setAttribute("message", "Пароль успешно изменён");
                }else{
                    request.setAttribute("message","Старый пароль указан неверно!");
                }
            }else if(request.getParameter("formaction").equals("newVacancy")){
                Employer employer = (Employer) request.getSession().getAttribute("employer");
                EmployerEntityManager employerEntityManager = new EmployerEntityManager();
                VacancyEntityManager vacancyEntityManager = new VacancyEntityManager();
                Vacancy vacancy = new Vacancy();
                vacancy.setName(request.getParameter("name"));
                vacancy.setCategory(request.getParameter("category"));
                vacancy.setCompany(request.getParameter("company"));
                vacancy.setIdEmployer(employer);
                vacancy.setStatus(request.getParameter("status"));
                vacancy.setSalary(Integer.parseInt(request.getParameter("salary")));
                vacancy.setDescription(request.getParameter("description"));
                vacancy.setWorkSchedule(request.getParameter("schedule"));
                vacancy.setStatus("На рассмотрении");
                vacancy=vacancyEntityManager.add(vacancy);
                Set<Vacancy> set2=new HashSet<>();
                if(employer.getVacancySet()!=null){
                    set2 = employer.getVacancySet();
                }
                set2.add(vacancy);
                employer.setVacancySet(set2);
                employerEntityManager.update(employer);
                request.getSession().setAttribute("employer",employer);
            }
        //перенаправляем запрос на страницу
        request.getRequestDispatcher("/persAccountEmployer.jsp").forward(request, response);
    }
}
