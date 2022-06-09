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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        if(request.getSession().getAttribute("admin")!=null || request.getSession().getAttribute("employer")!=null || request.getSession().getAttribute("client")!=null){
            request.getSession().invalidate();
        }
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String login = request.getParameter("login");
            String distPage = "";
            String password = request.getParameter("password");
            AdminEntityManager adminEntityManager = new AdminEntityManager();
            Admin admin = adminEntityManager.getByLogin(login);
            ClientEntityManager clientEntityManager = new ClientEntityManager();
            Client client = clientEntityManager.getByLogin(login);
            EmployerEntityManager employerEntityManager = new EmployerEntityManager();
            Employer employer = employerEntityManager.getByLogin(login);
            if(admin!=null){
                    distPage="/Admin";
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", admin);
            }else if(client!=null){
                    distPage="/Client";
                    HttpSession session = request.getSession();
                    session.setAttribute("client", client);
            }else if(employer!=null) {
                    distPage = "/Employer";
                    HttpSession session = request.getSession();
                    session.setAttribute("employer", employer);
            }
            response.sendRedirect(distPage);
    }
}
