package com.example.projectbrainsearcher;

import Entities.Admin;
import Entities.Client;
import Entities.Employer;
import EntityManagers.AdminEntityManager;
import EntityManagers.ClientEntityManager;
import EntityManagers.EmployerEntityManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String distPage= "index.jsp";
        String message = "Вы не ввели логин или пароль!";
        if(request.getParameter("login")!="" && request.getParameter("password")!=""){
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            AdminEntityManager adminEntityManager = new AdminEntityManager();
            Admin admin = adminEntityManager.getByLogin(login);
            ClientEntityManager clientEntityManager = new ClientEntityManager();
            Client client = clientEntityManager.getByLogin(login);
            EmployerEntityManager employerEntityManager = new EmployerEntityManager();
            Employer employer = employerEntityManager.getByLogin(login);
            if(admin!=null){
                if(admin.getPassword().equals(password)){
                    distPage="pages/persAccountAdmin.jsp";
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", admin);
                }else{
                    message="Неправильный пароль!";
                }
            }else if(client!=null){
                if(client.getPassword().equals(password)){
                    distPage="pages/persAccountClient.jsp";
                    HttpSession session = request.getSession();
                    session.setAttribute("client", client);
                }else{
                    message="Неправильный пароль!";
                }
            }else if(employer!=null){
                if(employer.getPassword().equals(password)){
                    distPage="pages/persAccountEmployer.jsp";
                    HttpSession session = request.getSession();
                    session.setAttribute("employer", employer);
                }else{
                    message="Неправильный пароль!";
                }
            }
            request.getRequestDispatcher(distPage).forward(request,response);
        }
    }
}
